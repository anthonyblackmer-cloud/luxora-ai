import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:luxora_ai/data/iap_product_catalog.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/paywall_bypass.dart';
import 'package:luxora_ai/services/paywall_service.dart';

enum IapPurchaseOutcome {
  success,
  canceled,
  failed,
  pending,
  alreadyOwned,
  storeUnavailable,
  productUnavailable,
}

enum IapRestoreOutcome { restored, noneFound, storeUnavailable, failed }

/// StoreKit / Google Play Billing for city packs and Orlando add-ons.
class IapPurchaseService extends ChangeNotifier {
  IapPurchaseService._();

  static final IapPurchaseService instance = IapPurchaseService._();

  final InAppPurchase _iap = InAppPurchase.instance;

  StreamSubscription<List<PurchaseDetails>>? _purchaseSub;
  bool _initialized = false;
  bool _storeAvailable = false;
  bool _purchaseInFlight = false;
  bool _restoreInFlight = false;

  final Map<String, ProductDetails> _products = {};

  Completer<IapPurchaseOutcome>? _pendingPurchase;
  String? _pendingProductId;

  bool get isInitialized => _initialized;

  bool get storeAvailable => _storeAvailable;

  bool get purchaseInFlight => _purchaseInFlight;

  bool get restoreInFlight => _restoreInFlight;

  Map<String, ProductDetails> get products => Map.unmodifiable(_products);

  /// Debug-only bypass when `--dart-define=SIMULATE_IAP=true` and store unavailable.
  static bool get allowSimulatedPurchases =>
      kDebugMode &&
      const bool.fromEnvironment('SIMULATE_IAP', defaultValue: false);

  Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;

    if (kIsWeb) {
      _storeAvailable = false;
      notifyListeners();
      return;
    }

    try {
      _storeAvailable = await _iap.isAvailable();
    } catch (_) {
      _storeAvailable = false;
    }

    if (!_storeAvailable) {
      notifyListeners();
      return;
    }

    await _purchaseSub?.cancel();
    _purchaseSub = _iap.purchaseStream.listen(
      _onPurchaseUpdates,
      onError: (Object error, StackTrace st) {
        if (kDebugMode) {
          debugPrint('IapPurchaseService stream error: $error\n$st');
        }
        _failPendingPurchase(IapPurchaseOutcome.failed);
      },
    );

    await refreshProducts();
    if (!PaywallBypass.forcePreviewMode) {
      unawaited(restorePurchases(silent: true));
    }
    notifyListeners();
  }

  Future<void> refreshProducts() async {
    if (!_storeAvailable) return;
    notifyListeners();
    try {
      final response =
          await _iap.queryProductDetails(IapProductCatalog.allProductIds);
      if (response.error != null && kDebugMode) {
        debugPrint('IAP query error: ${response.error}');
      }
      _products
        ..clear()
        ..addEntries(response.productDetails.map((p) => MapEntry(p.id, p)));
    } finally {
      notifyListeners();
    }
  }

  String? localizedPriceForCity(String cityId) {
    final productId = IapProductCatalog.productIdForCity(cityId);
    if (productId == null) return null;
    return _products[productId]?.price;
  }

  String? localizedPriceForAddon(String addonId) {
    final productId = IapProductCatalog.productIdForAddon(addonId);
    if (productId == null) return null;
    return _products[productId]?.price;
  }

  Future<IapPurchaseOutcome> purchaseCity(String cityId) async {
    if (!IapProductCatalog.hasStoreProductForCity(cityId)) {
      return IapPurchaseOutcome.productUnavailable;
    }
    if (!CityPackEntitlementStore.instance.isUnlocked(cityId)) {
      return _purchaseProduct(IapProductCatalog.productIdForCity(cityId)!);
    }
    return IapPurchaseOutcome.alreadyOwned;
  }

  Future<IapPurchaseOutcome> purchaseAddon(String addonId) async {
    final productId = IapProductCatalog.productIdForAddon(addonId);
    if (productId == null) return IapPurchaseOutcome.productUnavailable;
    if (CityPackEntitlementStore.instance.isAddonUnlocked(addonId)) {
      return IapPurchaseOutcome.alreadyOwned;
    }
    return _purchaseProduct(productId);
  }

  Future<IapRestoreOutcome> restorePurchases({bool silent = false}) async {
    if (PaywallBypass.forcePreviewMode && !silent) {
      return IapRestoreOutcome.noneFound;
    }
    if (!_storeAvailable) {
      if (allowSimulatedPurchases) return IapRestoreOutcome.noneFound;
      return IapRestoreOutcome.storeUnavailable;
    }
    if (_restoreInFlight) {
      return IapRestoreOutcome.failed;
    }

    _restoreInFlight = true;
    if (!silent) notifyListeners();

    final before = _entitlementCount();
    try {
      await _iap.restorePurchases();
      await Future<void>.delayed(const Duration(seconds: 4));
      final after = _entitlementCount();
      return after > before
          ? IapRestoreOutcome.restored
          : IapRestoreOutcome.noneFound;
    } catch (e, st) {
      if (kDebugMode) debugPrint('IAP restore: $e\n$st');
      return IapRestoreOutcome.failed;
    } finally {
      _restoreInFlight = false;
      if (!silent) notifyListeners();
    }
  }

  int _entitlementCount() {
    final store = CityPackEntitlementStore.instance;
    return store.unlockedCityIds.length + store.unlockedAddonIds.length;
  }

  Future<IapPurchaseOutcome> _purchaseProduct(String productId) async {
    if (_purchaseInFlight) return IapPurchaseOutcome.pending;

    if (!_storeAvailable) {
      if (allowSimulatedPurchases) {
        return _simulatePurchase(productId);
      }
      return IapPurchaseOutcome.storeUnavailable;
    }

    final product = _products[productId];
    if (product == null) {
      await refreshProducts();
      final retry = _products[productId];
      if (retry == null) return IapPurchaseOutcome.productUnavailable;
    }

    final details = _products[productId]!;
    _purchaseInFlight = true;
    _pendingProductId = productId;
    _pendingPurchase = Completer<IapPurchaseOutcome>();
    notifyListeners();

    try {
      final ok = await _iap.buyNonConsumable(
        purchaseParam: PurchaseParam(productDetails: details),
      );
      if (!ok) {
        _clearPendingPurchase();
        return IapPurchaseOutcome.failed;
      }
    } catch (e, st) {
      if (kDebugMode) debugPrint('IAP buy: $e\n$st');
      _clearPendingPurchase();
      return IapPurchaseOutcome.failed;
    }

    try {
      return await _pendingPurchase!.future.timeout(
        const Duration(minutes: 2),
        onTimeout: () {
          _clearPendingPurchase();
          return IapPurchaseOutcome.failed;
        },
      );
    } finally {
      _clearPendingPurchase();
    }
  }

  Future<IapPurchaseOutcome> _simulatePurchase(String productId) async {
    final cityId = IapProductCatalog.cityIdForProduct(productId);
    final addonId = IapProductCatalog.addonIdForProduct(productId);
    if (cityId != null) {
      await PaywallService.grantCityEntitlement(cityId);
      return IapPurchaseOutcome.success;
    }
    if (addonId != null) {
      await PaywallService.grantAddonEntitlement(addonId);
      return IapPurchaseOutcome.success;
    }
    return IapPurchaseOutcome.productUnavailable;
  }

  Future<void> _onPurchaseUpdates(List<PurchaseDetails> purchases) async {
    for (final purchase in purchases) {
      try {
        switch (purchase.status) {
          case PurchaseStatus.pending:
            if (purchase.productID == _pendingProductId) {
              _pendingPurchase?.complete(IapPurchaseOutcome.pending);
            }
          case PurchaseStatus.error:
            if (kDebugMode) {
              debugPrint(
                'IAP purchase error: ${purchase.error?.message}',
              );
            }
            if (purchase.productID == _pendingProductId) {
              _pendingPurchase?.complete(IapPurchaseOutcome.failed);
            }
          case PurchaseStatus.canceled:
            if (purchase.productID == _pendingProductId) {
              _pendingPurchase?.complete(IapPurchaseOutcome.canceled);
            }
          case PurchaseStatus.purchased:
          case PurchaseStatus.restored:
            final userInitiated = purchase.productID == _pendingProductId;
            if (!PaywallBypass.forcePreviewMode || userInitiated) {
              await _deliverPurchase(purchase);
            }
            if (purchase.productID == _pendingProductId) {
              _pendingPurchase?.complete(IapPurchaseOutcome.success);
            }
        }
      } finally {
        if (purchase.pendingCompletePurchase) {
          await _iap.completePurchase(purchase);
        }
      }
    }
    notifyListeners();
  }

  Future<void> _deliverPurchase(PurchaseDetails purchase) async {
    if (!_verifyPurchase(purchase)) return;

    final cityId = IapProductCatalog.cityIdForProduct(purchase.productID);
    if (cityId != null) {
      await PaywallService.grantCityEntitlement(cityId);
      return;
    }

    final addonId = IapProductCatalog.addonIdForProduct(purchase.productID);
    if (addonId != null) {
      await PaywallService.grantAddonEntitlement(addonId);
    }
  }

  bool _verifyPurchase(PurchaseDetails purchase) {
    if (purchase.productID.isEmpty) return false;
    final known = IapProductCatalog.allProductIds.contains(purchase.productID);
    if (!known && kDebugMode) {
      debugPrint('IAP unknown product: ${purchase.productID}');
    }
    return known;
  }

  void _failPendingPurchase(IapPurchaseOutcome outcome) {
    if (_pendingPurchase != null && !_pendingPurchase!.isCompleted) {
      _pendingPurchase!.complete(outcome);
    }
    _clearPendingPurchase();
  }

  void _clearPendingPurchase() {
    _purchaseInFlight = false;
    _pendingProductId = null;
    _pendingPurchase = null;
    notifyListeners();
  }

  @override
  void dispose() {
    unawaited(_purchaseSub?.cancel());
    super.dispose();
  }
}

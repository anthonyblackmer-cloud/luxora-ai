import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/services/iap_purchase_service.dart';

/// User-facing copy for store purchase outcomes.
String iapPurchaseMessage(AppLocalizations l, IapPurchaseOutcome outcome) {
  return switch (outcome) {
    IapPurchaseOutcome.success => l.paywallPurchaseSuccess,
    IapPurchaseOutcome.alreadyOwned => l.paywallRestoreComplete,
    IapPurchaseOutcome.canceled => l.paywallPurchaseCanceled,
    IapPurchaseOutcome.pending => l.paywallPurchasePending,
    IapPurchaseOutcome.storeUnavailable => l.paywallStoreUnavailable,
    IapPurchaseOutcome.productUnavailable => l.paywallProductUnavailable,
    IapPurchaseOutcome.failed => l.paywallPurchaseFailed,
  };
}

String iapRestoreMessage(AppLocalizations l, IapRestoreOutcome outcome) {
  return switch (outcome) {
    IapRestoreOutcome.restored => l.paywallRestoreComplete,
    IapRestoreOutcome.noneFound => l.paywallRestoreNone,
    IapRestoreOutcome.storeUnavailable => l.paywallStoreUnavailable,
    IapRestoreOutcome.failed => l.paywallPurchaseFailed,
  };
}

void showIapSnackBar(BuildContext context, String message) {
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

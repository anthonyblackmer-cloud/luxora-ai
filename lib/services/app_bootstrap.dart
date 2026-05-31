import 'dart:async';

import 'package:luxora_ai/services/active_day_flow_store.dart';
import 'package:luxora_ai/services/active_trip_plan_store.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/city_pack_sync.dart';
import 'package:luxora_ai/services/cloud_trips_auth_service.dart';
import 'package:luxora_ai/services/cloud_trips_entitlement.dart';
import 'package:luxora_ai/services/cloud_trips_sync_service.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/home_base_store.dart';
import 'package:luxora_ai/services/iap_purchase_service.dart';
import 'package:luxora_ai/services/paywall_bypass.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/saved_places_storage.dart';
import 'package:luxora_ai/services/saved_trips_store.dart';
import 'package:luxora_ai/services/supabase_bootstrap.dart';
import 'package:luxora_ai/services/ticket_deals_repository.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/services/unsplash_photo_registry.dart';

/// Minimal work before [runApp]; everything else loads after the first frame.
abstract final class AppBootstrap {
  static Future<void> prepareForFirstFrame() async {
    await CityPackRegistry.instance.load();
    await CityPackEntitlementStore.instance.load();
    if (PaywallBypass.forcePreviewMode) {
      await CityPackEntitlementStore.instance.resetForDebugPreview();
    }
    PlacesRepository.instance.ensureLocalCatalogLoaded();
  }

  static Future<void> loadDeferredServices() async {
    await Future.wait([
      UnsplashPhotoRegistry.instance.ensureLoaded(),
      CityPackEntitlementStore.instance.load(),
      DiscoverRadiusController.instance.load(),
      TicketDealsRepository.instance.load(),
      SavedPlacesStorage.instance.load(),
      SavedTripsStore.instance.load(),
      ActiveTripPlanStore.instance.load(),
      ActiveDayFlowStore.instance.load(),
      TripProfileStore.instance.load(),
      HomeBaseStore.instance.load(),
    ]);

    await IapPurchaseService.instance.initialize();
    await SupabaseBootstrap.initialize();
    await CloudTripsAuthService.instance.initialize();
    if (CloudTripsAuthService.instance.isSignedIn &&
        CloudTripsEntitlement.canUseCloud) {
      unawaited(CloudTripsSyncService.instance.syncAll());
    }
    await PlacesRepository.instance.initialize();
    await CityPackSync.bootstrapAfterLoad();
  }
}

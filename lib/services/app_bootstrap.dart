import 'dart:async';

import 'package:luxora_ai/services/active_trip_plan_store.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/city_pack_sync.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/home_base_store.dart';
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
      TripProfileStore.instance.load(),
      HomeBaseStore.instance.load(),
    ]);

    await SupabaseBootstrap.initialize();
    await PlacesRepository.instance.initialize();
    await CityPackSync.bootstrapAfterLoad();
  }
}

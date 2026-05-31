import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/active_day_flow_store.dart';
import 'package:luxora_ai/services/active_trip_plan_store.dart';
import 'package:luxora_ai/services/agenda_recommendation_service.dart';
import 'package:luxora_ai/services/city_pack_sync.dart';
import 'package:luxora_ai/services/concierge_itinerary_sync.dart';
import 'package:luxora_ai/services/home_base_store.dart';
import 'package:luxora_ai/services/onboarding_preference_mapper.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/trip_feel_interpreter.dart';
import 'package:luxora_ai/services/trip_occasion_interpreter.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';

/// Completes onboarding: persists profile, picks a stay, builds the agenda.
abstract final class OnboardingFinishService {
  static Future<ConciergeItinerarySyncResult?> complete({
    required TripProfile profile,
    required AppLocalizations l,
  }) async {
    await HomeBaseStore.instance.load();
    await ActiveTripPlanStore.instance.load();
    await ActiveDayFlowStore.instance.load();

    PlacesRepository.instance.ensureLocalCatalogLoaded();
    await PlacesRepository.instance.initialize();

    await CityPackSync.switchCity(profile.cityId);

    var enriched = OnboardingPreferenceMapper.enrichForPlanning(profile);
    enriched = TripOccasionInterpreter.apply(
      TripFeelInterpreter.enrich(enriched),
    );
    await TripProfileStore.instance.save(enriched);

    final hotels = AgendaRecommendationService.suggestHotels(
      profile: enriched,
      l: l,
    );
    if (hotels.isNotEmpty) {
      await HomeBaseStore.instance.select(hotels.first.placeId);
    }

    final result = await ConciergeItinerarySync.buildFromProfile(enriched);
    if (result != null) {
      await TripProfileStore.instance.save(result.profile);
    }

    return result;
  }
}

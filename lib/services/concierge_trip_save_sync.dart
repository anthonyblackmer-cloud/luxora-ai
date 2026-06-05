import 'package:luxora_ai/data/saved_trips.dart';
import 'package:luxora_ai/data/trip_plans.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/active_trip_plan_store.dart';
import 'package:luxora_ai/services/concierge_theme_park_planner.dart';
import 'package:luxora_ai/services/concierge_itinerary_patch.dart';
import 'package:luxora_ai/services/smart_itinerary/concierge_intent_place_matcher.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/saved_trips_store.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';

/// Result of explicitly saving the active trip from Concierge.
class ConciergeTripSaveResult {
  const ConciergeTripSaveResult({
    required this.trip,
    required this.chatMessage,
  });

  final SavedTripSummary trip;
  final String chatMessage;
}

/// Saves trips and lists saved collections when the traveler asks Luxora.
abstract final class ConciergeTripSaveSync {
  static const _savePhrases = [
    'save my trip',
    'save this trip',
    'save the trip',
    'save to trips',
    'save to my trips',
    'add to saved trips',
    'add to my trips',
    'add this to trips',
    'bookmark this trip',
    'remember this trip',
    'keep this trip',
  ];

  static const _listPhrases = [
    'saved trips',
    'my saved trips',
    'my trips',
    'show my trips',
    'list my trips',
    'what trips',
    'which trips',
    'trips do i have',
    'trips have i saved',
    'open my trips',
  ];

  static const _planningPhrases = [
    'plan a',
    'plan my',
    'plan an',
    'plan our',
    'plan the',
    'plan for',
    'build a',
    'build my',
    'create a',
    'create my',
    'make a',
    'make an',
    'make me a',
    'make me an',
    'schedule a',
    'schedule my',
    'add a stop',
    'add to my day',
    'itinerary for',
    'itinerary to',
    'day with',
    'day at',
    'trip to',
    'trip for',
    'excursion',
    'itinerary',
  ];

  /// Non-English save / list / planning cues (Concierge UI is multilingual).
  static const _savePhrasesIntl = [
    // Russian
    'сохрани мою поездку',
    'сохрани поездку',
    'сохранить поездку',
    'сохраните поездку',
    'сохрани в поездки',
    'сохранить в поездки',
    'добавь в поездки',
    'добавить в поездки',
    'запомни поездку',
    // Spanish
    'guarda mi viaje',
    'guardar mi viaje',
    'guardar viaje',
    // French
    'enregistre mon voyage',
    'enregistrer mon voyage',
    // German
    'speichere meine reise',
    'reise speichern',
    // Portuguese
    'salvar minha viagem',
    'salve minha viagem',
    // Italian
    'salva il mio viaggio',
    'salva la mia vacanza',
    // Chinese
    '保存我的行程',
    '保存行程',
    // Japanese
    '旅行を保存',
    // Korean
    '여행 저장',
  ];

  static const _listPhrasesIntl = [
    'мои поездки',
    'сохранённые поездки',
    'сохраненные поездки',
    'покажи поездки',
    'какие поездки',
    'mis viajes guardados',
    'mes voyages enregistrés',
    'meine gespeicherten reisen',
    'minhas viagens salvas',
  ];

  static const _planningPhrasesIntl = [
    // Russian
    'спланируй',
    'спланировать',
    'составь маршрут',
    'составить маршрут',
    'маршрут на',
    'маршрут в',
    'расписание на',
    'расписание для',
    'план на',
    'план поездки',
    'поездку в',
    'день в',
    'дней в',
    // Spanish
    'planifica mi',
    'planificar',
    'itinerario para',
    // French
    'planifie mon',
    'planifier',
    'itinéraire pour',
    // German
    'plane meine',
    'plane meinen',
    'reise planen',
    // Portuguese
    'planeje minha',
    'planejar',
    // Italian
    'pianifica il',
    'pianifica la',
    // Chinese / Japanese / Korean (common loanwords + verbs)
    '规划',
    '行程',
    'プラン',
    '일정',
  ];

  static bool wantsSaveTrip(String message) {
    final lower = _normalize(message);
    if (_savePhrases.any(lower.contains)) return true;
    if (_savePhrasesIntl.any(lower.contains)) return true;
    if (_russianSaveIntent(lower)) return true;
    return false;
  }

  static bool _russianSaveIntent(String lower) {
    if (!lower.contains('сохран') && !lower.contains('запомни')) {
      return false;
    }
    return lower.contains('поезд') ||
        lower.contains('trips') ||
        lower.contains('trip');
  }

  static bool wantsListSavedTrips(String message) {
    final lower = _normalize(message);
    if (_listPhrases.any(lower.contains)) return true;
    if (_listPhrasesIntl.any(lower.contains)) return true;
    if (RegExp(r'\b(show|list|what|which)\b.*\btrips?\b').hasMatch(lower)) {
      return true;
    }
    return RegExp(
      r'(покажи|какие|список).{0,24}(поездк|trips)',
    ).hasMatch(lower);
  }

  static bool shouldSkipItineraryRebuild(String message) {
    if (wantsListSavedTrips(message)) return true;
    if (wantsSaveTrip(message) && !hasPlanningIntent(message)) return true;
    return false;
  }

  /// True when the traveler (or recalled trip feel) is asking to build/update agenda.
  static bool shouldRebuildItinerary(String message) {
    final trimmed = message.trim();
    if (trimmed.isEmpty) return false;
    if (shouldSkipItineraryRebuild(trimmed)) return false;
    if (ConciergeThemeParkPlanner.parseIntent(trimmed).isExcursion) return true;
    if (ConciergeIntentPlaceMatcher.hasActivitySchedulingIntent(trimmed)) {
      return true;
    }
    return hasPlanningIntent(trimmed);
  }

  /// True when an existing saved plan should receive a surgical patch, not a full rebuild.
  static bool shouldPatchItinerary(
    String message, {
    TripPlan? existingPlan,
    TripProfile? profile,
  }) {
    if (existingPlan == null || existingPlan.days.isEmpty) return false;
    final base = profile ?? TripProfileStore.instance.profile.value ?? const TripProfile();
    return ConciergeItineraryPatch.shouldPatch(message, existingPlan, base);
  }

  static bool hasPlanningIntent(String message) {
    final lower = _normalize(message);
    if (_planningPhrases.any(lower.contains)) return true;
    if (_planningPhrasesIntl.any(lower.contains)) return true;
    if (RegExp(
      r'\b(\d+|one|two|three|four|five|six|seven)[\s-]*(day|night)',
    ).hasMatch(lower)) {
      return true;
    }
    return RegExp(
      r'(\d+|один|два|три|четыре|пять|шесть|семь)[\s-]*(день|дня|дней|ноч)',
    ).hasMatch(lower);
  }

  static String _normalize(String message) =>
      message.toLowerCase().replaceAll('ё', 'е').trim();

  static Future<ConciergeTripSaveResult> saveCurrentTrip({
    TripProfile? profile,
    TripPlan? plan,
    required String localeName,
    required AppLocalizations l,
  }) async {
    final base =
        profile ?? TripProfileStore.instance.profile.value ?? const TripProfile();
    final cityId =
        base.cityId.isNotEmpty ? base.cityId : CityPackRegistry.instance.active.cityId;

    await ActiveTripPlanStore.instance.load();
    final activePlan =
        plan ?? ActiveTripPlanStore.instance.planFor(cityId) ?? samplePlanForActiveCity();

    final trip = await _buildSummary(
      profile: base,
      plan: activePlan,
      localeName: localeName,
      flexibleDateLabel: l.tripsDatesFlexible,
    );

    await SavedTripsStore.instance.upsert(trip);

    final message = trip.experienceCount > 0
        ? l.conciergeTripSavedWithStops(trip.title, trip.experienceCount)
        : l.conciergeTripSaved(trip.title);

    return ConciergeTripSaveResult(trip: trip, chatMessage: message);
  }

  static Future<String> listSavedTripsSummary({
    required AppLocalizations l,
    String? cityId,
  }) async {
    await SavedTripsStore.instance.load();
    final activeCity = cityId ?? CityPackRegistry.instance.active.cityId;
    final all = SavedTripsStore.instance.trips.value;
    final visible = all.where((t) => t.matchesActiveCity(activeCity)).toList();
    final trips = visible.isNotEmpty ? visible : all;

    if (trips.isEmpty) {
      return l.conciergeSavedTripsEmpty;
    }

    final buffer = StringBuffer(l.conciergeSavedTripsIntro(trips.length));
    buffer.writeln();
    for (final trip in trips.take(6)) {
      buffer.writeln(
        l.conciergeSavedTripLine(
          trip.title,
          trip.dateRange.isEmpty ? l.tripsDatesFlexible : trip.dateRange,
          trip.timelineStatus,
        ),
      );
    }
    buffer.write('\n${l.conciergeSavedTripsHint}');
    return buffer.toString().trim();
  }

  static Future<SavedTripSummary> upsertFromItinerary({
    required TripProfile profile,
    required TripPlan plan,
    required String timelineSnapshot,
    String? nextExperience,
  }) async {
    final trip = await _buildSummary(
      profile: profile,
      plan: plan,
      timelineSnapshot: timelineSnapshot,
      nextExperience: nextExperience,
    );
    await SavedTripsStore.instance.upsert(trip);
    return trip;
  }

  static Future<SavedTripSummary> _buildSummary({
    required TripProfile profile,
    required TripPlan plan,
    String? timelineSnapshot,
    String? nextExperience,
    String localeName = 'en',
    String flexibleDateLabel = 'Dates flexible',
  }) async {
    final experienceCount =
        plan.days.fold<int>(0, (count, day) => count + day.items.length);
    final snapshot = timelineSnapshot ??
        plan.days
            .expand((day) => day.items)
            .map((item) => item.title)
            .join(' → ');
    final nextStop = nextExperience ??
        (plan.days.isEmpty || plan.days.first.items.isEmpty
            ? null
            : plan.days.first.items.first.title);

    final base = SavedTripSummary.fromProfile(
      profile,
      localeName: localeName,
      flexibleDateLabel: flexibleDateLabel,
    );

    return base.copyWith(
      experienceCount: experienceCount,
      timelineSnapshot: snapshot.isEmpty ? null : snapshot,
      nextExperience: nextStop,
      routeOptimized: experienceCount > 0,
      timelineStatus:
          experienceCount > 0 ? 'Itinerary ready' : 'Saved from Concierge',
      moodTags: profile.moods.isEmpty ? base.moodTags : base.moodTags,
    );
  }

  static List<Map<String, String>> savedTripsForContext({String? cityId}) {
    final activeCity = cityId ?? CityPackRegistry.instance.active.cityId;
    final all = SavedTripsStore.instance.trips.value;
    final visible = all.where((t) => t.matchesActiveCity(activeCity)).toList();
    final trips = visible.isNotEmpty ? visible : all;
    return trips.take(5).map((trip) {
      return {
        'title': trip.title,
        'dateRange': trip.dateRange,
        'status': trip.timelineStatus,
      };
    }).toList();
  }
}

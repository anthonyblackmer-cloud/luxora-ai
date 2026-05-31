import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/concierge_itinerary_sync.dart';
import 'package:luxora_ai/services/concierge_theme_park_planner.dart';
import 'package:luxora_ai/services/onboarding_preference_mapper.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/trip_profile_build_intent.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  setUpAll(() async {
    await initializeDateFormatting('en_US');
    await CityPackRegistryLoadForTest.load();
    await PlacesRepository.instance.initialize();
  });

  test('planningMessage encodes occasion and dates', () {
    const profile = TripProfile(
      destination: 'Orlando',
      startDate: '2026-03-14',
      endDate: '2026-03-17',
      occasion: TripOccasion.disneyAdventure,
      foodieInterest: 80,
    );
    final message = TripProfileBuildIntent.planningMessage(profile);
    expect(message.toLowerCase(), contains('4-day'));
    expect(message.toLowerCase(), contains('disney'));
    expect(message.toLowerCase(), contains('universal'));
    expect(
      ConciergeThemeParkPlanner.parseIntent(message).isExcursion,
      isTrue,
    );
  });

  test('planningMessage uses romantic cues for anniversary', () {
    const profile = TripProfile(
      destination: 'Miami',
      cityId: 'miami',
      occasion: TripOccasion.coupleAnniversary,
      tripFeel: 'sunset dinners every night',
    );
    final message = TripProfileBuildIntent.planningMessage(profile);
    expect(message.toLowerCase(), contains('romantic'));
    expect(message, contains('sunset dinners'));
  });

  test('buildFromProfile creates agenda for onboarding 2.0 profile', () async {
    var profile = TripProfile(
      cityId: 'orlando',
      destination: 'Orlando',
      startDate: '2026-03-14',
      endDate: '2026-03-16',
      travelerType: TravelerType.couple,
      tripStyles: const [TripStyle.luxury, TripStyle.foodie, TripStyle.romance],
      hotelTypePreferences: const [HotelTypePreference.boutiqueHotel],
      hotelBudgetLevel: HotelBudgetLevel.three,
      cuisinePreferences: const [CuisinePreference.fineDining],
      diningPreferences: const [DiningPreference.dateNight],
      vacationGoals: const [VacationGoal.bestFood, VacationGoal.romance],
      desiredTripEmotion: DesiredTripEmotion.romantic,
      occasion: TripOccasion.general,
      moods: const [TripMood.luxurious, TripMood.relaxing],
    );
    profile = OnboardingPreferenceMapper.enrichForPlanning(profile);

    final message = TripProfileBuildIntent.planningMessage(profile);
    expect(message.toLowerCase(), contains('romantic'));

    final result = await ConciergeItinerarySync.buildFromProfile(profile);

    expect(result, isNotNull);
    expect(result!.plan.days, isNotEmpty);
    expect(result.flow.blocks, isNotEmpty);
  });
}

/// Minimal city pack bootstrap for unit tests.
abstract final class CityPackRegistryLoadForTest {
  static Future<void> load() async {
    await CityPackRegistry.instance.load();
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/l10n/app_localizations_en.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/agenda_recommendation_service.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/hotel_intelligence_service.dart';
import 'package:luxora_ai/services/onboarding_preference_mapper.dart';
import 'package:luxora_ai/services/trip_budget_mapper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await CityPackRegistry.instance.load();
    await CityPackEntitlementStore.instance.clearAll();
    await CityPackEntitlementStore.instance.unlockCity('orlando');
    await CityPackEntitlementStore.instance.unlockAddon('theme-parks');
  });

  test('budget maps low spend to budget tiers', () {    const profile = TripProfile(budgetUsd: 2500, luxuryLevel: LuxuryLevel.comfortable);
    expect(TripBudgetMapper.hotelPriceRange(profile), HotelPriceRange.moderate);
    expect(TripBudgetMapper.diningPriceTier(profile), DiningPriceTier.moderate);
  });

  test('budget maps high spend to luxury tiers', () {
    const profile = TripProfile(
      budgetUsd: 20000,
      luxuryLevel: LuxuryLevel.ultraLuxury,
    );
    expect(TripBudgetMapper.hotelPriceRange(profile), HotelPriceRange.luxury);
    expect(TripBudgetMapper.diningPriceTier(profile), DiningPriceTier.luxury);
  });

  test('mid budget maps to upscale when premium luxury level', () {
    const profile = TripProfile(budgetUsd: 6000, luxuryLevel: LuxuryLevel.premium);
    expect(TripBudgetMapper.hotelPriceRange(profile), HotelPriceRange.upscale);
  });

  test('budget friendly hotel type caps target at budget tier', () {
    const profile = TripProfile(
      hotelBudgetLevel: HotelBudgetLevel.two,
      luxuryLevel: LuxuryLevel.premium,
      hotelTypePreferences: [HotelTypePreference.budgetFriendly],
    );
    expect(TripBudgetMapper.hotelPriceRange(profile), HotelPriceRange.budget);
  });

  test('onboarding mapper syncs budget friendly to lowest hotel tier', () {
    const profile = TripProfile(
      hotelBudgetLevel: HotelBudgetLevel.three,
      hotelTypePreferences: [HotelTypePreference.budgetFriendly],
    );
    final enriched = OnboardingPreferenceMapper.enrichForPlanning(profile);
    expect(enriched.hotelBudgetLevel, HotelBudgetLevel.one);
    expect(enriched.budgetUsd, 3000);
    expect(TripBudgetMapper.hotelPriceRange(enriched), HotelPriceRange.budget);
  });

  test('budget friendly profile ranks I-Drive value hotels first', () async {
    const profile = TripProfile(
      hotelTypePreferences: [HotelTypePreference.budgetFriendly],
      hotelBudgetLevel: HotelBudgetLevel.two,
      kids: 2,
      adults: 2,
    );
    final enriched = OnboardingPreferenceMapper.enrichForPlanning(profile);
    final hotels = AgendaRecommendationService.suggestHotels(
      profile: enriched,
      l: AppLocalizationsEn(),
    );

    expect(hotels, isNotEmpty);
    for (final hotel in hotels.take(3)) {
      expect(
        hotel.priceRange,
        anyOf(HotelPriceRange.budget, HotelPriceRange.moderate),
        reason: '${hotel.name} should not rank above moderate for budget travelers',
      );
    }
    expect(
      hotels.first.priceRange,
      HotelPriceRange.budget,
      reason: 'Top pick should be a budget-tier hotel',
    );
  });

  test('budget friendly matchmaker input deprioritizes upscale resorts', () {
    final results = HotelIntelligenceService.match(
      input: const HotelMatchmakerInput(
        budget: HotelPriceRange.budget,
        adults: 2,
        kids: 2,
        luxuryLevel: 1,
        preferredVibes: ['budgetFriendly'],
        plannedAttractions: ['disney'],
      ),
      l: AppLocalizationsEn(),
    );

    expect(results, isNotEmpty);
    expect(results.first.hotel.priceRange, HotelPriceRange.budget);
    expect(
      results.any((r) => r.hotel.id == 'hotel-intel-idrive-value'),
      isTrue,
    );
  });
}
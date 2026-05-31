import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/trip_budget_mapper.dart';

void main() {
  test('budget maps low spend to budget tiers', () {
    const profile = TripProfile(budgetUsd: 2500, luxuryLevel: LuxuryLevel.comfortable);
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
}

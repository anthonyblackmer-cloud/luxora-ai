import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
import 'package:luxora_ai/models/trip_profile.dart';

/// Inferred dining price band — curated places lack live menu prices.
enum DiningPriceTier {
  budget,
  moderate,
  upscale,
  luxury,
}

/// Maps onboarding budget + luxury level to hotel and dining tiers.
abstract final class TripBudgetMapper {
  static HotelPriceRange hotelPriceRange(TripProfile profile) {
    var target = switch (profile.hotelBudgetLevel) {
      HotelBudgetLevel.one => HotelPriceRange.budget,
      HotelBudgetLevel.two => HotelPriceRange.moderate,
      HotelBudgetLevel.three => HotelPriceRange.upscale,
      HotelBudgetLevel.four => HotelPriceRange.luxury,
    };

    final budgetConstrained =
        profile.hotelTypePreferences.contains(HotelTypePreference.budgetFriendly) ||
        profile.vacationGoals.contains(VacationGoal.saveMoney);

    if (profile.hotelTypePreferences.contains(HotelTypePreference.budgetFriendly)) {
      target = _lowerTier(target, HotelPriceRange.budget);
    }
    if (profile.vacationGoals.contains(VacationGoal.saveMoney)) {
      target = _lowerTier(target, HotelPriceRange.moderate);
    }

    if (!budgetConstrained) {
      if (profile.hotelTypePreferences.contains(HotelTypePreference.luxuryResort) ||
          profile.hotelTypePreferences.contains(HotelTypePreference.adultsOnly)) {
        target = _higherTier(target, HotelPriceRange.upscale);
      }
      final fromLuxury = switch (profile.luxuryLevel) {
        LuxuryLevel.comfortable => HotelPriceRange.moderate,
        LuxuryLevel.premium => HotelPriceRange.upscale,
        LuxuryLevel.ultraLuxury => HotelPriceRange.luxury,
      };
      target = _higherTier(target, fromLuxury);
    }

    return target;
  }

  /// Trip-fit score for a hotel vs the profile's target tier (higher = better).
  static int hotelBudgetFitScore(HotelPriceRange hotel, HotelPriceRange target) {
    final diff = hotelTierRank(hotel) - hotelTierRank(target);
    final abs = diff.abs();
    var score = switch (abs) {
      0 => 30,
      1 => 18,
      2 => 6,
      _ => -10,
    };
    if (diff > 0) {
      score -= diff * 22;
    }
    return score;
  }

  static DiningPriceTier diningPriceTier(TripProfile profile) {
    final fromBudget = _diningTierFromBudgetUsd(profile.budgetUsd);
    final fromLuxury = switch (profile.luxuryLevel) {
      LuxuryLevel.comfortable => DiningPriceTier.moderate,
      LuxuryLevel.premium => DiningPriceTier.upscale,
      LuxuryLevel.ultraLuxury => DiningPriceTier.luxury,
    };
    return _higherDiningTier(fromBudget, fromLuxury);
  }

  static DiningPriceTier tierForPlace(LuxPlace place) {
    final tags = {for (final t in place.moodTags) t.toLowerCase()};
    if (tags.contains('fine-dining') ||
        (tags.contains('luxury') && tags.contains('romantic'))) {
      return DiningPriceTier.luxury;
    }
    if (tags.contains('luxury') || tags.contains('romantic')) {
      return DiningPriceTier.upscale;
    }
    if (tags.contains('family') || tags.contains('trending')) {
      return DiningPriceTier.moderate;
    }
    if (tags.contains('casual') || tags.contains('budget')) {
      return DiningPriceTier.budget;
    }
    return DiningPriceTier.moderate;
  }

  static int diningTierRank(DiningPriceTier tier) => switch (tier) {
        DiningPriceTier.budget => 1,
        DiningPriceTier.moderate => 2,
        DiningPriceTier.upscale => 3,
        DiningPriceTier.luxury => 4,
      };

  static int hotelTierRank(HotelPriceRange range) => switch (range) {
        HotelPriceRange.budget => 1,
        HotelPriceRange.moderate => 2,
        HotelPriceRange.upscale => 3,
        HotelPriceRange.luxury => 4,
      };

  static int diningFitScore(DiningPriceTier place, DiningPriceTier target) {
    final diff = (diningTierRank(place) - diningTierRank(target)).abs();
    return switch (diff) {
      0 => 24,
      1 => 14,
      2 => 4,
      _ => -8,
    };
  }

  static DiningPriceTier _diningTierFromBudgetUsd(int budgetUsd) {
    if (budgetUsd >= 15000) return DiningPriceTier.luxury;
    if (budgetUsd >= 8000) return DiningPriceTier.upscale;
    if (budgetUsd >= 4000) return DiningPriceTier.moderate;
    return DiningPriceTier.budget;
  }

  static HotelPriceRange _higherTier(HotelPriceRange a, HotelPriceRange b) =>
      hotelTierRank(a) >= hotelTierRank(b) ? a : b;

  static HotelPriceRange _lowerTier(HotelPriceRange a, HotelPriceRange b) =>
      hotelTierRank(a) <= hotelTierRank(b) ? a : b;

  static DiningPriceTier _higherDiningTier(DiningPriceTier a, DiningPriceTier b) =>
      diningTierRank(a) >= diningTierRank(b) ? a : b;
}

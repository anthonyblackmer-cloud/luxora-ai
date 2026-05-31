import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/onboarding_l10n_helpers.dart';
import 'package:luxora_ai/models/discover_radius.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/agenda_recommendation_service.dart';
import 'package:luxora_ai/services/onboarding_preference_mapper.dart';
import 'package:luxora_ai/services/places_repository.dart';

class OnboardingSummaryInsight {
  const OnboardingSummaryInsight({required this.label});

  final String label;
}

class OnboardingSummaryPreview {
  const OnboardingSummaryPreview({
    required this.insights,
    required this.hotels,
    required this.restaurants,
    required this.hiddenGems,
    required this.experiences,
  });

  final List<OnboardingSummaryInsight> insights;
  final List<LuxHotel> hotels;
  final List<LuxPlace> restaurants;
  final List<LuxPlace> hiddenGems;
  final List<LuxPlace> experiences;
}

/// Builds the concierge summary shown at the end of onboarding.
abstract final class OnboardingSummaryService {
  static OnboardingSummaryPreview build({
    required TripProfile profile,
    required AppLocalizations l,
  }) {
    final enriched = OnboardingPreferenceMapper.enrichForPlanning(profile);
    final insights = _insights(enriched, l);
    final hotels =
        AgendaRecommendationService.suggestHotels(profile: enriched, l: l);
    final restaurants = _restaurants(enriched);
    final gems = _hiddenGems(enriched);
    final experiences = _experiences(enriched);

    return OnboardingSummaryPreview(
      insights: insights,
      hotels: hotels.take(3).toList(),
      restaurants: restaurants.take(3).toList(),
      hiddenGems: gems.take(3).toList(),
      experiences: experiences.take(3).toList(),
    );
  }

  static List<OnboardingSummaryInsight> _insights(
    TripProfile p,
    AppLocalizations l,
  ) {
    final lines = <OnboardingSummaryInsight>[];

    if (p.hotelTypePreferences.isNotEmpty) {
      lines.add(
        OnboardingSummaryInsight(
          label: l.onboardSummaryHotelType(
            onboardingHotelTypeLabel(l, p.hotelTypePreferences.first),
          ),
        ),
      );
    } else {
      lines.add(OnboardingSummaryInsight(label: l.onboardSummaryHotelDefault));
    }

    if (p.cuisinePreferences.contains(CuisinePreference.rooftopDining)) {
      lines.add(
        OnboardingSummaryInsight(label: l.onboardSummaryRooftopDining),
      );
    } else if (p.cuisinePreferences.isNotEmpty) {
      lines.add(
        OnboardingSummaryInsight(
          label: l.onboardSummaryCuisine(
            onboardingCuisineLabel(l, p.cuisinePreferences.first),
          ),
        ),
      );
    }

    if (p.tripStyles.contains(TripStyle.hiddenGems) ||
        p.vacationGoals.contains(VacationGoal.hiddenGems)) {
      lines.add(
        OnboardingSummaryInsight(label: l.onboardSummaryHiddenGemsInsight),
      );
    }

    lines.add(
      OnboardingSummaryInsight(
        label: l.onboardSummaryPace(onboardingPaceLabel(l, p.pace)),
      ),
    );

    if (p.desiredTripEmotion == DesiredTripEmotion.romantic ||
        p.tripStyles.contains(TripStyle.romance)) {
      lines.add(OnboardingSummaryInsight(label: l.onboardSummaryRomantic));
    } else {
      lines.add(
        OnboardingSummaryInsight(
          label: l.onboardSummaryEmotion(
            onboardingEmotionLabel(l, p.desiredTripEmotion),
          ),
        ),
      );
    }

    if (p.luxuryLevel == LuxuryLevel.ultraLuxury ||
        p.hotelBudgetLevel == HotelBudgetLevel.four) {
      lines.add(OnboardingSummaryInsight(label: l.onboardSummaryPremiumGems));
    }

    return lines.take(6).toList();
  }

  static List<LuxPlace> _restaurants(TripProfile p) {
    const stubDay = TripDay(dayNumber: 1, label: 'Day 1', items: []);
    final suggestions = AgendaRecommendationService.suggestRestaurantsForDay(
      day: stubDay,
      profile: p,
    );
    return suggestions.map((s) => s.place).toList();
  }

  static List<LuxPlace> _hiddenGems(TripProfile p) {
    final cityId = p.cityId;
    final gems =
        PlacesRepository.instance.gemsWithinRadius(DiscoverRadius.miles25);
    return gems
        .where((g) => (g.cityPackId ?? 'orlando') == cityId)
        .take(6)
        .toList();
  }

  static List<LuxPlace> _experiences(TripProfile p) {
    final pool = PlacesRepository.instance.placesWithinRadius(
      DiscoverRadius.miles50,
    );
    final keywords = p.experiencePreferences.map((e) => e.name).toSet();
    final scored = <(LuxPlace, int)>[];
    for (final place in pool) {
      if (place.category == LuxPlaceCategory.dining) continue;
      var score = 50;
      if (place.source == LuxPlaceSource.curated) score += 10;
      final blob = '${place.title} ${place.location}'.toLowerCase();
      for (final key in keywords) {
        if (blob.contains(key.replaceAll('_', ' ')) ||
            place.moodTags.any((t) => t.toLowerCase().contains(key))) {
          score += 15;
        }
      }
      scored.add((place, score));
    }
    scored.sort((a, b) => b.$2.compareTo(a.$2));
    return scored.map((e) => e.$1).take(6).toList();
  }
}

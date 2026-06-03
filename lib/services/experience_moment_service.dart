import 'package:luxora_ai/data/experience_moments_registry.dart';
import 'package:luxora_ai/models/experience_moment.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';

/// Surfaces curated iconic moments on itineraries and place detail.
abstract final class ExperienceMomentService {
  static String _cityId(String? cityId) =>
      cityId ?? CityPackRegistry.instance.active.cityId;

  static ExperienceMoment? primaryMoment({
    required String placeId,
    DayPhase? phase,
    TripProfile? profile,
    String? cityId,
  }) {
    final resolvedCity = _cityId(profile?.cityId ?? cityId);
    final candidates = ExperienceMomentsRegistry.forPlace(resolvedCity, placeId);
    if (candidates.isEmpty) return null;

    final scored = <({ExperienceMoment moment, double score})>[];
    for (final moment in candidates) {
      if (phase != null &&
          moment.phase != null &&
          moment.phase != phase) {
        continue;
      }
      var score = moment.priority.toDouble();
      score += _profileBoost(moment, profile, resolvedCity);
      if (phase != null && moment.phase == phase) score += 12;
      scored.add((moment: moment, score: score));
    }

    if (scored.isEmpty) {
      return candidates.reduce(
        (a, b) => a.priority >= b.priority ? a : b,
      );
    }

    scored.sort((a, b) => b.score.compareTo(a.score));
    return scored.first.moment;
  }

  static String lineForSegment({
    required String placeId,
    required DayPhase phase,
    required String routeDescription,
    TripProfile? profile,
    String? cityId,
  }) {
    final moment = primaryMoment(
      placeId: placeId,
      phase: phase,
      profile: profile,
      cityId: cityId,
    );
    if (moment != null) {
      return moment.conciergeLine;
    }
    return routeDescription;
  }

  static String lineForBlock({
    required DayBlock block,
    required String Function(DayBlockReason reason, String description)
        fallback,
    String? cityId,
  }) {
    final moment = primaryMoment(
      placeId: block.place.id,
      phase: block.phase,
      cityId: cityId,
    );
    if (moment != null) {
      return moment.conciergeLine;
    }
    return fallback(block.reason, block.place.description);
  }

  static String? insiderTipForPlace(
    String placeId, {
    String? cityId,
  }) {
    final moment = primaryMoment(
      placeId: placeId,
      cityId: cityId,
    );
    return moment?.insiderTip;
  }

  static List<String> setupHighlights(
    TripProfile profile, {
    String? cityId,
  }) {
    final resolvedCity = _cityId(cityId ?? profile.cityId);
    return switch (resolvedCity) {
      'orlando' => _orlandoSetupHighlights(profile),
      'vegas' => _vegasSetupHighlights(profile),
      'nyc' => _nycSetupHighlights(profile),
      'miami' => _miamiSetupHighlights(profile),
      _ => _genericSetupHighlights(profile, resolvedCity),
    };
  }

  static List<String> _orlandoSetupHighlights(TripProfile profile) {
    final out = <String>[];
    if (_wantsNightSpectacles(profile)) {
      out.add(
        'Build around iconic night shows — Magic Kingdom fireworks, EPCOT lagoon spectaculars, Fantasmic!, and Hogwarts castle lights.',
      );
    }
    if (profile.experiencePreferences
            .contains(ExperiencePreference.waterParks) ||
        profile.experiencePreferences.contains(ExperiencePreference.themeParks)) {
      out.add(
        'Mix dry parks with Typhoon Lagoon, Blizzard Beach, or Volcano Bay reset days.',
      );
    }
    if (profile.experiencePreferences.contains(ExperiencePreference.liveShows)) {
      out.add(
        'Prioritize live shows and parades — not just rides — on park days.',
      );
    }
    if (profile.foodieInterest >= 55) {
      out.add(
        'Work in fireworks-view dining (California Grill, Narcoossee\'s veranda) when you want the show without the crowds.',
      );
    }
    return out;
  }

  static List<String> _vegasSetupHighlights(TripProfile profile) {
    final out = <String>[];
    if (_wantsNightSpectacles(profile)) {
      out.add(
        'Anchor evenings with residency shows, fountain windows, or Sphere nights — not just casino floor time.',
      );
    }
    if (profile.experiencePreferences.contains(ExperiencePreference.liveShows)) {
      out.add(
        'Book one marquee show per night cluster; stack daytime pools or desert loops between them.',
      );
    }
    if (profile.foodieInterest >= 55) {
      out.add(
        'Mix one chef-driven dinner with a rooftop or speakeasy night — Vegas rewards contrast.',
      );
    }
    return out;
  }

  static List<String> _nycSetupHighlights(TripProfile profile) {
    final out = <String>[];
    if (profile.experiencePreferences.contains(ExperiencePreference.liveShows) ||
        profile.tripStyles.contains(TripStyle.photography)) {
      out.add(
        'Cluster Broadway or Lincoln Center nights with a walkable pre-show dinner — avoid cross-borough sprints.',
      );
    }
    if (_wantsNightSpectacles(profile)) {
      out.add(
        'Sunset observation decks and skyline ferries beat random Midtown loops after dark.',
      );
    }
    if (profile.foodieInterest >= 55) {
      out.add(
        'Pair one market crawl (Chelsea, Smorgasburg season) with a reservation-only tasting counter.',
      );
    }
    return out;
  }

  static List<String> _miamiSetupHighlights(TripProfile profile) {
    final out = <String>[];
    if (profile.tripStyles.contains(TripStyle.romance) ||
        profile.desiredTripEmotion == DesiredTripEmotion.romantic) {
      out.add(
        'Golden-hour beach walks and Vizcaya gardens — save Ocean Drive neon for after dinner.',
      );
    }
    if (profile.foodieInterest >= 55) {
      out.add(
        'Little Havana cafecito mornings and waterfront seafood sunsets — two moods, one day.',
      );
    }
    if (profile.experiencePreferences.contains(ExperiencePreference.waterParks) ||
        profile.tripStyles.contains(TripStyle.beaches)) {
      out.add(
        'Mix South Beach swims with a Wynwood or Design District culture block before heat peaks.',
      );
    }
    return out;
  }

  static List<String> _genericSetupHighlights(
    TripProfile profile,
    String cityId,
  ) {
    String? cityName;
    for (final pack in CityPackRegistry.instance.allCities) {
      if (pack.cityId == cityId) {
        cityName = pack.cityName;
        break;
      }
    }
    final resolvedName = cityName ?? cityId;
    final out = <String>[];
    if (_wantsNightSpectacles(profile)) {
      out.add(
        'Plan one signature evening moment in $resolvedName — show, skyline, or waterfront — before filling midday stops.',
      );
    }
    if (profile.foodieInterest >= 55) {
      out.add(
        'Anchor one reservation-worthy dinner; let Concierge fill the rest around that table time.',
      );
    }
    return out;
  }

  static double _profileBoost(
    ExperienceMoment moment,
    TripProfile? profile,
    String cityId,
  ) {
    if (profile == null) return 0;
    var boost = 0.0;
    if (_wantsNightSpectacles(profile)) {
      if (moment.kind == ExperienceMomentKind.fireworks ||
          moment.kind == ExperienceMomentKind.show) {
        boost += 15;
      }
    }
    if (profile.experiencePreferences.contains(ExperiencePreference.liveShows) &&
        (moment.kind == ExperienceMomentKind.show ||
            moment.kind == ExperienceMomentKind.parade)) {
      boost += 12;
    }
    if (profile.experiencePreferences.contains(ExperiencePreference.waterParks) &&
        moment.tags.contains('water')) {
      boost += 10;
    }
    if (profile.foodieInterest >= 55 &&
        moment.kind == ExperienceMomentKind.diningWindow) {
      boost += 10;
    }
    if (cityId == 'miami' && moment.tags.contains('sunset')) {
      boost += 6;
    }
    return boost;
  }

  static bool _wantsNightSpectacles(TripProfile profile) =>
      profile.experiencePreferences.contains(ExperiencePreference.liveShows) ||
      profile.nightlifeInterest >= 45 ||
      profile.tripStyles.contains(TripStyle.romance) ||
      profile.desiredTripEmotion == DesiredTripEmotion.romantic ||
      profile.desiredTripEmotion == DesiredTripEmotion.memorable;
}

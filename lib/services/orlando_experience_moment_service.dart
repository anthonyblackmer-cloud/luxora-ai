import 'package:luxora_ai/data/orlando/orlando_experience_moments.dart';
import 'package:luxora_ai/models/orlando/orlando_experience_moment.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';

/// Surfaces curated iconic moments on itineraries and place detail.
abstract final class OrlandoExperienceMomentService {
  static OrlandoExperienceMoment? primaryMoment({
    required String placeId,
    DayPhase? phase,
    TripProfile? profile,
  }) {
    final candidates = OrlandoExperienceMomentsCatalog.forPlace(placeId);
    if (candidates.isEmpty) return null;

    final scored = <({OrlandoExperienceMoment moment, double score})>[];
    for (final moment in candidates) {
      if (phase != null &&
          moment.phase != null &&
          moment.phase != phase) {
        continue;
      }
      var score = moment.priority.toDouble();
      score += _profileBoost(moment, profile);
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
  }) {
    final moment = primaryMoment(
      placeId: placeId,
      phase: phase,
      profile: profile,
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
  }) {
    final moment = primaryMoment(
      placeId: block.place.id,
      phase: block.phase,
    );
    if (moment != null) {
      return moment.conciergeLine;
    }
    return fallback(block.reason, block.place.description);
  }

  static String? insiderTipForPlace(String placeId) {
    final moment = primaryMoment(placeId: placeId);
    return moment?.insiderTip;
  }

  static List<String> setupHighlights(TripProfile profile) {
    final out = <String>[];
    if (_wantsNightSpectacles(profile)) {
      out.add(
        'Build around iconic night shows — Magic Kingdom fireworks, EPCOT lagoon spectaculars, Fantasmic!, and Hogwarts castle lights.',
      );
    }
    if (profile.experiencePreferences.contains(ExperiencePreference.waterParks) ||
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

  static double _profileBoost(
    OrlandoExperienceMoment moment,
    TripProfile? profile,
  ) {
    if (profile == null) return 0;
    var boost = 0.0;
    if (_wantsNightSpectacles(profile)) {
      if (moment.kind == OrlandoMomentKind.fireworks ||
          moment.kind == OrlandoMomentKind.show) {
        boost += 15;
      }
    }
    if (profile.experiencePreferences.contains(ExperiencePreference.liveShows) &&
        (moment.kind == OrlandoMomentKind.show ||
            moment.kind == OrlandoMomentKind.parade)) {
      boost += 12;
    }
    if (profile.experiencePreferences.contains(ExperiencePreference.waterParks) &&
        moment.tags.contains('water')) {
      boost += 10;
    }
    if (profile.foodieInterest >= 55 &&
        moment.kind == OrlandoMomentKind.diningWindow) {
      boost += 10;
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

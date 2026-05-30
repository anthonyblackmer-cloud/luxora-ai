import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_profile.dart';

/// Applies couple / family occasion presets before planning engines run.
abstract final class TripOccasionInterpreter {
  static TripProfile apply(TripProfile profile) {
    return switch (profile.occasion) {
      TripOccasion.general => profile,
      TripOccasion.coupleAnniversary ||
      TripOccasion.coupleHoneymoon =>
        profile.copyWith(
          moods: _mergeMoods(profile.moods, [TripMood.romantic, TripMood.luxurious]),
          foodieInterest: _boost(profile.foodieInterest, 15),
          poolsideInterest: _boost(profile.poolsideInterest, 10),
          nightlifeInterest: _clampLow(profile.nightlifeInterest, 35),
          discoveryStyle: DiscoveryStyle.hiddenGems,
        ),
      TripOccasion.coupleDateNight => profile.copyWith(
          moods: _mergeMoods(profile.moods, [TripMood.romantic, TripMood.social]),
          foodieInterest: _boost(profile.foodieInterest, 20),
          nightlifeInterest: _boost(profile.nightlifeInterest, 15),
        ),
      TripOccasion.coupleProposal => profile.copyWith(
          moods: _mergeMoods(profile.moods, [TripMood.romantic]),
          poolsideInterest: _boost(profile.poolsideInterest, 15),
          adventureInterest: _clampLow(profile.adventureInterest, 45),
          discoveryStyle: DiscoveryStyle.hiddenGems,
          pace: PacePreference.slow,
        ),
      TripOccasion.familyWithKids => profile.copyWith(
          moods: _mergeMoods(profile.moods, [TripMood.familyBonding]),
          pace: profile.pace == PacePreference.packed
              ? PacePreference.balanced
              : profile.pace,
          nightlifeInterest: _clampLow(profile.nightlifeInterest, 20),
          poolsideInterest: _boost(profile.poolsideInterest, 10),
          adventureInterest: _clampLow(profile.adventureInterest, 55),
        ),
    };
  }

  static List<TripMood> _mergeMoods(List<TripMood> base, List<TripMood> add) {
    final out = List<TripMood>.from(base);
    for (final m in add) {
      if (!out.contains(m)) out.add(m);
    }
    return out;
  }

  static int _boost(int v, int delta) => (v + delta).clamp(0, 100);

  static int _clampLow(int v, int max) => v > max ? max : v;
}

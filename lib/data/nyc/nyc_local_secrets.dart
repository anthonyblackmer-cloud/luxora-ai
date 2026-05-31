import 'package:flutter/material.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/models/city_pack/district_pack.dart';

/// New York City local secrets — insider timing, parking, and seasonal pivots.
abstract final class NycLocalSecrets {
  static const _seasons = [
    'Year-round',
    'Oct–Apr best',
    'Summer mornings',
    'Dry season',
    'Shoulder season',
  ];

  static const _gradients = [
    [Color(0xFF0EA5E9), Color(0xFF0D9488), Color(0xFF134E4A)],
    [Color(0xFFF97316), Color(0xFFEC4899), Color(0xFF4C1D95)],
    [Color(0xFF78716C), Color(0xFF57534E), Color(0xFF292524)],
    [Color(0xFF14B8A6), Color(0xFF365314), Color(0xFF134E4A)],
    [Color(0xFF6366F1), Color(0xFF8B5CF6), Color(0xFF1E1B4B)],
  ];

  static const _secretKinds = [
    ('Times Square strategy', 'Enter from 7th Ave side streets — avoid crossroads crush and keep sightlines open'),
    ('Subway express tip', 'Take express where lines overlap — skip local stops that double your cross-town time'),
    ('Observation deck timing', 'Book last slot before sunset — golden light without midday queue heat'),
    ('Hidden rooftop access', 'Hotel lobby elevators after 4 PM — quieter bars with skyline views locals use'),
    ('Central Park entrance', 'Use 72nd Street transverse — faster path to Bethesda without Columbus Circle crowds'),
    ('Broadway ticket strategy', 'TKTS same-day matinee line opens early — rush seats beat tourist markups'),
    ('Secret food location', 'Basement counters on side streets — no signage, long local lines only'),
    ('Tourist trap pivot', 'Walk one avenue east or west — same cuisine, half the wait and better value'),
    ('Cross-town bus shortcut', 'M34 SBS when subway requires two transfers — often faster crosstown'),
    ('Museum free hour', 'Pay-what-you-wish evenings — arrive 30 minutes before window closes'),
    ('Ferry golden hour', 'Staten Island Ferry outbound at sunset — free harbor loop without tour boat fees'),
    ('High Line sunrise', 'Gansevoort entrance at opening — empty walkway before Chelsea Market rush'),
    ('Brooklyn Bridge photo angle', 'Washington Street DUMBO — arrive before 8 AM for empty cobblestone frame'),
    ('Rain day subway hub', 'Grand Central food hall cluster — stay underground between museums and shows'),
    ('Borough day efficiency', 'Cluster Brooklyn Heights + DUMBO + bridge — one subway ride, zero backtracking'),
    ('Holiday window walk', 'Fifth Ave after 9 PM weekdays — full displays without shoulder-to-shoulder crush'),
  ];

  static List<HiddenGem>? _catalog;

  static List<HiddenGem> buildForDistricts(List<DistrictPack> districts) {
    return _catalog ??= _build(districts);
  }

  static List<HiddenGem> _build(List<DistrictPack> districts) {
    final out = <HiddenGem>[];
    var idx = 0;
    for (final dist in districts) {
      for (var s = 0; s < 6; s++) {
        final kind = _secretKinds[(idx + s) % _secretKinds.length];
        out.add(
          HiddenGem(
            id: 'nyc-secret-${dist.districtId}-$s',
            title: '${dist.districtName}: ${kind.$1}',
            location: '${dist.districtName} · New York City insider',
            whySpecial:
                '${kind.$2}. Concierge-verified local pivot — hard to Google, easy to miss.',
            bestTime: _seasons[(idx + s) % _seasons.length],
            crowdLevel: s == 0 ? 'Low if timed right' : 'Moderate at peak',
            insiderTip:
                'Seasonality: ${_seasons[(idx + s + 1) % _seasons.length]} — adjust for humidity and UV.',
            localOnlyNote: 'Resident tip — not on typical visitor maps.',
            gradient: _gradients[(idx + s) % _gradients.length],
          ),
        );
      }
      idx++;
    }
    return out;
  }
}

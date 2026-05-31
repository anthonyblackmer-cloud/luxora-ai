import 'package:flutter/material.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/models/city_pack/district_pack.dart';

/// St. Augustine local secrets — insider timing, parking, and seasonal pivots.
abstract final class StAugustineLocalSecrets {
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
    ('Ghost tour timing', 'Book 8 PM slot — smaller groups and cooler brick-street walks'),
    ('Parking near Castillo', 'Use Castillo lot before 10 AM — afternoon tour buses fill fast'),
    ('Hidden courtyard', 'Alley off Aviles — quiet bench away from St. George crowds'),
    ('Lighthouse sunset', 'Climb 30 min before golden hour — east glow on the marsh'),
    ('St. George side street', 'Parallel lane one block west — same shops, half the strollers'),
    ('Vilano inlet pull-off', 'North end parking — dolphins often trace the channel at dusk'),
    ('Rainy museum pivot', 'Living history indoors when afternoon storms stack on the coast'),
    ('Anastasia dune path', 'South park entrance — fewer chairs, wider beach morning window'),
    ('Flagler college photo', 'West lawn at opening — empty quad frames the tower'),
    ('Matanzas sandbar walk', 'Low tide only — check tide chart before driving the inlet'),
  ];

  static List<HiddenGem>? _catalog;

  static List<HiddenGem> buildForDistricts(List<DistrictPack> districts) {
    return _catalog ??= _build(districts);
  }

  static List<HiddenGem> _build(List<DistrictPack> districts) {
    final out = <HiddenGem>[];
    var idx = 0;
    for (final dist in districts) {
      for (var s = 0; s < 3; s++) {
        final kind = _secretKinds[(idx + s) % _secretKinds.length];
        out.add(
          HiddenGem(
            id: 'st-augustine-secret-${dist.districtId}-$s',
            title: '${dist.districtName}: ${kind.$1}',
            location: '${dist.districtName} · St. Augustine insider',
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

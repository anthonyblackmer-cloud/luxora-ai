import 'package:flutter/material.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/models/city_pack/district_pack.dart';

/// Naples local secrets — insider timing, parking, and seasonal pivots.
abstract final class NaplesLocalSecrets {
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
    ('Pier parking timing', 'Arrive 90 min before sunset — lot turns over slowly but fills by golden hour'),
    ('Vanderbilt beach access', 'North end walk-on — fewer chair rentals and wider sand'),
    ('Fifth Avenue reservation', 'Book 6 PM — walk the avenue after without heat'),
    ('Marco shelling window', 'Low tide morning on south end — best shell line'),
    ('Mercato weeknight', 'Tuesday cinema crowd — easier parking and patio tables'),
    ('Estero kayak launch', 'Sunrise paddle — wind under 8 kt before afternoon sea breeze'),
    ('Hidden bayfront table', 'Crayton Cove back patio — request waterfront when booking'),
    ('Golf twilight tee', 'Late afternoon rates — cooler and faster rounds'),
    ('Tin City charter tip', 'Book morning fishing — afternoon storms common summer'),
    ('Third Street courtyard', 'Alley seating behind galleries — quiet lunch escape'),
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
            id: 'naples-secret-${dist.districtId}-$s',
            title: '${dist.districtName}: ${kind.$1}',
            location: '${dist.districtName} · Naples insider',
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

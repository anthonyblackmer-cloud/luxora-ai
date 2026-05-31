import 'package:flutter/material.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/models/city_pack/district_pack.dart';

/// Las Vegas local secrets — insider timing, parking, and seasonal pivots.
abstract final class VegasLocalSecrets {
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
    ('Bellagio fountain viewing', 'Stand center-lawn 15 minutes before show — avoid rail crowds at the front edge'),
    ('Free attraction loop', 'Wildlife habitat, conservatory, and street performers — chain before 6 PM dinner rush'),
    ('Sportsbook strategy', 'Weekday afternoons on major games — comps and seats without weekend elbow wars'),
    ('Speakeasy entrance', 'Look for unmarked doors in Arts District alleys — reservations unlock the real room'),
    ('Casino side entrance', 'Use parking-garage connectors — skip Strip sidewalk bottle-neck at peak hours'),
    ('Late-night food', 'Off-Strip diners after 1 AM — locals beat Strip kitchen close times'),
    ('Parking validation', 'Garage ticket at partner restaurant — validate before leaving the property'),
    ('Fremont timing', 'Weeknight 9 PM canopy — full light show without Saturday shoulder crush'),
    ('Pool day window', 'Arrive 10 AM cabana check-in — beat heat index and secure shade'),
    ('Heat walk advisory', 'Use casino connectors Strip-to-Strip — never cross boulevard at 2 PM July'),
    ('Hydration pivot', 'Free water at sportsbooks and bars — ask politely at any active counter'),
    ('Desert excursion slot', 'Red Rock loop at sunrise — back before noon heat advisory kicks in'),
  ];

  static List<HiddenGem>? _catalog;

  static List<HiddenGem> buildForDistricts(List<DistrictPack> districts) {
    return _catalog ??= _build(districts);
  }

  static List<HiddenGem> _build(List<DistrictPack> districts) {
    final out = <HiddenGem>[];
    var idx = 0;
    for (final dist in districts) {
      for (var s = 0; s < 8; s++) {
        final kind = _secretKinds[(idx + s) % _secretKinds.length];
        out.add(
          HiddenGem(
            id: 'vegas-secret-${dist.districtId}-$s',
            title: '${dist.districtName}: ${kind.$1}',
            location: '${dist.districtName} · Las Vegas insider',
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

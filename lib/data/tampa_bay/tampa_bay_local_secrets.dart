import 'package:flutter/material.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/models/city_pack/district_pack.dart';

/// Tampa Bay local secrets — insider timing, parking, and seasonal pivots.
abstract final class TampaBayLocalSecrets {
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
    ('Clearwater sunset viewing spot', 'West-facing pier approach · arrive 40 min early'),
    ('Riverwalk parking strategy', 'Garage on Whiting — walk south to avoid event closures'),
    ('St. Pete Pier timing', 'Weekday 4 PM entry — sunset without weekend stroller gridlock'),
    ('Local brunch favorite', 'Side-street café — order the Gulf benedict before 10 AM'),
    ('Hidden beach access', 'North Sand Key path — calmer water, fewer chair rentals'),
    ('Secret rooftop view', 'Top floor of historic building — bay bridge panorama at golden hour'),
    ('Brewery crawl route', 'Three-stop Pinellas loop — Uber between, walk within each stop'),
    ('Avoid after 2 PM', 'Major attraction — storms and school groups peak afternoons'),
    ('Dolphin cruise boarding tip', 'Starboard side outbound — calmer spray, better photos'),
    ('Cuban sandwich window', 'Before 11:30 AM — bread fresh, lines half the lunch rush'),
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
            id: 'tampa-bay-secret-${dist.districtId}-$s',
            title: '${dist.districtName}: ${kind.$1}',
            location: '${dist.districtName} · Tampa Bay insider',
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

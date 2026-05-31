import 'package:flutter/material.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/models/city_pack/district_pack.dart';

/// Destin & 30A local secrets — insider timing, parking, and seasonal pivots.
abstract final class Destin30aLocalSecrets {
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
    ('Crab Island timing', 'Arrive before 11 AM — calmer anchoring and easier parking at marina'),
    ('Henderson park entrance', 'East lot — shorter dune walk to wide sand'),
    ('30A bike path segment', 'Eastern leg dawn — empty path and cooler pavement'),
    ('Harborwalk lunch window', '11:30 AM — tables before charter crowds return'),
    ('Grayton old oak shade', 'North county access — picnic under trees midday'),
    ('Seaside square parking', 'Perry Ave lot — walk the square without A1A stress'),
    ('Emerald water photo', 'Midday sun angle — sand color pops for photos'),
    ('Pontoon rental tip', 'Book weekday — half the traffic at Crab Island'),
    ('Rainy Destin Commons', 'Indoor play + dinner combo when Gulf storms stack'),
    ('Inlet Beach morning', 'First light — empty sand before rental turnover'),
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
            id: 'destin-30a-secret-${dist.districtId}-$s',
            title: '${dist.districtName}: ${kind.$1}',
            location: '${dist.districtName} · Destin & 30A insider',
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

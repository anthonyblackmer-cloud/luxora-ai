import 'package:flutter/material.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';

/// Programmatic hidden gem cards — 105 island secrets across five districts.
List<HiddenGem> buildFloridaKeysHiddenGems() {
  const districts = [
    (
      'Key Largo',
      'Reef dock',
      'Snorkel entry locals use before the charter rush',
    ),
    (
      'Islamorada',
      'Marina alley',
      'Tarpon dock with zero tour-bus footprint',
    ),
    (
      'Marathon',
      'Bridge pull-off',
      'Seven Mile sunrise angle tour buses miss',
    ),
    (
      'Big Pine Key',
      'Deer trail',
      'Key deer grazing lane at first light',
    ),
    (
      'Key West',
      'Back-street bar',
      'Sunset tiki locals guard from cruise crowds',
    ),
  ];

  const gemTypes = [
    'secret beach',
    'sunset dock',
    'snorkel cove',
    'local seafood counter',
    'quiet sandbar',
    'photography pier',
    'hidden tiki',
    'reef access lane',
    'kayak launch',
    'fishing flat',
  ];

  const gradients = [
    [Color(0xFF0EA5E9), Color(0xFF14B8A6), Color(0xFF0F172A)],
    [Color(0xFF38BDF8), Color(0xFF0D9488), Color(0xFF134E4A)],
    [Color(0xFFF97316), Color(0xFFFB7185), Color(0xFF4C1D95)],
    [Color(0xFF64748B), Color(0xFF0F766E), Color(0xFF1E293B)],
    [Color(0xFF78716C), Color(0xFF57534E), Color(0xFF292524)],
  ];

  final out = <HiddenGem>[];
  var n = 0;
  for (var d = 0; d < districts.length; d++) {
    for (var g = 0; g < 21; g++) {
      final dist = districts[d];
      final type = gemTypes[(d + g) % gemTypes.length];
      out.add(
        HiddenGem(
          id: 'keys-gem-$d-$g',
          title: '${dist.$1} $type',
          location: '${dist.$1}, FL Keys · mile marker ${80 + d * 20 + g}',
          whySpecial:
              '${dist.$3} — a $type with island pacing and zero chain-hotel energy.',
          bestTime: g.isEven
              ? 'Sunrise · 6:45–8:00 AM'
              : 'Golden hour · 90 min before sunset',
          crowdLevel: g.isEven ? 'Low weekdays' : 'Moderate weekends',
          insiderTip:
              'Ask dock hands for wind direction — leeward side stays glassy for snorkel.',
          localOnlyNote: 'Highway tourists rarely leave US-1 for this turn.',
          gradient: gradients[n % gradients.length],
        ),
      );
      n++;
    }
  }
  return out;
}

/// Curated Florida Keys hidden gems — 105 island secrets.
final floridaKeysHiddenGemsCatalog = buildFloridaKeysHiddenGems();

const kFloridaKeysGemPlaceIds = <String, String>{
  'keys-gem-0-0': 'place-keys-pennekamp',
  'keys-gem-0-1': 'keys-gem-place-keys-key-largo-0',
  'keys-gem-1-0': 'place-keys-robbies-marina',
  'keys-gem-1-1': 'keys-gem-place-keys-islamorada-0',
  'keys-gem-2-0': 'place-keys-seven-mile-bridge',
  'keys-gem-2-1': 'place-keys-sombrero-beach',
  'keys-gem-3-0': 'place-keys-bahia-honda',
  'keys-gem-3-1': 'place-keys-big-pine-key-deer',
  'keys-gem-4-0': 'place-keys-fort-zachary',
  'keys-gem-4-1': 'place-keys-hogfish-bar',
  'keys-gem-4-2': 'place-keys-mallory-square',
};

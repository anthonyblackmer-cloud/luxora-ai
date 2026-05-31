// ignore_for_file: avoid_print
//
// Adds traveler-name onboarding + personalized concierge strings.
// Run: dart run tool/patch_traveler_name_l10n.dart

import 'dart:convert';
import 'dart:io';

void main() {
  const locales = [
    'en',
    'de',
    'es',
    'fr',
    'it',
    'pt',
    'ru',
    'hi',
    'tr',
    'ja',
    'ko',
    'zh',
  ];

  final entries = _entries();
  for (final locale in locales) {
    final path = 'lib/l10n/app_$locale.arb';
    final map =
        jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;
    map.addAll(entries);
    File(path).writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(map)}\n',
    );
    print('Patched $path (${entries.length} keys)');
  }
}

Map<String, dynamic> _entries() => {
      'onboardTravelerNameEyebrow': 'First things first',
      'onboardTravelerNameTitle': 'What should Luxora call you?',
      'onboardTravelerNameSubtitle':
          'Your first name is enough — Luxora will use it when you chat.',
      'onboardTravelerNameLabel': 'Your first name',
      'onboardTravelerNameHint': 'e.g. Maria',
      'onboardLuxoraReplyEyebrow': 'LUXORA',
      'onboardLuxoraReplyTitle': 'Lovely to meet you, {name}.',
      '@onboardLuxoraReplyTitle': {
        'placeholders': {
          'name': {'type': 'String'},
        },
      },
      'onboardLuxoraGuideNamed':
          '{name}, I\'m here to guide you and help you create the perfect vacation or adventure for you and your family.',
      '@onboardLuxoraGuideNamed': {
        'placeholders': {
          'name': {'type': 'String'},
        },
      },
      'onboardLuxoraItineraryPromise':
          'When we\'re done here, I\'ll build your itinerary from everything you choose. If you\'d like to change anything later, open the Concierge tab and tell me what to edit — I\'m always listening.',
      'conciergeWelcomeNamed':
          'Welcome, {name} — your emotionally intelligent Florida companion.\n\nChoose a prompt below, or describe the feeling you want your trip to create.',
      '@conciergeWelcomeNamed': {
        'placeholders': {
          'name': {'type': 'String'},
        },
      },
      'conciergeWelcomeWarmNamed':
          '{name}, I\'m here to shape Florida around how you want to feel — not a checklist of sights. What are you craving today?',
      '@conciergeWelcomeWarmNamed': {
        'placeholders': {
          'name': {'type': 'String'},
        },
      },
    };

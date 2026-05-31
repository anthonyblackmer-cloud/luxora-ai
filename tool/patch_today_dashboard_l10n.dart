// ignore_for_file: avoid_print
//
// Today tab dashboard strings + Agenda → Today rename.
// Run: dart run tool/patch_today_dashboard_l10n.dart

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
      'navAgenda': 'Today',
      'agendaPageSubtitle': 'What am I doing right now?',
      'todayPlanSectionTitle': "Today's plan",
      'todayPlanDetailsTitle': 'Full schedule',
      'todayPlanStopCount': '{count, plural, =1{1 stop today} other{{count} stops today}}',
      '@todayPlanStopCount': {
        'placeholders': {
          'count': {'type': 'int'},
        },
      },
      'todayNextActivityLabel': 'Up next',
      'todayRainRerouteTitle': 'Rain reroute',
      'todayStaysDiningSection': 'Stays & dining picks',
      'todayStaysDiningCollapsedHint':
          'Hotel and restaurant ideas — tap to expand',
      'todayExtrasSection': 'Tickets & sharing',
      'todayExtrasCollapsedHint': 'Deals, share card, and more',
    };

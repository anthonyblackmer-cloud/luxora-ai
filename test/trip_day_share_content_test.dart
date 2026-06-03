import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/data/trip_plans.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/util/trip_day_share_content.dart';

void main() {
  testWidgets('tripDayShareText includes day stops and footer', (tester) async {
    final day = sampleGoldenEscapePlan.days.first;
    late String text;

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            text = tripDayShareText(context, sampleGoldenEscapePlan, day);
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(text, contains('Orlando Golden Escape'));
    expect(text, contains('Day 1'));
    expect(text, contains('9:00 AM'));
    expect(text, contains('Slow spa morning'));
    expect(text, contains('Planned with Luxora'));
  });

  testWidgets('buildTripDayShareCard renders stop sections', (tester) async {
    final day = sampleGoldenEscapePlan.days.first;

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) =>
              buildTripDayShareCard(context, sampleGoldenEscapePlan, day),
        ),
      ),
    );

    expect(find.text('Orlando Golden Escape'), findsOneWidget);
    expect(find.text('Slow spa morning'), findsOneWidget);
    expect(find.text('Hidden spring dip'), findsOneWidget);
  });
}

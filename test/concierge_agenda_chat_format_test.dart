import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/util/concierge_agenda_chat_format.dart';

void main() {
  test('wantsAgendaDetailInChat detects explicit schedule requests', () {
    expect(
      ConciergeAgendaChatFormat.wantsAgendaDetailInChat(
        'Can you write out the full agenda?',
      ),
      isTrue,
    );
    expect(
      ConciergeAgendaChatFormat.wantsAgendaDetailInChat(
        'Plan a relaxed luxury day with great food',
      ),
      isFalse,
    );
  });

  test('condenseAssistantReply strips schedule lines', () {
    const reply = '''
Love this energy — unhurried luxury with great food.

9:00 AM · The Boheme
1:00 PM · Magic Kingdom
7:00 PM · Victoria & Albert's

I've mapped it on Timeline for you.''';

    final condensed = ConciergeAgendaChatFormat.condenseAssistantReply(
      reply,
      fallback: 'Fallback',
    );

    expect(condensed, contains('Love this energy'));
    expect(condensed, isNot(contains('9:00 AM')));
    expect(condensed, isNot(contains('Magic Kingdom')));
  });

  test('formatAgendaForChat lists synced timeline stops', () {
    const plan = TripPlan(
      id: 'test',
      title: 'Test',
      days: [
        TripDay(
          dayNumber: 1,
          label: 'Day 1',
          items: [
            TripItem(
              id: '1',
              time: '9:00 AM',
              title: 'Magic Kingdom',
              emotionalLine: 'Park day',
              location: 'Lake Buena Vista',
              category: 'Theme park',
            ),
          ],
        ),
      ],
    );

    final text = ConciergeAgendaChatFormat.formatAgendaForChat(plan);
    expect(text, contains('9:00 AM · Magic Kingdom'));
    expect(text, contains('Park day'));
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/services/concierge_ticket_sync.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  setUpAll(() async {
    await PlacesRepository.instance.initialize();
  });

  test('wantsTicketHelp detects ticket language', () {
    expect(
      ConciergeTicketSync.wantsTicketHelp('Find me the best price tickets'),
      isTrue,
    );
    expect(
      ConciergeTicketSync.wantsTicketHelp('Plan a romantic dinner'),
      isFalse,
    );
  });

  test('dealsFor returns Disney deals from ticket request', () {
    final plan = TripPlan(
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
              placeId: 'place-magic-kingdom',
            ),
          ],
        ),
      ],
    );

    final deals = ConciergeTicketSync.dealsFor(
      userMessage: 'Find discounted Disney tickets with a link',
      plan: plan,
    );

    expect(deals, isNotEmpty);
    expect(deals.any((d) => d.itineraryTags.contains('disney')), isTrue);
  });

  test('attachDealsToPlan sets ticketDealId on matching stops', () {
    final plan = TripPlan(
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
              placeId: 'place-magic-kingdom',
            ),
          ],
        ),
      ],
    );

    final deals = ConciergeTicketSync.dealsFor(
      userMessage: 'Disney tickets',
      plan: plan,
    );
    final updated = ConciergeTicketSync.attachDealsToPlan(plan, deals);
    final item = updated.days.first.items.first;

    expect(item.ticketDealId, isNotNull);
    expect(ConciergeTicketSync.dealForItem(item), isNotNull);
  });
}

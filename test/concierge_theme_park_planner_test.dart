import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/services/concierge_theme_park_planner.dart';
import 'package:luxora_ai/services/places_repository.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await PlacesRepository.instance.initialize();
  });

  test('parseIntent reads four-day Disney and Universal request', () {
    final intent = ConciergeThemeParkPlanner.parseIntent(
      'Plan a four-day three-night Disney and Universal excursion',
    );

    expect(intent.dayCount, 4);
    expect(intent.disney, isTrue);
    expect(intent.universal, isTrue);
    expect(intent.isExcursion, isTrue);
  });

  test('pickRoutes alternates Disney and Universal days', () {
    final routes = ConciergeThemeParkPlanner.pickRoutes(
      dayCount: 4,
      disney: true,
      universal: true,
    );

    expect(routes.length, 4);
    expect(routes.first.routeId, contains('disney'));
    expect(routes[1].routeId, contains('universal'));
  });

  test('dayFlowFromRoute resolves theme-park stops', () {
    final route = ConciergeThemeParkPlanner.pickRoutes(
      dayCount: 1,
      disney: true,
      universal: false,
    ).first;

    final flow = ConciergeThemeParkPlanner.dayFlowFromRoute(
      route,
      PlacesRepository.instance,
    );

    expect(flow, isNotNull);
    expect(flow!.blocks.length, greaterThanOrEqualTo(2));
    expect(
      flow.blocks.any((b) => b.place.id.contains('magic-kingdom')),
      isTrue,
    );
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/day_flow_stop_customizer.dart';

LuxPlace _place({
  required String id,
  required LuxPlaceCategory category,
  required String title,
  List<String> tags = const [],
}) =>
    LuxPlace(
      id: id,
      slug: id,
      title: title,
      category: category,
      unsplashPhotoId: 'test',
      location: 'Orlando, FL',
      latitude: 28.42,
      longitude: -81.58,
      description: 'Test',
      moodTags: tags,
    );

List<LuxPlace> _pool() => [
      _place(
        id: 'dining-1',
        category: LuxPlaceCategory.dining,
        title: 'Steakhouse',
        tags: const ['foodie'],
      ),
      _place(
        id: 'nature-1',
        category: LuxPlaceCategory.nature,
        title: 'Lake Eola Park',
        tags: const ['park', 'nature', 'outdoor'],
      ),
      _place(
        id: 'beach-1',
        category: LuxPlaceCategory.beach,
        title: 'Cocoa Beach',
        tags: const ['beach'],
      ),
    ];

DayFlow _sampleFlow(List<LuxPlace> pool) => DayFlow(
      blocks: [
        DayBlock(
          phase: DayPhase.morning,
          place: pool.firstWhere((p) => p.id == 'dining-1'),
          reason: DayBlockReason.eveningDining,
        ),
      ],
      start: const LatLng(28.42, -81.58),
      totalMiles: 2,
    );

void main() {
  test('swaps stop when user asks for a park', () async {
    final pool = _pool();
    final result = await DayFlowStopCustomizer.swapAsync(
      flow: _sampleFlow(pool),
      blockIndex: 0,
      userRequest: 'I was thinking something more like a park this morning',
      pool: pool,
    );

    expect(result.changed, isTrue);
    expect(result.newPlace!.id, 'nature-1');
    expect(result.flow.blocks.first.place.id, 'nature-1');
  });

  test('returns unchanged when request is only the template', () async {
    final pool = _pool();
    final flow = _sampleFlow(pool);
    final result = await DayFlowStopCustomizer.swapAsync(
      flow: flow,
      blockIndex: 0,
      userRequest: 'I was thinking something more like…',
      pool: pool,
    );

    expect(result.changed, isFalse);
    expect(result.flow, flow);
  });
}

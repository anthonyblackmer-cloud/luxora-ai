import 'dart:convert';

import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/concierge/concierge_trip_context.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/concierge_ai_service.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/util/place_distance.dart';

/// Result of swapping one stop on the day timeline from natural language.
class DayFlowSwapResult {
  const DayFlowSwapResult({
    required this.flow,
    required this.changed,
    this.newPlace,
    this.usedAi = false,
  });

  final DayFlow flow;
  final LuxPlace? newPlace;
  final bool changed;
  final bool usedAi;
}

/// Replaces a single [DayFlow] block when the traveler says what they'd
/// rather do instead — local keyword scoring first, concierge AI when online.
abstract final class DayFlowStopCustomizer {
  static Future<DayFlowSwapResult> swapAsync({
    required DayFlow flow,
    required int blockIndex,
    required String userRequest,
    required List<LuxPlace> pool,
    ConciergeTripContext? aiContext,
    Set<String> savedIds = const {},
  }) async {
    if (flow.isEmpty ||
        blockIndex < 0 ||
        blockIndex >= flow.blocks.length) {
      return DayFlowSwapResult(flow: flow, changed: false);
    }

    final block = flow.blocks[blockIndex];
    final request = _stripTemplate(userRequest);
    if (request.isEmpty) {
      return DayFlowSwapResult(flow: flow, changed: false);
    }

    LuxPlace? pick;
    var usedAi = false;

    if (ConciergeAiService.isConfigured && aiContext != null) {
      pick = await _resolveWithAi(
        block: block,
        request: request,
        pool: pool,
        flow: flow,
        context: aiContext,
      );
      usedAi = pick != null;
    }

    pick ??= _pickLocally(
      blockIndex: blockIndex,
      block: block,
      request: request,
      pool: pool,
      flow: flow,
      savedIds: savedIds,
    );

    if (pick == null || pick.id == block.place.id) {
      return DayFlowSwapResult(flow: flow, changed: false);
    }

    return DayFlowSwapResult(
      flow: _replaceBlock(flow, blockIndex, pick),
      newPlace: pick,
      changed: true,
      usedAi: usedAi,
    );
  }

  /// Strips the starter template so scoring focuses on the traveler's intent.
  static String _stripTemplate(String raw) {
    var text = raw.trim();
    const prefixes = [
      'i was thinking something more like',
      'i was thinking more like',
      'i was thinking something like',
      'i want something more like',
      'i want to change this to',
      'change this to',
      'swap this for',
      'instead of this',
    ];
    final lower = text.toLowerCase();
    for (final prefix in prefixes) {
      if (lower.startsWith(prefix)) {
        text = text.substring(prefix.length).trim();
        if (text.startsWith('…') || text.startsWith('...')) {
          text = text.substring(1).trim();
        }
        break;
      }
    }
    return text.replaceAll(RegExp(r'^[\.\…,\s]+'), '').trim();
  }

  static DayFlow _replaceBlock(DayFlow flow, int index, LuxPlace place) {
    final blocks = [...flow.blocks];
    final old = blocks[index];
    blocks[index] = DayBlock(
      phase: old.phase,
      place: place,
      reason: _reasonForReplacement(old.reason, place),
    );

    var total = 0.0;
    var prev = flow.start;
    for (final b in blocks) {
      final here = LatLng(b.place.latitude, b.place.longitude);
      total += PlaceDistance.milesBetween(prev, here);
      prev = here;
    }

    return DayFlow(
      blocks: blocks,
      start: flow.start,
      totalMiles: total,
      homeBase: flow.homeBase,
      emphases: flow.emphases,
    );
  }

  static DayBlockReason _reasonForReplacement(
    DayBlockReason previous,
    LuxPlace place,
  ) {
    return switch (place.category) {
      LuxPlaceCategory.dining ||
      LuxPlaceCategory.nightlife =>
        place.category == LuxPlaceCategory.nightlife
            ? DayBlockReason.nightOut
            : DayBlockReason.eveningDining,
      LuxPlaceCategory.wellness || LuxPlaceCategory.beach =>
        DayBlockReason.morningPool,
      LuxPlaceCategory.nature || LuxPlaceCategory.springs =>
        DayBlockReason.morningCalm,
      LuxPlaceCategory.adventure || LuxPlaceCategory.family =>
        DayBlockReason.middayAdventure,
      LuxPlaceCategory.romantic => DayBlockReason.eveningDining,
      _ => previous,
    };
  }

  static LuxPlace? _pickLocally({
    required int blockIndex,
    required DayBlock block,
    required String request,
    required List<LuxPlace> pool,
    required DayFlow flow,
    required Set<String> savedIds,
  }) {
    final hints = _intentHints(request);
    if (hints.categories.isEmpty &&
        hints.tags.isEmpty &&
        hints.titleTokens.isEmpty) {
      return null;
    }

    final used = {
      for (var i = 0; i < flow.blocks.length; i++)
        if (i != blockIndex) flow.blocks[i].place.id,
    };

    final legOrigin = _legOrigin(flow, blockIndex);
    LuxPlace? best;
    var bestScore = double.negativeInfinity;

    for (final place in pool) {
      if (used.contains(place.id)) continue;
      var score = 0.0;

      if (hints.categories.contains(place.category)) score += 40;
      for (final tag in hints.tags) {
        if (place.moodTags.any((t) => t.toLowerCase().contains(tag))) {
          score += 12;
        }
      }
      for (final token in hints.titleTokens) {
        if (place.title.toLowerCase().contains(token)) score += 18;
        if (place.slug.toLowerCase().contains(token)) score += 10;
      }
      if (score <= 0) continue;

      if (savedIds.contains(place.id)) score += 25;
      if (place.source == LuxPlaceSource.curated) score += 6;

      final miles = PlaceDistance.milesBetween(
        legOrigin,
        LatLng(place.latitude, place.longitude),
      );
      score -= miles * 0.2;

      if (score > bestScore) {
        bestScore = score;
        best = place;
      }
    }
    return best;
  }

  static LatLng _legOrigin(DayFlow flow, int blockIndex) {
    if (blockIndex <= 0) return flow.start;
    final prev = flow.blocks[blockIndex - 1].place;
    return LatLng(prev.latitude, prev.longitude);
  }

  static Future<LuxPlace?> _resolveWithAi({
    required DayBlock block,
    required String request,
    required List<LuxPlace> pool,
    required DayFlow flow,
    required ConciergeTripContext context,
  }) async {
    final usedElsewhere = {
      for (var i = 0; i < flow.blocks.length; i++)
        if (flow.blocks[i].place.id != block.place.id)
          flow.blocks[i].place.id,
    };
    final candidates = pool
        .where((p) => !usedElsewhere.contains(p.id))
        .take(24)
        .map(
          (p) =>
              '${p.id}: ${p.title} (${p.category.name}, ${p.location})',
        )
        .join('\n');

    final prompt = '''
The traveler wants to replace this itinerary stop:
- Phase: ${block.phase.name}
- Current: ${block.place.title} (${block.place.category.name})
- They said: "$request"

Pick ONE replacement from this catalog (same city). Reply with JSON only:
{"placeId":"<id>"} or {"placeId":null} if nothing fits.

Catalog:
$candidates''';

    try {
      final reply = await ConciergeAiService.chat(
        messages: [ConciergeChatMessage(role: 'user', content: prompt)],
        context: context,
      );
      final id = _extractPlaceId(reply);
      if (id == null) return null;
      for (final place in pool) {
        if (place.id == id) return place;
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  static String? _extractPlaceId(String reply) {
    final trimmed = reply.trim();
    try {
      final decoded = jsonDecode(trimmed) as Map<String, dynamic>;
      final id = decoded['placeId'];
      if (id == null) return null;
      final s = id.toString().trim();
      return s.isEmpty ? null : s;
    } catch (_) {}

    final match = RegExp(
      r'"placeId"\s*:\s*"([^"]+)"',
      caseSensitive: false,
    ).firstMatch(trimmed);
    return match?.group(1)?.trim();
  }
}

class _IntentHints {
  const _IntentHints({
    this.categories = const [],
    this.tags = const [],
    this.titleTokens = const [],
  });

  final List<LuxPlaceCategory> categories;
  final List<String> tags;
  final List<String> titleTokens;
}

_IntentHints _intentHints(String request) {
  final lower = request.toLowerCase();
  final categories = <LuxPlaceCategory>[];
  final tags = <String>[];
  final titleTokens = <String>[];

  void addCat(LuxPlaceCategory c) {
    if (!categories.contains(c)) categories.add(c);
  }

  void addTag(String t) {
    if (!tags.contains(t)) tags.add(t);
  }

  if (lower.contains('park') ||
      lower.contains('garden') ||
      lower.contains('nature') ||
      lower.contains('hike') ||
      lower.contains('trail')) {
    addCat(LuxPlaceCategory.nature);
    addTag('nature');
    addTag('park');
    addTag('outdoor');
  }
  if (lower.contains('beach') || lower.contains('ocean') || lower.contains('sand')) {
    addCat(LuxPlaceCategory.beach);
    addTag('beach');
  }
  if (lower.contains('spring') || lower.contains('swim')) {
    addCat(LuxPlaceCategory.springs);
    addTag('springs');
  }
  if (lower.contains('spa') ||
      lower.contains('wellness') ||
      lower.contains('pool')) {
    addCat(LuxPlaceCategory.wellness);
    addTag('spa');
    addTag('wellness');
    addTag('pool');
  }
  if (lower.contains('dinner') ||
      lower.contains('lunch') ||
      lower.contains('brunch') ||
      lower.contains('restaurant') ||
      lower.contains('food') ||
      lower.contains('seafood') ||
      lower.contains('steak')) {
    addCat(LuxPlaceCategory.dining);
    addTag('foodie');
    addTag('dining');
    if (lower.contains('seafood')) addTag('seafood');
  }
  if (lower.contains('bar') ||
      lower.contains('nightlife') ||
      lower.contains('club') ||
      lower.contains('night out')) {
    addCat(LuxPlaceCategory.nightlife);
    addTag('nightlife');
  }
  if (lower.contains('museum') ||
      lower.contains('culture') ||
      lower.contains('art') ||
      lower.contains('historic')) {
    addCat(LuxPlaceCategory.family);
    addTag('culture');
    addTag('arts');
    addTag('historic');
  }
  if (lower.contains('theme park') ||
      lower.contains('roller') ||
      lower.contains('adventure') ||
      lower.contains('thrill')) {
    addCat(LuxPlaceCategory.adventure);
    addCat(LuxPlaceCategory.family);
    addTag('adventure');
    addTag('thrill');
  }
  if (lower.contains('romantic') || lower.contains('date')) {
    addCat(LuxPlaceCategory.romantic);
    addTag('romantic');
  }
  if (lower.contains('kid') ||
      lower.contains('family') ||
      lower.contains('children')) {
    addCat(LuxPlaceCategory.family);
    addTag('family');
  }

  for (final token in lower.split(RegExp(r'[^a-z0-9]+'))) {
    if (token.length >= 4 &&
        !const {
          'this',
          'that',
          'with',
          'want',
          'like',
          'more',
          'something',
          'thinking',
          'morning',
          'afternoon',
          'evening',
          'instead',
          'change',
        }.contains(token)) {
      titleTokens.add(token);
    }
  }

  return _IntentHints(
    categories: categories,
    tags: tags,
    titleTokens: titleTokens,
  );
}

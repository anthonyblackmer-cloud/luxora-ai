import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/services/concierge_trip_save_sync.dart';

/// When false, Concierge keeps chat warm and brief — full stops live on Map/Timeline.
abstract final class ConciergeAgendaChatFormat {
  static const _detailPhrases = [
    'full agenda',
    'full schedule',
    'full itinerary',
    'whole agenda',
    'whole schedule',
    'write it out',
    'write out',
    'write the',
    'list it out',
    'list the schedule',
    'list the agenda',
    'list everything',
    'hour by hour',
    'hour-by-hour',
    'step by step',
    'step-by-step',
    'every stop',
    'all the stops',
    'all stops',
    'repeat the agenda',
    'repeat the schedule',
    'tell me the schedule',
    'tell me the agenda',
    'show me the schedule',
    'show me the agenda',
    'show the schedule',
    'show the agenda',
    'what is the agenda',
    "what's the agenda",
    'whats the agenda',
    'run through the day',
    'walk me through the day',
    'walk me through',
    'break it down',
    'breakdown',
    'in chat',
    'type it out',
    'spell it out',
    'read it back',
    'read back',
  ];

  static bool wantsAgendaDetailInChat(String message) {
    final lower = message.toLowerCase();
    return _detailPhrases.any(lower.contains);
  }

  /// Model replied as if Map/Timeline were updated — client must sync to match.
  static bool assistantPromisedAgendaSync(String reply) {
    final lower = reply.toLowerCase().replaceAll('ё', 'е');
    if (lower.contains('map') &&
        (lower.contains('timeline') ||
            lower.contains('agenda') ||
            lower.contains('карт'))) {
      return true;
    }
    if (lower.contains('added to') &&
        (lower.contains('agenda') ||
            lower.contains('timeline') ||
            lower.contains('map'))) {
      return true;
    }
    if (lower.contains("i've added") ||
        lower.contains('i have added') ||
        lower.contains("i've scheduled") ||
        lower.contains('i have scheduled') ||
        lower.contains("i've updated") ||
        lower.contains('i have updated') ||
        lower.contains("i've put") ||
        lower.contains('added that') ||
        lower.contains('scheduled that') ||
        lower.contains('slotted') ||
        lower.contains('put that on') ||
        lower.contains('now on your') ||
        lower.contains("it's on your")) {
      return true;
    }
    if (lower.contains('ready on map') ||
        lower.contains('on map and') ||
        lower.contains('your agenda is') ||
        lower.contains('built your day') ||
        lower.contains('sequenced your day')) {
      return true;
    }
    // Russian / multilingual concierge replies
    if (RegExp(
      r'(добавил|добавила|обновил|обновила|сохранил|сохранила|построил|построила|составил|составила)',
    ).hasMatch(lower)) {
      if (lower.contains('карт') ||
          lower.contains('маршрут') ||
          lower.contains('расписан') ||
          lower.contains('agenda') ||
          lower.contains('timeline') ||
          lower.contains('map')) {
        return true;
      }
    }
    if (lower.contains('готов') &&
        (lower.contains('карт') ||
            lower.contains('маршрут') ||
            lower.contains('agenda'))) {
      return true;
    }
    return false;
  }

  /// Best user text to feed the itinerary engine for this exchange.
  static String resolvePlanningMessage({
    required String currentUserMessage,
    required String assistantReply,
    required List<({String role, String content})> history,
    String? lastSyncedPlanningMessage,
    String? tripFeel,
  }) {
    if (ConciergeTripSaveSync.shouldRebuildItinerary(currentUserMessage)) {
      return currentUserMessage;
    }
    if (!assistantPromisedAgendaSync(assistantReply)) {
      return currentUserMessage;
    }
    for (var i = history.length - 1; i >= 0; i--) {
      final entry = history[i];
      if (entry.role != 'user') continue;
      if (ConciergeTripSaveSync.shouldRebuildItinerary(entry.content)) {
        return entry.content;
      }
    }
    final feel = tripFeel?.trim() ?? '';
    if (feel.isNotEmpty && ConciergeTripSaveSync.shouldRebuildItinerary(feel)) {
      return feel;
    }
    if (lastSyncedPlanningMessage != null &&
        lastSyncedPlanningMessage.trim().isNotEmpty) {
      return lastSyncedPlanningMessage;
    }
    return currentUserMessage;
  }

  /// Drops hour-by-hour / numbered stop lists from the model reply.
  static String condenseAssistantReply(
    String aiReply, {
    required String fallback,
  }) {
    final lines = aiReply.split('\n');
    final kept = <String>[];
    var droppedScheduleLine = false;

    for (final line in lines) {
      final trimmed = line.trim();
      if (trimmed.isEmpty) {
        if (kept.isNotEmpty && kept.last.trim().isNotEmpty) {
          kept.add('');
        }
        continue;
      }
      if (_looksLikeScheduleLine(trimmed)) {
        droppedScheduleLine = true;
        continue;
      }
      kept.add(line);
    }

    var condensed = kept.join('\n').trim().replaceAll(RegExp(r'\n{3,}'), '\n\n');
    if (condensed.length > 520) {
      condensed = '${condensed.substring(0, 517).trim()}…';
    }

    if (condensed.length < 48 && droppedScheduleLine) {
      return fallback;
    }
    if (condensed.isEmpty) {
      return fallback;
    }
    return condensed;
  }

  static String formatAgendaForChat(TripPlan plan) {
    final buffer = StringBuffer();
    for (final day in plan.days) {
      if (plan.days.length > 1) {
        buffer.writeln('Day ${day.dayNumber} · ${day.label}');
      }
      for (final item in day.items) {
        buffer.writeln('${item.time} · ${item.title}');
        final line = item.emotionalLine.trim();
        if (line.isNotEmpty) {
          buffer.writeln('  $line');
        }
      }
    }
    return buffer.toString().trim();
  }

  static bool _looksLikeScheduleLine(String line) {
    if (RegExp(r'^\d+[\.\)]\s').hasMatch(line)) return true;
    if (RegExp(r'^\s*[-•*–—]\s*\d').hasMatch(line)) return true;
    if (RegExp(
      r'^(\d{1,2}[:\.]\d{2}\s*[ap]\.?m\.?|\d{1,2}\s*[ap]\.?m\.?)',
      caseSensitive: false,
    ).hasMatch(line)) {
      return true;
    }
    if (RegExp(
      r'^(morning|midday|afternoon|evening|night|breakfast|brunch|lunch|dinner)\s*[:\-–—]',
      caseSensitive: false,
    ).hasMatch(line)) {
      return true;
    }
    if (RegExp(r'→|➜|->').hasMatch(line) && line.length < 120) {
      return true;
    }
    if (RegExp(
      r'^\s*(stop|then|next)\s+\d',
      caseSensitive: false,
    ).hasMatch(line)) {
      return true;
    }
    return false;
  }
}

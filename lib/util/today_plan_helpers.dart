import 'package:intl/intl.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';

enum TodayUpNextKind { upcoming, happeningNow, complete }

/// Resolved "Up next" / "Happening now" state for the Today dashboard.
class TodayUpNextState {
  const TodayUpNextState({
    required this.kind,
    this.item,
    this.block,
    this.startsIn,
  });

  final TodayUpNextKind kind;
  final TripItem? item;
  final DayBlock? block;
  final Duration? startsIn;
}

/// Resolves "today" on a multi-day trip and finds the next stop.
abstract final class TodayPlanHelpers {
  static DateTime? parseIsoDate(String iso) {
    final trimmed = iso.trim();
    if (trimmed.isEmpty) return null;
    try {
      return DateTime.parse(trimmed);
    } catch (_) {
      return null;
    }
  }

  /// 0-based day index for today relative to trip [startDateIso], or null if unknown.
  static int? dayIndexForToday({
    required String? startDateIso,
    required int dayCount,
  }) {
    if (dayCount <= 0) return null;
    final start = parseIsoDate(startDateIso ?? '');
    if (start == null) return null;

    final today = DateTime.now();
    final startDay = DateTime(start.year, start.month, start.day);
    final todayDay = DateTime(today.year, today.month, today.day);
    final offset = todayDay.difference(startDay).inDays;
    return offset.clamp(0, dayCount - 1);
  }

  static DateTime? parseScheduleTime(String raw) {
    var trimmed = raw.trim();
    if (trimmed.isEmpty) return null;

    String startPart;
    String? tailPart;
    final enDash = trimmed.indexOf('–');
    final hyphen = trimmed.indexOf('-');
    if (enDash >= 0) {
      startPart = trimmed.substring(0, enDash).trim();
      tailPart = trimmed.substring(enDash + 1).trim();
    } else if (hyphen > 0 && RegExp(r'\d').hasMatch(trimmed[hyphen - 1])) {
      startPart = trimmed.substring(0, hyphen).trim();
      tailPart = trimmed.substring(hyphen + 1).trim();
    } else {
      startPart = trimmed;
    }

    final meridiemPattern = RegExp(r'(am|pm)', caseSensitive: false);
    if (tailPart != null &&
        !meridiemPattern.hasMatch(startPart) &&
        meridiemPattern.hasMatch(tailPart)) {
      final meridiem = meridiemPattern.firstMatch(tailPart)?.group(0);
      if (meridiem != null) {
        startPart = '$startPart $meridiem';
      }
    }

    for (final pattern in ['h:mm a', 'hh:mm a', 'H:mm', 'HH:mm']) {
      try {
        return DateFormat(pattern).parse(startPart);
      } catch (_) {
        continue;
      }
    }
    return null;
  }

  static String formatStartsIn(Duration duration) {
    final totalMinutes = duration.inMinutes;
    if (totalMinutes < 1) return '< 1m';
    final hours = duration.inHours;
    final minutes = totalMinutes.remainder(60);
    if (hours > 0 && minutes > 0) return '${hours}h ${minutes}m';
    if (hours > 0) return '${hours}h';
    return '${minutes}m';
  }

  /// Time-aware Up Next resolution for a [TripDay].
  static TodayUpNextState resolveUpNext(TripDay day) {
    if (day.items.isEmpty) {
      return const TodayUpNextState(kind: TodayUpNextKind.complete);
    }

    final entries = _scheduleEntries(day);
    if (entries.isEmpty) {
      return TodayUpNextState(
        kind: TodayUpNextKind.upcoming,
        item: day.items.first,
      );
    }

    final now = DateTime.now();
    final first = entries.first;
    if (now.isBefore(first.start)) {
      return TodayUpNextState(
        kind: TodayUpNextKind.upcoming,
        item: first.item,
        startsIn: first.start.difference(now),
      );
    }

    final last = entries.last;
    if (!now.isBefore(last.end)) {
      return const TodayUpNextState(kind: TodayUpNextKind.complete);
    }

    for (final entry in entries) {
      if (!now.isBefore(entry.start) && now.isBefore(entry.end)) {
        return TodayUpNextState(
          kind: TodayUpNextKind.happeningNow,
          item: entry.item,
        );
      }
    }

    for (final entry in entries) {
      if (now.isBefore(entry.start)) {
        return TodayUpNextState(
          kind: TodayUpNextKind.upcoming,
          item: entry.item,
          startsIn: entry.start.difference(now),
        );
      }
    }

    return const TodayUpNextState(kind: TodayUpNextKind.complete);
  }

  /// Fallback when timeline items are unavailable — uses day-flow phases.
  static TodayUpNextState resolveUpNextFromFlow(DayFlow flow) {
    if (flow.isEmpty) {
      return const TodayUpNextState(kind: TodayUpNextKind.complete);
    }

    final now = DateTime.now();
    final entries = <({DayBlock block, DateTime start, DateTime end})>[];
    for (var i = 0; i < flow.blocks.length; i++) {
      final block = flow.blocks[i];
      final start = _phaseStart(block.phase, now);
      final end = i + 1 < flow.blocks.length
          ? _phaseStart(flow.blocks[i + 1].phase, now)
          : start.add(const Duration(hours: 2));
      entries.add((
        block: block,
        start: start,
        end: end.isAfter(start) ? end : start.add(const Duration(hours: 2)),
      ));
    }

    final first = entries.first;
    if (now.isBefore(first.start)) {
      return TodayUpNextState(
        kind: TodayUpNextKind.upcoming,
        block: first.block,
        startsIn: first.start.difference(now),
      );
    }

    final last = entries.last;
    if (!now.isBefore(last.end)) {
      return const TodayUpNextState(kind: TodayUpNextKind.complete);
    }

    for (final entry in entries) {
      if (!now.isBefore(entry.start) && now.isBefore(entry.end)) {
        return TodayUpNextState(
          kind: TodayUpNextKind.happeningNow,
          block: entry.block,
        );
      }
    }

    for (final entry in entries) {
      if (now.isBefore(entry.start)) {
        return TodayUpNextState(
          kind: TodayUpNextKind.upcoming,
          block: entry.block,
          startsIn: entry.start.difference(now),
        );
      }
    }

    return const TodayUpNextState(kind: TodayUpNextKind.complete);
  }

  /// Next timed item on [day], or null when the day is complete.
  static TripItem? nextTripItem(TripDay day) {
    final state = resolveUpNext(day);
    return switch (state.kind) {
      TodayUpNextKind.upcoming || TodayUpNextKind.happeningNow => state.item,
      TodayUpNextKind.complete => null,
    };
  }

  static DayBlock? nextDayFlowBlock(DayFlow flow) {
    final state = resolveUpNextFromFlow(flow);
    return switch (state.kind) {
      TodayUpNextKind.upcoming || TodayUpNextKind.happeningNow => state.block,
      TodayUpNextKind.complete => null,
    };
  }

  static List<({TripItem item, DateTime start, DateTime end})> _scheduleEntries(
    TripDay day,
  ) {
    final now = DateTime.now();
    final entries = <({TripItem item, DateTime start, DateTime end})>[];

    for (var i = 0; i < day.items.length; i++) {
      final item = day.items[i];
      final parsed = parseScheduleTime(item.time);
      if (parsed == null) continue;

      final start = DateTime(
        now.year,
        now.month,
        now.day,
        parsed.hour,
        parsed.minute,
      );

      DateTime end;
      final defaultEnd = start.add(const Duration(hours: 2));
      if (i + 1 < day.items.length) {
        final nextParsed = parseScheduleTime(day.items[i + 1].time);
        if (nextParsed == null) {
          end = defaultEnd;
        } else {
          final nextStart = DateTime(
            now.year,
            now.month,
            now.day,
            nextParsed.hour,
            nextParsed.minute,
          );
          end = nextStart.isBefore(defaultEnd) ? nextStart : defaultEnd;
        }
      } else {
        end = defaultEnd;
      }

      if (!end.isAfter(start)) {
        end = defaultEnd;
      }

      entries.add((item: item, start: start, end: end));
    }

    return entries;
  }

  static DateTime _phaseStart(DayPhase phase, DateTime now) {
    final hour = switch (phase) {
      DayPhase.morning => 9,
      DayPhase.midday => 12,
      DayPhase.afternoon => 15,
      DayPhase.evening => 18,
      DayPhase.night => 21,
    };
    return DateTime(now.year, now.month, now.day, hour);
  }
}

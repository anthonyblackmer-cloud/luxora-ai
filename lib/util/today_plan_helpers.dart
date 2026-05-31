import 'package:intl/intl.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';

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
    final trimmed = raw.trim();
    if (trimmed.isEmpty) return null;
    for (final pattern in ['h:mm a', 'hh:mm a', 'H:mm', 'HH:mm']) {
      try {
        return DateFormat(pattern).parse(trimmed);
      } catch (_) {
        continue;
      }
    }
    return null;
  }

  /// Next timed item on [day], or the last item if the day is winding down.
  static TripItem? nextTripItem(TripDay day) {
    if (day.items.isEmpty) return null;
    final now = DateTime.now();
    TripItem? last;

    for (final item in day.items) {
      last = item;
      final parsed = parseScheduleTime(item.time);
      if (parsed == null) continue;
      final scheduled = DateTime(
        now.year,
        now.month,
        now.day,
        parsed.hour,
        parsed.minute,
      );
      if (!scheduled.isBefore(now)) {
        return item;
      }
    }

    return last;
  }

  static DayBlock? nextDayFlowBlock(DayFlow flow) {
    if (flow.isEmpty) return null;
    final hour = DateTime.now().hour;
    final current = switch (hour) {
      < 11 => DayPhase.morning,
      < 14 => DayPhase.midday,
      < 17 => DayPhase.afternoon,
      < 21 => DayPhase.evening,
      _ => DayPhase.night,
    };

    for (final block in flow.blocks) {
      if (_phaseRank(block.phase) >= _phaseRank(current)) {
        return block;
      }
    }
    return flow.blocks.last;
  }

  static int _phaseRank(DayPhase phase) => switch (phase) {
        DayPhase.morning => 0,
        DayPhase.midday => 1,
        DayPhase.afternoon => 2,
        DayPhase.evening => 3,
        DayPhase.night => 4,
      };
}

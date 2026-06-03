import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/services/crowd_prediction_service.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/smart_itinerary/experience_duration_catalog.dart';
import 'package:luxora_ai/util/place_distance.dart';

/// One stop with a realistic start/end window on a single calendar day.
class ScheduledDayBlock {
  const ScheduledDayBlock({
    required this.block,
    required this.start,
    required this.end,
    required this.driveMinutesBefore,
  });

  final DayBlock block;
  final DateTime start;
  final DateTime end;
  final int driveMinutesBefore;
}

/// Builds sequential visit times from block order, phase floors, drive, and duration.
abstract final class ItineraryDaySchedule {
  static const _dayEndHour = 22;
  static const _dayEndMinute = 30;

  static List<ScheduledDayBlock> build({
    required List<DayBlock> blocks,
    required LatLng dayStart,
    DateTime? anchorDate,
    bool compactDurations = false,
  }) {
    if (blocks.isEmpty) return const [];

    final anchor = anchorDate ?? DateTime.now();
    final dayAnchor = DateTime(anchor.year, anchor.month, anchor.day);
    final out = <ScheduledDayBlock>[];
    var prevEnd = dayAnchor;
    LatLng cursor = dayStart;

    for (var i = 0; i < blocks.length; i++) {
      final block = blocks[i];
      final here = LatLng(block.place.latitude, block.place.longitude);
      final driveMinutes = i == 0
          ? 0
          : PlaceDistance.driveMinutesBetween(cursor, here);
      final phaseFloor = CrowdPredictionService.timeForPhase(
        block.phase,
        dayAnchor,
      );
      var start = i == 0
          ? (phaseFloor.isAfter(dayAnchor) ? phaseFloor : dayAnchor)
          : prevEnd.add(Duration(minutes: driveMinutes));
      if (start.isBefore(phaseFloor)) {
        start = phaseFloor;
      }

      final durationMinutes = _visitDurationMinutes(
        block,
        totalStops: blocks.length,
        compact: compactDurations,
      );
      final end = start.add(Duration(minutes: durationMinutes));

      out.add(
        ScheduledDayBlock(
          block: block,
          start: start,
          end: end,
          driveMinutesBefore: driveMinutes,
        ),
      );
      prevEnd = end;
      cursor = here;
    }
    return out;
  }

  static int _visitDurationMinutes(
    DayBlock block, {
    required int totalStops,
    bool compact = false,
  }) {
    final profile = ExperienceDurationCatalog.profileFor(block.place);
    if (profile.isFullDayDestination) {
      if (totalStops > 1 || compact) {
        return profile.minDurationMinutes.clamp(120, 240);
      }
      return profile.idealDurationMinutes.clamp(240, 540);
    }
    if (ExperienceDurationCatalog.isWaterPark(block.place.id)) {
      if (totalStops > 1 || compact) {
        return profile.minDurationMinutes.clamp(120, 180);
      }
    }
    if (block.place.category == LuxPlaceCategory.dining ||
        block.reason == DayBlockReason.eveningDining) {
      final ideal = compact
          ? profile.minDurationMinutes
          : profile.idealDurationMinutes;
      return ideal.clamp(60, 120);
    }
    final ideal = compact ? profile.minDurationMinutes : profile.idealDurationMinutes;
    return ideal.clamp(
      profile.minDurationMinutes,
      profile.maxDurationMinutes,
    );
  }

  static String formatStartTime(DateTime start) =>
      DateFormat.jm('en_US').format(start);

  static String formatTimeRange(DateTime start, DateTime end) {
    final sameMeridiem =
        DateFormat('a', 'en_US').format(start) ==
        DateFormat('a', 'en_US').format(end);
    if (sameMeridiem) {
      return '${DateFormat('h:mm', 'en_US').format(start)}–${DateFormat.jm('en_US').format(end)}';
    }
    return '${DateFormat.jm('en_US').format(start)}–${DateFormat.jm('en_US').format(end)}';
  }

  static bool isFeasible({
    required List<DayBlock> blocks,
    required LatLng dayStart,
    DateTime? anchorDate,
    bool compactDurations = false,
  }) {
    final scheduled = build(
      blocks: blocks,
      dayStart: dayStart,
      anchorDate: anchorDate,
      compactDurations: compactDurations,
    );
    if (scheduled.isEmpty) return false;
    final last = scheduled.last;
    final dayEnd = DateTime(
      last.end.year,
      last.end.month,
      last.end.day,
      _dayEndHour,
      _dayEndMinute,
    );
    return !last.end.isAfter(dayEnd);
  }

  static List<TripItem> tripItemsFromBlocks({
    required List<DayBlock> blocks,
    required LatLng dayStart,
    required int dayNumber,
    required String idPrefix,
    required String Function(DayBlock block) blockLine,
    required String Function(String rawCategory) categoryLabel,
    DateTime? anchorDate,
  }) {
    final scheduled = build(
      blocks: blocks,
      dayStart: dayStart,
      anchorDate: anchorDate,
    );
    return [
      for (var i = 0; i < scheduled.length; i++)
        TripItem(
          id: '$idPrefix-${scheduled[i].block.place.id}-d$dayNumber-$i',
          time: formatTimeRange(scheduled[i].start, scheduled[i].end),
          title: scheduled[i].block.place.title,
          emotionalLine: blockLine(scheduled[i].block),
          location: scheduled[i].block.place.location,
          category: categoryLabel(scheduled[i].block.place.category.name),
          placeId: scheduled[i].block.place.id,
        ),
    ];
  }
}

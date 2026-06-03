import 'package:luxora_ai/services/day_flow_planner.dart';

/// Category of iconic destination moment — editorial, not live scheduling.
enum ExperienceMomentKind {
  fireworks,
  parade,
  show,
  diningWindow,
  atmosphere,
  seasonal,
}

/// A real “people come for this” moment tied to a place and time-of-day.
class ExperienceMoment {
  const ExperienceMoment({
    required this.id,
    required this.placeId,
    required this.kind,
    required this.title,
    required this.conciergeLine,
    required this.insiderTip,
    this.phase,
    this.priority = 50,
    this.tags = const [],
  });

  final String id;
  final String placeId;
  final ExperienceMomentKind kind;
  final String title;

  /// One line on the itinerary timeline — specific and actionable.
  final String conciergeLine;

  /// Longer tip for place detail, feed, or Right Now surfaces.
  final String insiderTip;

  /// When null, applies any time that place appears on the day.
  final DayPhase? phase;
  final int priority;
  final List<String> tags;
}

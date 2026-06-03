import 'package:luxora_ai/models/experience_moment.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/experience_moment_service.dart';

export 'package:luxora_ai/services/experience_moment_service.dart';

/// Orlando-specific alias — prefer [ExperienceMomentService] with an explicit cityId.
abstract final class OrlandoExperienceMomentService {
  static ExperienceMoment? primaryMoment({
    required String placeId,
    DayPhase? phase,
    TripProfile? profile,
  }) =>
      ExperienceMomentService.primaryMoment(
        placeId: placeId,
        phase: phase,
        profile: profile,
        cityId: 'orlando',
      );

  static String lineForSegment({
    required String placeId,
    required DayPhase phase,
    required String routeDescription,
    TripProfile? profile,
  }) =>
      ExperienceMomentService.lineForSegment(
        placeId: placeId,
        phase: phase,
        routeDescription: routeDescription,
        profile: profile,
        cityId: 'orlando',
      );

  static String lineForBlock({
    required DayBlock block,
    required String Function(DayBlockReason reason, String description)
        fallback,
  }) =>
      ExperienceMomentService.lineForBlock(
        block: block,
        fallback: fallback,
        cityId: 'orlando',
      );

  static String? insiderTipForPlace(String placeId) =>
      ExperienceMomentService.insiderTipForPlace(
        placeId,
        cityId: 'orlando',
      );

  static List<String> setupHighlights(TripProfile profile) =>
      ExperienceMomentService.setupHighlights(profile, cityId: 'orlando');
}

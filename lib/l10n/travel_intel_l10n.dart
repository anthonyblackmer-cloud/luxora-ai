import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/services/crowd_prediction_service.dart';
import 'package:luxora_ai/services/parking_difficulty_service.dart';

extension TravelIntelL10n on AppLocalizations {
  String crowdLevelLabel(CrowdLevel level) => switch (level) {
        CrowdLevel.quiet => mapCrowdLevelQuiet,
        CrowdLevel.moderate => mapCrowdLevelModerate,
        CrowdLevel.busy => mapCrowdLevelBusy,
        CrowdLevel.packed => mapCrowdLevelPacked,
      };

  String parkingLevelLabel(ParkingDifficulty level) => switch (level) {
        ParkingDifficulty.easy => mapParkingLevelEasy,
        ParkingDifficulty.moderate => mapParkingLevelModerate,
        ParkingDifficulty.difficult => mapParkingLevelDifficult,
        ParkingDifficulty.limited => mapParkingLevelLimited,
      };
}

import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/vacation_score_service.dart';
import 'package:luxora_ai/services/weather_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';

class VacationScoreBadge extends StatelessWidget {
  const VacationScoreBadge({
    super.key,
    required this.weather,
    required this.flow,
    this.profile,
    this.bookmarkCount = 0,
  });

  final LuxWeather? weather;
  final DayFlow flow;
  final TripProfile? profile;
  final int bookmarkCount;

  @override
  Widget build(BuildContext context) {
    final score = VacationScoreService.compute(
      weather: weather,
      flow: flow,
      profile: profile,
      bookmarkCount: bookmarkCount,
    );
    final l = context.l10n;

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GlassCard(
        child: Row(
          children: [
            SizedBox(
              width: 52,
              height: 52,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: score.score / 100,
                    strokeWidth: 4,
                    color: LuxColors.gold,
                    backgroundColor: Colors.white.withValues(alpha: 0.08),
                  ),
                  Text(
                    '${score.score}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                      color: LuxColors.gold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l.vacationScoreTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l.vacationScoreSubtitle(score.score),
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1.35,
                      color: LuxColors.stone400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

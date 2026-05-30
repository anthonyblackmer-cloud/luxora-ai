import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/miami/beach_intelligence.dart';
import 'package:luxora_ai/models/miami/miami_mood_route.dart';
import 'package:luxora_ai/models/miami/nightlife_venue.dart';
import 'package:luxora_ai/services/miami_concierge_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';

/// Beach Intelligence scores for Miami beach pins.
class MiamiBeachIntelCard extends StatelessWidget {
  const MiamiBeachIntelCard({super.key, required this.intel});

  final BeachIntelligence intel;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.miamiBeachIntelTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: LuxColors.cream,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l.miamiBeachBestTime(intel.bestTimeToVisit),
            style: TextStyle(fontSize: 13, color: LuxColors.stone400),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _ScoreChip(l.miamiBeachFamilyScore, intel.familyFriendlyScore),
              _ScoreChip(l.miamiBeachCrowdScore, intel.crowdScore),
              _ScoreChip(l.miamiBeachPhotoScore, intel.photoScore),
              _ScoreChip(l.miamiBeachRomanceScore, intel.romanceScore),
              _ScoreChip(l.miamiBeachSunsetScore, intel.sunsetValue),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            l.miamiBeachParking(intel.parkingDifficulty),
            style: TextStyle(fontSize: 12, color: LuxColors.stone500),
          ),
        ],
      ),
    );
  }
}

class _ScoreChip extends StatelessWidget {
  const _ScoreChip(this.label, this.score);

  final String label;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: LuxColors.gold.withValues(alpha: 0.1),
        border: Border.all(color: LuxColors.gold.withValues(alpha: 0.2)),
      ),
      child: Text(
        '$label $score',
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: LuxColors.cream,
        ),
      ),
    );
  }
}

/// Nightlife concierge card for Miami venues.
class MiamiNightlifeCard extends StatelessWidget {
  const MiamiNightlifeCard({super.key, required this.venue});

  final NightlifeVenue venue;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.miamiNightlifeTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: LuxColors.cream,
            ),
          ),
          const SizedBox(height: 8),
          _row(Icons.checkroom_rounded, l.miamiNightlifeDressCode(venue.dressCode)),
          _row(Icons.schedule_rounded, l.miamiNightlifeArrival(venue.bestArrivalTime)),
          if (venue.reservationRecommended)
            _row(Icons.event_available_rounded, l.miamiNightlifeReservation),
          _row(Icons.music_note_rounded, venue.musicTags.join(' · ')),
          _row(Icons.directions_car_rounded, venue.transportNote),
        ],
      ),
    );
  }

  Widget _row(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: LuxColors.gold),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 13, color: LuxColors.stone300),
            ),
          ),
        ],
      ),
    );
  }
}

/// Horizontal mood route picker — Miami pack only.
class MiamiMoodRoutesPanel extends StatelessWidget {
  const MiamiMoodRoutesPanel({
    super.key,
    this.onRouteSelected,
  });

  final void Function(MiamiMoodRoute route)? onRouteSelected;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final routes = MiamiMoodRouteService.routesForActive();
    if (routes.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Text(
            l.miamiMoodRoutesTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: LuxColors.cream,
            ),
          ),
        ),
        SizedBox(
          height: 132,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: routes.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, i) {
              final route = routes[i];
              return GestureDetector(
                onTap: () => onRouteSelected?.call(route),
                child: Container(
                  width: 220,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        LuxColors.gold.withValues(alpha: 0.12),
                        const Color(0xFF1C1917),
                      ],
                    ),
                    border: Border.all(
                      color: LuxColors.gold.withValues(alpha: 0.22),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        route.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: LuxColors.cream,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        l.miamiMoodRouteStart(route.bestStartTime),
                        style: TextStyle(fontSize: 11, color: LuxColors.stone400),
                      ),
                      const Spacer(),
                      Text(
                        route.moodTags.take(3).join(' · '),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          color: LuxColors.gold.withValues(alpha: 0.85),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

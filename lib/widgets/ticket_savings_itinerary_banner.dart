import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/data/trip_plans.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/active_trip_plan_store.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/concierge_ticket_sync.dart';
import 'package:luxora_ai/services/saved_places_storage.dart';
import 'package:luxora_ai/services/ticket_savings_service.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';

/// Surfaces savings when the agenda includes stops with authorized ticket deals.
class TicketSavingsItineraryBanner extends StatelessWidget {
  const TicketSavingsItineraryBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        CityPackRegistry.instance,
        ActiveTripPlanStore.instance,
      ]),
      builder: (context, _) {
        final plan = samplePlanForActiveCity();
        return ValueListenableBuilder<TripProfile?>(
          valueListenable: TripProfileStore.instance.profile,
          builder: (context, profile, _) {
            return ValueListenableBuilder<Set<String>>(
              valueListenable: SavedPlacesStorage.instance.savedIds,
              builder: (context, savedIds, _) {
                final agendaMatches =
                    ConciergeTicketSync.matchesForPlan(plan);
                if (agendaMatches.isNotEmpty) {
                  return _AgendaDealsBanner(
                    matches: agendaMatches,
                    profile: profile,
                  );
                }

                final insights = TicketSavingsService.insightsFor(
                  plan: plan,
                  profile: profile,
                  savedPlaceIds: savedIds,
                );
                if (insights.isEmpty) return const SizedBox.shrink();
                return _InsightBanner(
                  insight: insights.first,
                  profile: profile,
                );
              },
            );
          },
        );
      },
    );
  }
}

class _AgendaDealsBanner extends StatelessWidget {
  const _AgendaDealsBanner({
    required this.matches,
    required this.profile,
  });

  final List<AgendaTicketMatch> matches;
  final TripProfile? profile;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final totalSave = ConciergeTicketSync.totalFamilySavingsUsd(
      matches,
      profile: profile,
    );
    final stopPreview = matches.take(3).map((m) => m.stopTitle).join(' · ');

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GlassCard(
        glow: true,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => context.push('/ticket-savings'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l.ticketRecommendedSavings,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                  color: LuxColors.gold.withValues(alpha: 0.9),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                l.ticketAgendaStopsSummary(matches.length),
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.4,
                  color: LuxColors.cream,
                ),
              ),
              if (stopPreview.isNotEmpty) ...[
                const SizedBox(height: 6),
                Text(
                  stopPreview,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.35,
                    color: LuxColors.stone400.withValues(alpha: 0.95),
                  ),
                ),
              ],
              const SizedBox(height: 8),
              Text(
                l.ticketAgendaStopsSavings(_usd(totalSave)),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: LuxColors.gold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                l.ticketBrowseAgendaDeals,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: LuxColors.gold.withValues(alpha: 0.85),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InsightBanner extends StatelessWidget {
  const _InsightBanner({
    required this.insight,
    required this.profile,
  });

  final TicketSavingsInsight insight;
  final TripProfile? profile;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GlassCard(
        glow: true,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => context.push('/ticket-savings'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l.ticketRecommendedSavings,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                  color: LuxColors.gold.withValues(alpha: 0.9),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                _insightMessage(l, insight),
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.4,
                  color: LuxColors.cream,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l.ticketEstimatedFamilySave(_usd(insight.estimatedFamilySavingsUsd)),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: LuxColors.gold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _insightMessage(dynamic l, TicketSavingsInsight insight) {
    return switch (insight.message) {
      'disney_pass' => l.ticketInsightDisneyPass,
      'universal_combo' => l.ticketInsightUniversalCombo,
      'seaworld_combo' => l.ticketInsightSeaworldCombo,
      'miami_culture' => l.ticketInsightMiamiCulture,
      'miami_everglades' => l.ticketInsightMiamiEverglades,
      'miami_wynwood' => l.ticketInsightMiamiWynwood,
      _ => l.ticketInsightGeneric,
    };
  }
}

String _usd(int amount) => '\$$amount';

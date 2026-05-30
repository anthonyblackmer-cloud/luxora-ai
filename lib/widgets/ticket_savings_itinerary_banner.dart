import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/data/trip_plans.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/saved_places_storage.dart';
import 'package:luxora_ai/services/ticket_savings_service.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';

/// Surfaces savings when the itinerary includes major parks.
class TicketSavingsItineraryBanner extends StatelessWidget {
  const TicketSavingsItineraryBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TripProfile?>(
      valueListenable: TripProfileStore.instance.profile,
      builder: (context, profile, _) {
        return ValueListenableBuilder<Set<String>>(
          valueListenable: SavedPlacesStorage.instance.savedIds,
          builder: (context, savedIds, _) {
            final insights = TicketSavingsService.insightsFor(
              plan: sampleGoldenEscapePlan,
              profile: profile,
              savedPlaceIds: savedIds,
            );
            if (insights.isEmpty) return const SizedBox.shrink();
            final top = insights.first;
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
                        _insightMessage(l, top),
                        style: const TextStyle(
                          fontSize: 13,
                          height: 1.4,
                          color: LuxColors.cream,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l.ticketEstimatedFamilySave(_usd(top.estimatedFamilySavingsUsd)),
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
          },
        );
      },
    );
  }

  String _insightMessage(dynamic l, insight) {
    return switch (insight.message as String) {
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

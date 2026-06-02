import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/attraction_detail_sheet.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';
import 'package:luxora_ai/widgets/trip_item_ticket_link.dart';
import 'package:luxora_ai/widgets/unsplash_attribution.dart';

/// Chronological list of stops for a single trip day.
class ItineraryDayTimeline extends StatelessWidget {
  const ItineraryDayTimeline({super.key, required this.day});

  final TripDay day;

  @override
  Widget build(BuildContext context) {
    final tokens = luxThemeTokensOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(day.items.length, (i) {
        final item = day.items[i];
        final thumbPlace = PlacesRepository.instance.byId(item.placeId);

        return Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: thumbPlace != null ? 6 : 12,
                    backgroundColor: tokens.accent.withValues(
                      alpha: thumbPlace != null ? 0.95 : 0.2,
                    ),
                    child: thumbPlace == null
                        ? Text(
                            '${i + 1}',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: tokens.accent,
                            ),
                          )
                        : null,
                  ),
                  if (i < day.items.length - 1)
                    Container(
                      width: 2,
                      height: thumbPlace != null ? 220 : 72,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      color: tokens.accent.withValues(alpha: 0.25),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: thumbPlace == null
                      ? null
                      : () => showAttractionDetailSheet(
                            context,
                            place: thumbPlace,
                          ),
                  child: GlassCard(
                    glow: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (thumbPlace != null) ...[
                          LuxPlaceImage(
                            place: thumbPlace,
                            presentation: LuxImagePresentation.feedHero,
                            borderRadius: BorderRadius.circular(12),
                            trackUsageOnDisplay: true,
                          ),
                          const SizedBox(height: 12),
                        ],
                        Text(
                          item.time,
                          style: TextStyle(
                            fontSize: 12,
                            color: tokens.accent.withValues(alpha: 0.9),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          catalogText(context, item.title),
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          catalogText(context, item.emotionalLine),
                          style: TextStyle(
                            color: tokens.textMuted,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${catalogText(context, item.location)} · ${catalogText(context, item.category)}',
                          style: TextStyle(
                            fontSize: 11,
                            color: tokens.textMuted.withValues(alpha: 0.85),
                          ),
                        ),
                        TripItemTicketLink(item: item),
                        if (thumbPlace?.unsplashPhoto case final photo?) ...[
                          const SizedBox(height: 10),
                          UnsplashAttribution(
                            photo: photo,
                            compact: true,
                            onDark: false,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

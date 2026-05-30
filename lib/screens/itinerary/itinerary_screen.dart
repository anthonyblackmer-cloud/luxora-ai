import 'package:flutter/material.dart';
import 'package:luxora_ai/data/trip_plans.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/attraction_detail_sheet.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';
import 'package:luxora_ai/widgets/lux_secondary_app_bar.dart';
import 'package:luxora_ai/widgets/unsplash_attribution.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/ticket_savings_itinerary_banner.dart';

class ItineraryScreen extends StatelessWidget {
  const ItineraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: LuxSecondaryAppBar(title: l.navTimeline),
      body: SafeArea(
        top: false,
        child: ListenableBuilder(
          listenable: CityPackRegistry.instance,
          builder: (context, _) {
            final plan = samplePlanForActiveCity();
            final tokens = luxThemeTokensOf(context);
            return DefaultTabController(
              length: plan.days.length,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(20),
                      children: [
                        Text(
                          l.itineraryBadge,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.5,
                            color: tokens.accent.withValues(alpha: 0.8),
                          ),
                        ),
                        Text(
                          plan.title,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l.itineraryTagline,
                          style: TextStyle(
                            color: tokens.textMuted,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const TicketSavingsItineraryBanner(),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: tokens.panelFill,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: tokens.borderSubtle),
                          ),
                          child: TabBar(
                            isScrollable: true,
                            indicatorColor: tokens.accent,
                            dividerColor: Colors.transparent,
                            labelColor: tokens.textPrimary,
                            unselectedLabelColor: tokens.textMuted,
                            tabs: [
                              for (final day in plan.days)
                                Tab(
                                  text: l.itineraryDayTab(
                                    day.dayNumber,
                                    day.label,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 560,
                          child: TabBarView(
                            children: [
                              for (final day in plan.days)
                                _ItineraryDayView(day: day),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ItineraryDayView extends StatelessWidget {
  const _ItineraryDayView({required this.day});

  final TripDay day;

  @override
  Widget build(BuildContext context) {
    final tokens = luxThemeTokensOf(context);
    return ListView.builder(
      itemCount: day.items.length,
      itemBuilder: (context, i) {
        final item = day.items[i];
        final thumbPlace = PlacesRepository.instance.byId(item.placeId);
        return Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  if (thumbPlace != null)
                    LuxPlaceImage(
                      place: thumbPlace,
                      presentation: LuxImagePresentation.timelineThumb,
                      borderRadius: BorderRadius.circular(10),
                      trackUsageOnDisplay: true,
                    )
                  else
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: tokens.accent.withValues(alpha: 0.2),
                      child: Text(
                        '${i + 1}',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: tokens.accent,
                        ),
                      ),
                    ),
                  if (i < day.items.length - 1)
                    Container(
                      width: 2,
                      height: thumbPlace != null ? 64 : 72,
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
      },
    );
  }
}

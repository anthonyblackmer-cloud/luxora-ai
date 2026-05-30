import 'package:flutter/material.dart';
import 'package:luxora_ai/data/trip_plans.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/services/active_day_flow_store.dart';
import 'package:luxora_ai/services/active_trip_plan_store.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/util/day_flow_share_content.dart';
import 'package:luxora_ai/widgets/attraction_detail_sheet.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';
import 'package:luxora_ai/widgets/lux_secondary_app_bar.dart';
import 'package:luxora_ai/widgets/unsplash_attribution.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/ticket_savings_itinerary_banner.dart';
import 'package:luxora_ai/widgets/trip_item_ticket_link.dart';
import 'package:luxora_ai/widgets/visual_share_icon_button.dart';

/// Full trip agenda — day-by-day stops, ticket deals, and today's Concierge plan.
class ItineraryScreen extends StatelessWidget {
  const ItineraryScreen({super.key, this.primaryTab = false});

  /// When true, renders as the main Agenda tab (no secondary app bar).
  final bool primaryTab;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);

    final body = ListenableBuilder(
      listenable: Listenable.merge([
        CityPackRegistry.instance,
        ActiveTripPlanStore.instance,
        ActiveDayFlowStore.instance,
      ]),
      builder: (context, _) {
        final plan = samplePlanForActiveCity();
        final dayFlow = ActiveDayFlowStore.instance.flowForActiveCity();
        return DefaultTabController(
          length: plan.days.length,
          child: ListView(
            padding: EdgeInsets.fromLTRB(20, primaryTab ? 12 : 20, 20, 24),
            children: [
              if (primaryTab) ...[
                Text(
                  l.navAgenda,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.42,
                        height: 1.02,
                        color: tokens.textPrimary,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  l.agendaPageSubtitle,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: tokens.textMuted,
                        fontWeight: FontWeight.w600,
                        height: 1.25,
                      ),
                ),
                const SizedBox(height: 20),
              ],
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
              if (dayFlow != null && !dayFlow.isEmpty) ...[
                const SizedBox(height: 12),
                GlassCard(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          l.itinerarySameAsMapAgenda,
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.4,
                            color: tokens.textPrimary,
                          ),
                        ),
                      ),
                      VisualShareIconButton(
                        subject: l.mapPlanDayTitle,
                        fileName: 'luxora_day_agenda.png',
                        shareWidth: 420,
                        color: LuxColors.gold,
                        background: LuxColors.gold.withValues(alpha: 0.12),
                        cardBuilder: (ctx) =>
                            buildDayAgendaShareCard(ctx, dayFlow),
                      ),
                    ],
                  ),
                ),
              ],
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
                    for (final day in plan.days) _ItineraryDayView(day: day),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );

    if (primaryTab) {
      return DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.38, 0.72, 1.0],
            colors: [
              tokens.bg,
              Color.lerp(tokens.bg, tokens.accent, 0.04)!,
              Color.lerp(tokens.bg, tokens.accent, 0.02)!,
              tokens.bgSecondary.withValues(alpha: 0.94),
            ],
          ),
        ),
        child: SafeArea(child: body),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: LuxSecondaryAppBar(title: l.navAgenda),
      body: SafeArea(top: false, child: body),
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
      },
    );
  }
}

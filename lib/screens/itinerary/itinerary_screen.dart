import 'dart:async';

import 'package:flutter/material.dart';
import 'package:luxora_ai/data/trip_plans.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/services/active_day_flow_store.dart';
import 'package:luxora_ai/services/active_trip_plan_store.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/services/unsplash_photo_registry.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/util/day_flow_share_content.dart';
import 'package:luxora_ai/util/today_plan_helpers.dart';
import 'package:luxora_ai/widgets/agenda/agenda_collapsible_section.dart';
import 'package:luxora_ai/widgets/agenda/agenda_day_dropdown.dart';
import 'package:luxora_ai/widgets/agenda/agenda_dining_suggestions.dart';
import 'package:luxora_ai/widgets/agenda/agenda_stay_suggestions.dart';
import 'package:luxora_ai/services/journey_message_flags.dart';
import 'package:luxora_ai/widgets/agenda/itinerary_ready_banner.dart';
import 'package:luxora_ai/widgets/agenda/today_dashboard.dart';
import 'package:luxora_ai/widgets/attraction_detail_sheet.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';
import 'package:luxora_ai/widgets/lux_secondary_app_bar.dart';
import 'package:luxora_ai/widgets/unsplash_attribution.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/freemium/freemium_locked_days_panel.dart';
import 'package:luxora_ai/services/freemium_service.dart';
import 'package:luxora_ai/services/freemium_limits.dart';
import 'package:luxora_ai/widgets/trip_item_ticket_link.dart';
import 'package:luxora_ai/widgets/ticket_savings_itinerary_banner.dart';
import 'package:luxora_ai/widgets/visual_share_icon_button.dart';

/// Today tab — focused daily dashboard plus day-by-day plan.
class ItineraryScreen extends StatefulWidget {
  const ItineraryScreen({super.key, this.primaryTab = false});

  /// When true, renders as the main Today tab (no secondary app bar).
  final bool primaryTab;

  @override
  State<ItineraryScreen> createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  int _selectedDayIndex = 0;
  bool _manualDayOverride = false;
  bool _showItineraryReady = false;

  @override
  void initState() {
    super.initState();
    PlacesRepository.instance.ensureLocalCatalogLoaded();
    unawaited(_ensureAgendaMediaReady());
    unawaited(_loadItineraryReadyFlag());
  }

  Future<void> _loadItineraryReadyFlag() async {
    final pending = await JourneyMessageFlags.consumeItineraryReadyPending();
    if (!mounted) return;
    if (pending) setState(() => _showItineraryReady = true);
  }

  Future<void> _ensureAgendaMediaReady() async {
    await Future.wait([
      UnsplashPhotoRegistry.instance.ensureLoaded(),
      PlacesRepository.instance.initialize(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);

    final body = ListenableBuilder(
      listenable: Listenable.merge([
        CityPackRegistry.instance,
        ActiveTripPlanStore.instance,
        ActiveDayFlowStore.instance,
        TripProfileStore.instance.profile,
        PlacesRepository.instance,
        UnsplashPhotoRegistry.instance,
      ]),
      builder: (context, _) {
        final plan = samplePlanForActiveCity();
        final profile = TripProfileStore.instance.profile.value;
        final dayFlow = ActiveDayFlowStore.instance.flowForActiveCity();
        final days = plan.days;
        final autoDay = days.isEmpty
            ? null
            : TodayPlanHelpers.dayIndexForToday(
                startDateIso: profile?.startDate,
                dayCount: days.length,
              );
        final rawIndex =
            _manualDayOverride ? _selectedDayIndex : (autoDay ?? _selectedDayIndex);
        var dayIndex =
            days.isEmpty ? 0 : rawIndex.clamp(0, days.length - 1);
        if (!FreemiumService.hasFullAccess() &&
            dayIndex > FreemiumLimits.freeDayIndex) {
          dayIndex = FreemiumLimits.freeDayIndex;
        }
        final selectedDay = days.isEmpty ? null : days[dayIndex];

        return ListView(
          padding: EdgeInsets.fromLTRB(20, widget.primaryTab ? 12 : 20, 20, 24),
          children: [
            if (widget.primaryTab) ...[
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
              const SizedBox(height: 16),
            ],
            if (_showItineraryReady)
              ItineraryReadyBanner(
                onDismiss: () => setState(() => _showItineraryReady = false),
              ),
            if (days.isNotEmpty) ...[
              FreemiumLockedDaysPanel(days: days),
              AgendaDayDropdown(
                days: days,
                selectedIndex: dayIndex,
                lockedDayIndices: FreemiumService.hasFullAccess()
                    ? const {}
                    : {for (var i = 1; i < days.length; i++) i},
                onChanged: (index) async {
                  if (!FreemiumService.canAccessDay(index)) {
                    await FreemiumService.promptUnlock(
                      context,
                      trigger: FreemiumUnlockTrigger.dayTwoPlus,
                    );
                    return;
                  }
                  setState(() {
                    _manualDayOverride = true;
                    _selectedDayIndex = index;
                  });
                },
              ),
              const SizedBox(height: 16),
            ],
            TodayDashboard(
              selectedDay: selectedDay,
              profile: profile,
            ),
            const SizedBox(height: 16),
            Text(
              l.todayPlanDetailsTitle,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            if (selectedDay != null) ...[
              const SizedBox(height: 12),
              _ItineraryDayTimeline(day: selectedDay),
            ],
            const SizedBox(height: 16),
            AgendaCollapsibleSection(
              title: l.todayStaysDiningSection,
              subtitle: l.todayStaysDiningCollapsedHint,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AgendaStaySuggestions(plan: plan),
                  if (selectedDay != null) ...[
                    const SizedBox(height: 16),
                    AgendaDiningSuggestions(
                      key: ValueKey(selectedDay.dayNumber),
                      day: selectedDay,
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 12),
            AgendaCollapsibleSection(
              title: l.todayExtrasSection,
              subtitle: l.todayExtrasCollapsedHint,
              initiallyExpanded: false,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (dayFlow != null && !dayFlow.isEmpty)
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
                    if (dayFlow != null && !dayFlow.isEmpty)
                      const SizedBox(height: 12),
                    const TicketSavingsItineraryBanner(),
                  ],
                ),
              ),
          ],
        );
      },
    );

    if (widget.primaryTab) {
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

class _ItineraryDayTimeline extends StatelessWidget {
  const _ItineraryDayTimeline({required this.day});

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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/data/saved_trips.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/saved_trips_store.dart';
import 'package:luxora_ai/services/trip_cover_resolver.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/attraction_detail_sheet.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_button.dart';
import 'package:luxora_ai/widgets/trip_dates_editor_sheet.dart';
import 'package:luxora_ai/widgets/visual_itinerary_share_card.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l.tripsBadge,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.5,
                          color: tokens.accent.withValues(alpha: 0.8),
                        ),
                      ),
                      Text(
                        l.tripsTitle,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        l.tripsSubtitle,
                        style: TextStyle(
                          color: tokens.textMuted,
                          fontSize: 13,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
                LuxButton(
                  label: l.commonNew,
                  icon: Icons.add_rounded,
                  fullWidth: false,
                  onPressed: () => context.push('/onboarding'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListenableBuilder(
                listenable: CityPackRegistry.instance,
                builder: (context, _) {
                  final activeCity = CityPackRegistry.instance.active.cityId;
                  return ValueListenableBuilder<List<SavedTripSummary>>(
                valueListenable: SavedTripsStore.instance.trips,
                builder: (context, trips, _) {
                  final visible = trips
                      .where((t) => t.matchesActiveCity(activeCity))
                      .toList();
                  if (visible.isEmpty) {
                    return _EmptyTrips(onCreate: () => context.push('/onboarding'));
                  }
                  return ListView(
                    children: [
                      for (final trip in visible)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: _TripCard(
                            trip: trip,
                            onDelete: () => _confirmDelete(context, trip),
                          ),
                        ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            l.tripsFooter,
                            style: const TextStyle(
                              fontSize: 11,
                              color: LuxColors.stone500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    SavedTripSummary trip,
  ) async {
    final l = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1C1917),
        title: Text(l.tripsDeleteTitle),
        content: Text(l.tripsDeleteBody(catalogText(context, trip.title))),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l.commonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: TextButton.styleFrom(foregroundColor: const Color(0xFFEF4444)),
            child: Text(l.commonDelete),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await SavedTripsStore.instance.remove(trip.id);
      messenger.showSnackBar(
        SnackBar(
          content: Text(l.tripsDeleted),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}

class _EmptyTrips extends StatelessWidget {
  const _EmptyTrips({required this.onCreate});

  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.luggage_outlined,
            size: 56,
            color: LuxColors.gold.withValues(alpha: 0.6),
          ),
          const SizedBox(height: 16),
          Text(
            l.tripsEmptyTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: LuxColors.cream,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              l.tripsEmptyBody,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                height: 1.4,
                color: LuxColors.stone400,
              ),
            ),
          ),
          const SizedBox(height: 20),
          LuxButton(
            label: l.tripsPlanNew,
            icon: Icons.add_rounded,
            onPressed: onCreate,
          ),
        ],
      ),
    );
  }
}

class _TripCard extends StatefulWidget {
  const _TripCard({required this.trip, required this.onDelete});

  final SavedTripSummary trip;
  final VoidCallback onDelete;

  @override
  State<_TripCard> createState() => _TripCardState();
}

class _TripCardState extends State<_TripCard> {
  bool _expanded = false;

  /// Composes a cinematic, shareable itinerary card as text and hands it to
  /// the OS share sheet.
  Future<void> _shareTrip() async {
    final l = context.l10n;
    final trip = widget.trip;
    final title = catalogText(context, trip.title);
    final lines = <String>['\u2728 $title', catalogText(context, trip.dateRange)];
    final snapshot = trip.timelineSnapshot;
    if (snapshot != null && snapshot.trim().isNotEmpty) {
      lines.add('');
      lines.add(catalogText(context, snapshot));
    }
    final moods =
        trip.moodTags.map((t) => catalogText(context, t)).join(' \u00b7 ');
    if (moods.isNotEmpty) lines.add(moods);
    final sunset = trip.sunsetWindow;
    if (sunset != null && sunset.trim().isNotEmpty) {
      lines.add('\ud83c\udf05 ${catalogText(context, sunset)}');
    }
    lines.add('');
    lines.add(l.shareItineraryFooter);

    await SharePlus.instance.share(
      ShareParams(text: lines.join('\n'), subject: l.shareSubject(title)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final trip = widget.trip;
    final l = context.l10n;

    final cover = TripCoverResolver.instance.forSavedTrip(trip);

    return GlassCard(
      glow: trip.routeOptimized,
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LuxPlaceImage(
            place: cover,
            presentation: LuxImagePresentation.tripCover,
            trackUsageOnDisplay: true,
            onUserSelect: cover == null
                ? null
                : () => showAttractionDetailSheet(
                      context,
                      place: cover,
                    ),
            fallbackGradient: const [
              Color(0xFFF59E0B),
              Color(0xFF1C1917),
            ],
          ),
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                catalogText(context, trip.title),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            _StatusChip(
                              label: trip.timelineStatus,
                              highlight: trip.routeOptimized,
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              _expanded
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                              color: LuxColors.stone500,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: widget.onDelete,
                        tooltip: l.commonDelete,
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 36,
                          minHeight: 36,
                        ),
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          size: 22,
                          color: LuxColors.stone400.withValues(alpha: 0.95),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  InkWell(
                    onTap: () => TripDatesEditorSheet.show(context, trip),
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              catalogText(context, trip.dateRange),
                              style: const TextStyle(
                                fontSize: 12,
                                color: LuxColors.stone500,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.edit_calendar_rounded,
                            size: 16,
                            color: LuxColors.gold.withValues(alpha: 0.85),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    catalogText(context, trip.statusLine),
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.4,
                      color: LuxColors.stone300,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (trip.weatherWindow != null) ...[
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.wb_sunny_outlined,
                          size: 15,
                          color: LuxColors.gold.withValues(alpha: 0.75),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            catalogText(context, trip.weatherWindow!),
                            style: TextStyle(
                              fontSize: 12,
                              color: LuxColors.gold.withValues(alpha: 0.85),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: trip.moodTags
                        .map((t) => _MoodTag(label: catalogText(context, t)))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstCurve: Curves.easeOut,
            secondCurve: Curves.easeIn,
            crossFadeState: _expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 220),
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (trip.liveWeatherNote != null)
                    _PreviewRow(
                      icon: Icons.cloud_outlined,
                      label: l.tripsLiveWeather,
                      value: catalogText(context, trip.liveWeatherNote!),
                      accent: LuxColors.feedAccent,
                    ),
                  if (trip.nextExperience != null)
                    _PreviewRow(
                      icon: Icons.place_outlined,
                      label: l.tripsNextUp,
                      value: catalogText(context, trip.nextExperience!),
                    ),
                  if (trip.sunsetWindow != null)
                    _PreviewRow(
                      icon: Icons.wb_twilight_rounded,
                      label: l.tripsSunsetWindow,
                      value: catalogText(context, trip.sunsetWindow!),
                      accent: LuxColors.gold,
                    ),
                  if (trip.timelineSnapshot != null)
                    _PreviewRow(
                      icon: Icons.view_timeline_outlined,
                      label: l.tripsTimelineSnapshot,
                      value: catalogText(context, trip.timelineSnapshot!),
                    ),
                  const SizedBox(height: 12),
                  VisualItineraryShareCard(
                    title: catalogText(context, trip.title),
                    subtitle: catalogText(context, trip.dateRange),
                    lines: [
                      if (trip.timelineSnapshot != null)
                        catalogText(context, trip.timelineSnapshot!),
                      catalogText(context, trip.statusLine),
                      if (trip.sunsetWindow != null)
                        catalogText(context, trip.sunsetWindow!),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      TextButton.icon(
                        onPressed: () => context.push('/trip-story', extra: trip),
                        icon: const Icon(Icons.auto_stories_rounded, size: 18),
                        label: Text(l.tripsOpenStory),
                        style: TextButton.styleFrom(
                          foregroundColor: LuxColors.gold,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () => context.push('/itinerary'),
                        icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                        label: Text(l.tripsOpenTimeline),
                        style: TextButton.styleFrom(
                          foregroundColor: LuxColors.gold,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: _shareTrip,
                        icon: const Icon(Icons.ios_share_rounded, size: 18),
                        label: Text(l.tripsShare),
                        style: TextButton.styleFrom(
                          foregroundColor: LuxColors.gold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PreviewRow extends StatelessWidget {
  const _PreviewRow({
    required this.icon,
    required this.label,
    required this.value,
    this.accent,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color? accent;

  @override
  Widget build(BuildContext context) {
    final color = accent ?? LuxColors.stone400;
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: color.withValues(alpha: 0.85)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    color: color.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.35,
                    color: LuxColors.stone300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.label, this.highlight = false});

  final String label;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: highlight
            ? LuxColors.gold.withValues(alpha: 0.15)
            : Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: highlight
              ? LuxColors.gold.withValues(alpha: 0.4)
              : Colors.white.withValues(alpha: 0.1),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: highlight ? LuxColors.gold : LuxColors.stone400,
        ),
      ),
    );
  }
}

class _MoodTag extends StatelessWidget {
  const _MoodTag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withValues(alpha: 0.05),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 11, color: LuxColors.stone400),
      ),
    );
  }
}

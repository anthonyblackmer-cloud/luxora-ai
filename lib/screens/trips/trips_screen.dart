import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/data/saved_trips.dart';
import 'package:luxora_ai/services/trip_cover_resolver.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_button.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        'COLLECTIONS',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.5,
                          color: LuxColors.gold.withValues(alpha: 0.8),
                        ),
                      ),
                      Text(
                        'Saved trips',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Tap a trip for a live snapshot — next moment, weather, sunset, and timeline.',
                        style: TextStyle(
                          color: LuxColors.stone400,
                          fontSize: 13,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
                LuxButton(
                  label: 'New',
                  icon: Icons.add_rounded,
                  onPressed: () => context.push('/onboarding'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  for (final trip in savedTripSummaries)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: _TripCard(trip: trip),
                    ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Trip covers from mood catalog · Supabase sync Phase 2',
                        style: TextStyle(fontSize: 11, color: LuxColors.stone500),
                      ),
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

class _TripCard extends StatefulWidget {
  const _TripCard({required this.trip});

  final SavedTripSummary trip;

  @override
  State<_TripCard> createState() => _TripCardState();
}

class _TripCardState extends State<_TripCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final trip = widget.trip;

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
            fallbackGradient: const [
              Color(0xFFF59E0B),
              Color(0xFF1C1917),
            ],
          ),
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          trip.title,
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
                  const SizedBox(height: 6),
                  Text(
                    trip.dateRange,
                    style: const TextStyle(
                      fontSize: 12,
                      color: LuxColors.stone500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    trip.statusLine,
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
                            trip.weatherWindow!,
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
                    children:
                        trip.moodTags.map((t) => _MoodTag(label: t)).toList(),
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
                      label: 'Live weather',
                      value: trip.liveWeatherNote!,
                      accent: LuxColors.feedAccent,
                    ),
                  if (trip.nextExperience != null)
                    _PreviewRow(
                      icon: Icons.place_outlined,
                      label: 'Next up',
                      value: trip.nextExperience!,
                    ),
                  if (trip.sunsetWindow != null)
                    _PreviewRow(
                      icon: Icons.wb_twilight_rounded,
                      label: 'Sunset window',
                      value: trip.sunsetWindow!,
                      accent: LuxColors.gold,
                    ),
                  if (trip.timelineSnapshot != null)
                    _PreviewRow(
                      icon: Icons.view_timeline_outlined,
                      label: 'Timeline snapshot',
                      value: trip.timelineSnapshot!,
                    ),
                  const SizedBox(height: 12),
                  TextButton.icon(
                    onPressed: () => context.go('/itinerary'),
                    icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                    label: const Text('Open full timeline'),
                    style: TextButton.styleFrom(
                      foregroundColor: LuxColors.gold,
                    ),
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

import 'package:flutter/material.dart';
import 'package:luxora_ai/data/saved_trips.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_background.dart';

/// Post-trip memory reel — "Your Orlando Story" (text MVP).
class TripStoryScreen extends StatelessWidget {
  const TripStoryScreen({super.key, required this.trip});

  final SavedTripSummary trip;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final beats = <String>[
      if (trip.moodTags.isNotEmpty)
        l.tripStoryBeatMoods(trip.moodTags.join(' · ')),
      l.tripStoryBeatTitle(trip.title),
      if (trip.timelineSnapshot != null && trip.timelineSnapshot!.trim().isNotEmpty)
        trip.timelineSnapshot!,
      trip.statusLine,
      l.tripStoryBeatClosing,
    ];

    return LuxBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(l.tripStoryTitle),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text(
                l.tripStoryHeading(trip.title),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              GlassCard(
                glow: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final beat in beats)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          beat,
                          style: const TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            color: LuxColors.cream,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

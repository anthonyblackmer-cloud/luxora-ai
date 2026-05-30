import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/golden_hour_service.dart';
import 'package:luxora_ai/services/weather_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:latlong2/latlong.dart';

/// Golden-hour leave-by timing for the best nearby sunset spot.
class GoldenHourCard extends StatelessWidget {
  const GoldenHourCard({
    super.key,
    required this.weather,
    required this.origin,
    required this.pool,
    this.profile,
    this.onPlaceTap,
  });

  final LuxWeather? weather;
  final LatLng origin;
  final List<LuxPlace> pool;
  final TripProfile? profile;
  final void Function(LuxPlace place)? onPlaceTap;

  @override
  Widget build(BuildContext context) {
    final plan = GoldenHourService.plan(
      weather: weather,
      origin: origin,
      pool: pool,
      profile: profile,
    );
    if (plan == null) return const SizedBox.shrink();

    final l = context.l10n;
    final locale = Localizations.localeOf(context);
    final leaveTime = DateFormat.jm(locale.toLanguageTag()).format(plan.leaveBy);
    final placeName = catalogText(context, plan.place.title);

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GlassCard(
        glow: true,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => onPlaceTap?.call(plan.place),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.wb_twilight_rounded, color: LuxColors.gold, size: 22),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      l.goldenHourTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                l.goldenHourLeaveBy(leaveTime, plan.driveMinutes, placeName),
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.45,
                  color: LuxColors.cream,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _kindLabel(l, plan.kind),
                style: const TextStyle(fontSize: 12, color: LuxColors.stone400),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _kindLabel(AppLocalizations l, GoldenHourKind kind) => switch (kind) {
        GoldenHourKind.beach => l.goldenHourKindBeach,
        GoldenHourKind.rooftop => l.goldenHourKindRooftop,
        GoldenHourKind.scenic => l.goldenHourKindScenic,
      };
}

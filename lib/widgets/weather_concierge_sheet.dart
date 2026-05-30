import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/weather_concierge_advisor.dart';
import 'package:luxora_ai/services/weather_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_button.dart';
import 'package:luxora_ai/widgets/settings/luxora_premium_sheet_shell.dart';
import 'package:luxora_ai/widgets/weather_ui.dart';

Future<void> showWeatherConciergeSheet(
  BuildContext context, {
  required LuxWeather weather,
  required String placeLabel,
  required DayFlow flow,
  required List<LuxPlace> pool,
  VoidCallback? onAdjustDay,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) => FractionallySizedBox(
      heightFactor: 0.94,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 920),
          child: WeatherConciergeSheet(
            weather: weather,
            placeLabel: placeLabel,
            flow: flow,
            pool: pool,
            onAdjustDay: onAdjustDay,
          ),
        ),
      ),
    ),
  );
}

/// Full-screen travel-aware weather concierge — how today's sky shapes the trip.
class WeatherConciergeSheet extends StatelessWidget {
  const WeatherConciergeSheet({
    super.key,
    required this.weather,
    required this.placeLabel,
    required this.flow,
    required this.pool,
    this.onAdjustDay,
  });

  final LuxWeather weather;
  final String placeLabel;
  final DayFlow flow;
  final List<LuxPlace> pool;
  final VoidCallback? onAdjustDay;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final locale = Localizations.localeOf(context);
    final useF = locale.languageCode == 'en';
    final insight = WeatherConciergeAdvisor.build(
      l: l,
      weather: weather,
      flow: flow,
      pool: pool,
      localeTag: locale.toLanguageTag(),
    );

    return LuxoraPremiumSheetShell(
      title: l.weatherConciergeTitle,
      heightFraction: 0.94,
      footer: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
        child: LuxButton(
          label: l.weatherAdjustDay,
          icon: Icons.auto_fix_high_rounded,
          onPressed: onAdjustDay == null
              ? null
              : () {
                  Navigator.of(context).pop();
                  onAdjustDay!();
                },
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
        children: [
          _HeroSection(
            weather: weather,
            placeLabel: placeLabel,
            useFahrenheit: useF,
            locale: locale,
          ),
          const SizedBox(height: 18),
          _AdviceCard(lines: insight.adviceLines),
          const SizedBox(height: 18),
          _SectionTitle(l.weatherWhatToBring),
          const SizedBox(height: 10),
          _PackingRow(items: insight.packing),
          const SizedBox(height: 18),
          _SectionTitle(l.weatherPlanImpact),
          const SizedBox(height: 10),
          _PlanImpactCard(
            insight: insight,
            locale: locale,
          ),
          const SizedBox(height: 18),
          _SectionTitle(l.weatherHourlyTitle),
          const SizedBox(height: 10),
          _HourlyTimeline(
            weather: weather,
            highlights: insight.hourlyHighlights,
            useFahrenheit: useF,
            locale: locale,
          ),
          const SizedBox(height: 18),
          _SectionTitle(l.weatherLiveRadar),
          const SizedBox(height: 10),
          const _RadarPlaceholder(),
          const SizedBox(height: 18),
          _SectionTitle(l.weatherMapOverlays),
          const SizedBox(height: 10),
          const _OverlayToggles(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({
    required this.weather,
    required this.placeLabel,
    required this.useFahrenheit,
    required this.locale,
  });

  final LuxWeather weather;
  final String placeLabel;
  final bool useFahrenheit;
  final Locale locale;

  String _temp(double f) =>
      useFahrenheit ? '${f.round()}°F' : '${((f - 32) * 5 / 9).round()}°C';

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final gradient = _weatherGradient(weather.condition, weather.isDay);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: gradient,
        border: Border.all(color: LuxColors.gold.withValues(alpha: 0.22)),
        boxShadow: [
          BoxShadow(
            color: LuxColors.gold.withValues(alpha: 0.12),
            blurRadius: 32,
            spreadRadius: -8,
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.weatherToday(placeLabel),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
              color: LuxColors.gold.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                weatherConditionIcon(weather.condition, weather.isDay),
                color: LuxColors.gold,
                size: 44,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _temp(weather.temperatureF),
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: LuxColors.cream,
                        height: 1,
                      ),
                    ),
                    if (weather.feelsLikeF != null)
                      Text(
                        l.weatherFeelsLike(_temp(weather.feelsLikeF!)),
                        style: const TextStyle(
                          fontSize: 13,
                          color: LuxColors.stone400,
                        ),
                      ),
                    const SizedBox(height: 4),
                    Text(
                      weatherConditionLabel(l, weather.condition),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: LuxColors.cream,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _StatChip(
                icon: Icons.water_drop_outlined,
                label: l.weatherStatRain,
                value: '${weather.currentHourRainChance ?? weather.rainChance ?? 0}%',
              ),
              if (weather.humidity != null)
                _StatChip(
                  icon: Icons.water_rounded,
                  label: l.weatherHumidity,
                  value: '${weather.humidity}%',
                ),
              if (weather.windSpeedMph != null)
                _StatChip(
                  icon: Icons.air_rounded,
                  label: l.weatherWind,
                  value: l.weatherWindValue(
                    WeatherConciergeAdvisor.windDirectionLabel(
                      weather.windDirectionDeg,
                    ),
                    weather.windSpeedMph!.round(),
                  ),
                ),
              if (weather.uvIndex != null)
                _StatChip(
                  icon: Icons.wb_sunny_outlined,
                  label: l.weatherUv,
                  value: weather.uvIndex!.toStringAsFixed(1),
                ),
              if (weather.cloudCover != null)
                _StatChip(
                  icon: Icons.cloud_queue_rounded,
                  label: l.weatherCloudCover,
                  value: '${weather.cloudCover}%',
                ),
              if (weather.visibilityMiles != null)
                _StatChip(
                  icon: Icons.visibility_outlined,
                  label: l.weatherVisibility,
                  value: l.weatherVisibilityMiles(
                    weather.visibilityMiles!.toStringAsFixed(1),
                  ),
                ),
              if (weather.sunrise != null)
                _StatChip(
                  icon: Icons.wb_twilight_rounded,
                  label: l.weatherSunrise(
                    DateFormat.jm(locale.toLanguageTag()).format(weather.sunrise!),
                  ),
                  value: '',
                  hideValue: true,
                ),
              if (weather.sunset != null)
                _StatChip(
                  icon: Icons.nights_stay_outlined,
                  label: l.weatherSunset(
                    DateFormat.jm(locale.toLanguageTag()).format(weather.sunset!),
                  ),
                  value: '',
                  hideValue: true,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

LinearGradient _weatherGradient(LuxWeatherCondition c, bool isDay) {
  final top = switch (c) {
    LuxWeatherCondition.clear =>
      isDay ? const Color(0xFF1A2744) : const Color(0xFF0F1528),
    LuxWeatherCondition.rain ||
    LuxWeatherCondition.drizzle ||
    LuxWeatherCondition.thunder =>
      const Color(0xFF141820),
    _ => const Color(0xFF171520),
  };
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      top,
      Color.lerp(top, LuxColors.gold, 0.08)!,
    ],
  );
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.icon,
    required this.label,
    required this.value,
    this.hideValue = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool hideValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: LuxColors.gold),
          const SizedBox(width: 6),
          Text(
            hideValue ? label : '$label · $value',
            style: const TextStyle(fontSize: 11, color: LuxColors.stone400),
          ),
        ],
      ),
    );
  }
}

class _AdviceCard extends StatelessWidget {
  const _AdviceCard({required this.lines});

  final List<String> lines;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return GlassCard(
      glow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_awesome_rounded, color: LuxColors.gold, size: 18),
              const SizedBox(width: 8),
              Text(
                l.weatherConciergeAdviceTitle,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: LuxColors.cream,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (final line in lines) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '•',
                  style: TextStyle(
                    color: LuxColors.gold.withValues(alpha: 0.8),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    line,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.45,
                      color: LuxColors.stone400,
                    ),
                  ),
                ),
              ],
            ),
            if (line != lines.last) const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.1,
        color: LuxColors.gold.withValues(alpha: 0.85),
      ),
    );
  }
}

class _PackingRow extends StatelessWidget {
  const _PackingRow({required this.items});

  final List<WeatherPackItem> items;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final item in items) ...[
            _PackChip(
              icon: _packIcon(item),
              label: WeatherConciergeAdvisor.packLabel(l, item),
            ),
            const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
}

IconData _packIcon(WeatherPackItem item) => switch (item) {
      WeatherPackItem.sunscreen => Icons.spa_outlined,
      WeatherPackItem.sunglasses => Icons.dark_mode_outlined,
      WeatherPackItem.umbrella => Icons.umbrella_rounded,
      WeatherPackItem.lightJacket => Icons.dry_cleaning_outlined,
      WeatherPackItem.comfortableShoes => Icons.directions_walk_rounded,
      WeatherPackItem.waterBottle => Icons.water_drop_outlined,
      WeatherPackItem.hat => Icons.emoji_people_outlined,
      WeatherPackItem.poncho => Icons.umbrella_outlined,
      WeatherPackItem.swimwear => Icons.pool_outlined,
    };

class _PackChip extends StatelessWidget {
  const _PackChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: LuxColors.gold.withValues(alpha: 0.08),
        border: Border.all(color: LuxColors.gold.withValues(alpha: 0.22)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: LuxColors.gold),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: LuxColors.cream,
            ),
          ),
        ],
      ),
    );
  }
}

class _PlanImpactCard extends StatelessWidget {
  const _PlanImpactCard({
    required this.insight,
    required this.locale,
  });

  final WeatherConciergeInsight insight;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final fmt = DateFormat.jm(locale.toLanguageTag());

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            insight.planImpact,
            style: const TextStyle(
              fontSize: 13,
              height: 1.45,
              color: LuxColors.cream,
            ),
          ),
          if (insight.outdoorStopsAtRisk.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              l.weatherOutdoorAtRisk(insight.outdoorStopsAtRisk.length),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: LuxColors.gold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              insight.outdoorStopsAtRisk.join(' · '),
              style: const TextStyle(fontSize: 12, color: LuxColors.stone400),
            ),
          ],
          if (insight.indoorBackups.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              l.weatherIndoorBackup,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: LuxColors.gold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              insight.indoorBackups.join(' · '),
              style: const TextStyle(fontSize: 12, color: LuxColors.stone400),
            ),
          ],
          if (insight.bestOutdoorWindow != null) ...[
            const SizedBox(height: 12),
            _WindowRow(
              icon: Icons.wb_sunny_outlined,
              label: l.weatherBestOutdoorWindow,
              value:
                  '${fmt.format(insight.bestOutdoorWindow!.start)} – ${fmt.format(insight.bestOutdoorWindow!.end)}',
            ),
          ],
          if (insight.rainRiskWindow != null) ...[
            const SizedBox(height: 8),
            _WindowRow(
              icon: Icons.umbrella_rounded,
              label: l.weatherRainWindow,
              value:
                  '${fmt.format(insight.rainRiskWindow!.start)} – ${fmt.format(insight.rainRiskWindow!.end)}',
            ),
          ],
          if (insight.sunsetRecommendation != null) ...[
            const SizedBox(height: 8),
            _WindowRow(
              icon: Icons.wb_twilight_rounded,
              label: l.weatherSunsetRec,
              value: insight.sunsetRecommendation!,
            ),
          ],
        ],
      ),
    );
  }
}

class _WindowRow extends StatelessWidget {
  const _WindowRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 15, color: LuxColors.gold),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 12, color: LuxColors.stone400),
              children: [
                TextSpan(
                  text: '$label · ',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: LuxColors.cream,
                  ),
                ),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _HourlyTimeline extends StatelessWidget {
  const _HourlyTimeline({
    required this.weather,
    required this.highlights,
    required this.useFahrenheit,
    required this.locale,
  });

  final LuxWeather weather;
  final Map<int, WeatherHourlyHighlight> highlights;
  final bool useFahrenheit;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    if (weather.hourly.isEmpty) {
      return Text(
        l.weatherHourlyUnavailable,
        style: const TextStyle(fontSize: 12, color: LuxColors.stone400),
      );
    }

    final fmt = DateFormat.jm(locale.toLanguageTag());

    return SizedBox(
      height: 132,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: weather.hourly.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final h = weather.hourly[i];
          final highlight = highlights[i];
          final borderColor = switch (highlight) {
            WeatherHourlyHighlight.bestOutdoor => LuxColors.gold,
            WeatherHourlyHighlight.rainRisk => const Color(0xFF6B9BD1),
            WeatherHourlyHighlight.sunset => const Color(0xFFE8A87C),
            null => Colors.white.withValues(alpha: 0.08),
          };

          return Container(
            width: 72,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.black.withValues(alpha: 0.25),
              border: Border.all(
                color: borderColor.withValues(alpha: highlight == null ? 0.08 : 0.55),
                width: highlight == null ? 1 : 1.5,
              ),
              boxShadow: highlight != null
                  ? [
                      BoxShadow(
                        color: borderColor.withValues(alpha: 0.18),
                        blurRadius: 12,
                      ),
                    ]
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  fmt.format(h.time),
                  style: const TextStyle(fontSize: 10, color: LuxColors.stone400),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Icon(
                  weatherConditionIcon(h.condition, h.time.hour >= 6 && h.time.hour < 20),
                  size: 20,
                  color: LuxColors.gold,
                ),
                Text(
                  useFahrenheit
                      ? '${h.temperatureF.round()}°'
                      : '${h.temperatureC.round()}°',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: LuxColors.cream,
                  ),
                ),
                Text(
                  '${h.rainChance ?? 0}%',
                  style: const TextStyle(fontSize: 10, color: LuxColors.stone400),
                ),
                if ((h.windSpeedMph ?? 0) >= 15)
                  Icon(Icons.air_rounded, size: 12, color: LuxColors.stone400),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _RadarPlaceholder extends StatelessWidget {
  const _RadarPlaceholder();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            const Color(0xFF1A2332),
            LuxColors.gold.withValues(alpha: 0.06),
          ],
        ),
        border: Border.all(color: LuxColors.gold.withValues(alpha: 0.18)),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.radar_rounded,
              size: 36,
              color: LuxColors.gold.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 10),
            Text(
              l.weatherRadarComingSoon,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: LuxColors.stone400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OverlayToggles extends StatelessWidget {
  const _OverlayToggles();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final items = [
      (l.weatherOverlayPrecip, Icons.water_drop_outlined),
      (l.weatherOverlayTemp, Icons.thermostat_outlined),
      (l.weatherOverlayWind, Icons.air_rounded),
      (l.weatherOverlayCloud, Icons.cloud_queue_rounded),
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final (label, icon) in items)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withValues(alpha: 0.04),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 16, color: LuxColors.stone400),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(fontSize: 12, color: LuxColors.stone400),
                ),
                const SizedBox(width: 8),
                Text(
                  l.weatherComingSoon,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: LuxColors.gold.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

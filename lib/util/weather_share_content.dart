import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/weather_concierge_advisor.dart';
import 'package:luxora_ai/services/weather_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/luxora_branded_share_card.dart';
import 'package:luxora_ai/widgets/luxora_share_section.dart';
import 'package:luxora_ai/widgets/weather_radar_preview.dart';
import 'package:luxora_ai/widgets/weather_ui.dart';

Widget buildWeatherConciergeShareCard(
  BuildContext context, {
  required LuxWeather weather,
  required String placeLabel,
  required double latitude,
  required double longitude,
  required WeatherConciergeInsight insight,
  required bool useFahrenheit,
  required Locale locale,
}) {
  final l = context.l10n;
  final fmt = DateFormat.jm(locale.toLanguageTag());
  final temp = _formatTemp(weather.temperatureF, useFahrenheit);
  final condition = weatherConditionLabel(l, weather.condition);
  var subtitle = '$temp · $condition';
  if (weather.feelsLikeF != null) {
    subtitle =
        '$subtitle · ${l.weatherFeelsLike(_formatTemp(weather.feelsLikeF!, useFahrenheit))}';
  }

  final sections = <LuxoraShareSection>[
    LuxoraShareSection(
      heading: l.weatherConciergeAdviceTitle,
      lines: insight.adviceLines,
    ),
  ];

  if (insight.packing.isNotEmpty) {
    sections.add(
      LuxoraShareSection(
        heading: l.weatherWhatToBring,
        lines: insight.packing
            .take(6)
            .map((item) => WeatherConciergeAdvisor.packLabel(l, item))
            .toList(),
      ),
    );
  }

  final planLines = <String>[insight.planImpact];
  if (insight.outdoorStopsAtRisk.isNotEmpty) {
    planLines.add(
      '${l.weatherOutdoorAtRisk(insight.outdoorStopsAtRisk.length)} · '
      '${insight.outdoorStopsAtRisk.join(' · ')}',
    );
  }
  if (insight.indoorBackups.isNotEmpty) {
    planLines.add(
      '${l.weatherIndoorBackup} · ${insight.indoorBackups.join(' · ')}',
    );
  }
  if (insight.bestOutdoorWindow != null) {
    planLines.add(
      '${l.weatherBestOutdoorWindow} · '
      '${fmt.format(insight.bestOutdoorWindow!.start)} – '
      '${fmt.format(insight.bestOutdoorWindow!.end)}',
    );
  }
  if (insight.rainRiskWindow != null) {
    planLines.add(
      '${l.weatherRainWindow} · '
      '${fmt.format(insight.rainRiskWindow!.start)} – '
      '${fmt.format(insight.rainRiskWindow!.end)}',
    );
  }
  if (insight.sunsetRecommendation != null) {
    planLines.add('${l.weatherSunsetRec} · ${insight.sunsetRecommendation!}');
  }

  sections.add(
    LuxoraShareSection(
      heading: l.weatherPlanImpact,
      lines: planLines,
    ),
  );

  if (weather.hourly.isNotEmpty) {
    sections.add(
      LuxoraShareSection(
        heading: l.weatherHourlyTitle,
        lines: weather.hourly.take(8).map((h) {
          final rain = h.rainChance ?? 0;
          final t = useFahrenheit
              ? '${h.temperatureF.round()}°F'
              : '${h.temperatureC.round()}°C';
          return '${fmt.format(h.time)} · $t · $rain%';
        }).toList(),
      ),
    );
  }

  return LuxoraBrandedShareCard(
    title: l.weatherToday(placeLabel),
    subtitle: subtitle,
    header: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _WeatherShareHero(
          weather: weather,
          placeLabel: placeLabel,
          useFahrenheit: useFahrenheit,
          locale: locale,
        ),
        const SizedBox(height: 12),
        ShareWeatherRadarPreview(
          latitude: latitude,
          longitude: longitude,
          height: 168,
        ),
      ],
    ),
    sections: sections,
  );
}

class _WeatherShareHero extends StatelessWidget {
  const _WeatherShareHero({
    required this.weather,
    required this.placeLabel,
    required this.useFahrenheit,
    required this.locale,
  });

  final LuxWeather weather;
  final String placeLabel;
  final bool useFahrenheit;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final gradient = _weatherGradient(weather.condition, weather.isDay);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: gradient,
        border: Border.all(color: LuxColors.gold.withValues(alpha: 0.22)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.weatherToday(placeLabel),
            style: TextStyle(
              fontSize: 10,
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
                size: 40,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _formatTemp(weather.temperatureF, useFahrenheit),
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                        color: LuxColors.cream,
                        height: 1,
                      ),
                    ),
                    if (weather.feelsLikeF != null)
                      Text(
                        l.weatherFeelsLike(
                          _formatTemp(weather.feelsLikeF!, useFahrenheit),
                        ),
                        style: const TextStyle(
                          fontSize: 12,
                          color: LuxColors.stone400,
                        ),
                      ),
                    const SizedBox(height: 4),
                    Text(
                      weatherConditionLabel(l, weather.condition),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: LuxColors.cream,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              _ShareStatChip(
                label: l.weatherStatRain,
                value:
                    '${weather.currentHourRainChance ?? weather.rainChance ?? 0}%',
              ),
              if (weather.humidity != null)
                _ShareStatChip(
                  label: l.weatherHumidity,
                  value: '${weather.humidity}%',
                ),
              if (weather.windSpeedMph != null)
                _ShareStatChip(
                  label: l.weatherWind,
                  value: l.weatherWindValue(
                    WeatherConciergeAdvisor.windDirectionLabel(
                      weather.windDirectionDeg,
                    ),
                    weather.windSpeedMph!.round(),
                  ),
                ),
              if (weather.uvIndex != null)
                _ShareStatChip(
                  label: l.weatherUv,
                  value: weather.uvIndex!.toStringAsFixed(1),
                ),
              if (weather.sunset != null)
                _ShareStatChip(
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

class _ShareStatChip extends StatelessWidget {
  const _ShareStatChip({
    required this.label,
    required this.value,
    this.hideValue = false,
  });

  final String label;
  final String value;
  final bool hideValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: LuxColors.stone500.withValues(alpha: 0.5)),
      ),
      child: Text(
        hideValue ? label : '$label · $value',
        style: const TextStyle(fontSize: 10, color: LuxColors.stone400),
      ),
    );
  }
}

String _formatTemp(double fahrenheit, bool useFahrenheit) =>
    useFahrenheit
        ? '${fahrenheit.round()}°F'
        : '${((fahrenheit - 32) * 5 / 9).round()}°C';

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

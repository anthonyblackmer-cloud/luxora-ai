import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/weather_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';

/// Weather-aware planning strip: shows live conditions for the trip area
/// (home base when set, else the Orlando hub), today's sunset, and a rain
/// note so the day plan can be read against the sky. Fails silently — if the
/// keyless Open-Meteo call can't complete, the card simply doesn't render.
class WeatherCard extends StatefulWidget {
  const WeatherCard({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.placeLabel,
  });

  final double latitude;
  final double longitude;
  final String placeLabel;

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  LuxWeather? _weather;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(WeatherCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.latitude != widget.latitude ||
        oldWidget.longitude != widget.longitude) {
      _load();
    }
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final weather = await WeatherService.instance.fetch(
      widget.latitude,
      widget.longitude,
    );
    if (!mounted) return;
    setState(() {
      _weather = weather;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final weather = _weather;
    // Render nothing until we have data — keeps the screen calm and avoids a
    // flashing skeleton on every rebuild.
    if (_loading || weather == null) return const SizedBox.shrink();

    final l = context.l10n;
    final locale = Localizations.localeOf(context);
    final useFahrenheit = locale.languageCode == 'en';
    final temp = useFahrenheit
        ? '${weather.temperatureF.round()}°F'
        : '${weather.temperatureC.round()}°C';

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _conditionIcon(weather.condition, weather.isDay),
                  color: LuxColors.gold,
                  size: 30,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l.weatherToday(widget.placeLabel),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                          color: LuxColors.gold.withValues(alpha: 0.85),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '$temp · ${_conditionLabel(l, weather.condition)}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: LuxColors.cream,
                        ),
                      ),
                    ],
                  ),
                ),
                if (weather.sunset != null)
                  Row(
                    children: [
                      const Icon(
                        Icons.wb_twilight_rounded,
                        size: 15,
                        color: LuxColors.stone400,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        l.weatherSunset(
                          DateFormat.jm(locale.toLanguageTag())
                              .format(weather.sunset!),
                        ),
                        style: const TextStyle(
                          fontSize: 12,
                          color: LuxColors.stone400,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            if (weather.rainLikely) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.umbrella_rounded,
                    size: 14,
                    color: LuxColors.gold,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      l.weatherRainNote(weather.rainChance ?? 0),
                      style: const TextStyle(
                        fontSize: 12,
                        height: 1.3,
                        color: LuxColors.stone400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

IconData _conditionIcon(LuxWeatherCondition c, bool isDay) => switch (c) {
      LuxWeatherCondition.clear =>
        isDay ? Icons.wb_sunny_rounded : Icons.nightlight_rounded,
      LuxWeatherCondition.partlyCloudy => Icons.wb_cloudy_outlined,
      LuxWeatherCondition.cloudy => Icons.cloud_rounded,
      LuxWeatherCondition.fog => Icons.foggy,
      LuxWeatherCondition.drizzle => Icons.grain_rounded,
      LuxWeatherCondition.rain => Icons.water_drop_rounded,
      LuxWeatherCondition.snow => Icons.ac_unit_rounded,
      LuxWeatherCondition.thunder => Icons.thunderstorm_rounded,
    };

String _conditionLabel(AppLocalizations l, LuxWeatherCondition c) =>
    switch (c) {
      LuxWeatherCondition.clear => l.weatherConditionClear,
      LuxWeatherCondition.partlyCloudy => l.weatherConditionPartlyCloudy,
      LuxWeatherCondition.cloudy => l.weatherConditionCloudy,
      LuxWeatherCondition.fog => l.weatherConditionFog,
      LuxWeatherCondition.drizzle => l.weatherConditionDrizzle,
      LuxWeatherCondition.rain => l.weatherConditionRain,
      LuxWeatherCondition.snow => l.weatherConditionSnow,
      LuxWeatherCondition.thunder => l.weatherConditionThunder,
    };

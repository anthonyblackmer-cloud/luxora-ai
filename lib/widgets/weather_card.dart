import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/weather_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/weather_ui.dart';

/// Weather-aware planning strip: shows live conditions for the trip area
/// (home base when set, else the Orlando hub), today's sunset, and a rain
/// note so the day plan can be read against the sky. Tap to open the full
/// Weather Concierge sheet.
class WeatherCard extends StatefulWidget {
  const WeatherCard({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.placeLabel,
    this.weather,
    this.onTap,
  });

  final double latitude;
  final double longitude;
  final String placeLabel;
  final LuxWeather? weather;
  final VoidCallback? onTap;

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  LuxWeather? _weather;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    if (widget.weather != null) {
      _weather = widget.weather;
      _loading = false;
    } else {
      _load();
    }
  }

  @override
  void didUpdateWidget(WeatherCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.weather != null) {
      if (widget.weather != oldWidget.weather) {
        setState(() {
          _weather = widget.weather;
          _loading = false;
        });
      }
      return;
    }
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
    final weather = widget.weather ?? _weather;
    if (_loading || weather == null) return const SizedBox.shrink();

    final l = context.l10n;
    final locale = Localizations.localeOf(context);
    final useFahrenheit = locale.languageCode == 'en';
    final temp = useFahrenheit
        ? '${weather.temperatureF.round()}°F'
        : '${weather.temperatureC.round()}°C';

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(16),
          child: GlassCard(
            glow: widget.onTap != null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      weatherConditionIcon(weather.condition, weather.isDay),
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
                            '$temp · ${weatherConditionLabel(l, weather.condition)}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: LuxColors.cream,
                            ),
                          ),
                          if (widget.onTap != null) ...[
                            const SizedBox(height: 4),
                            Text(
                              l.weatherConciergeTapHint,
                              style: TextStyle(
                                fontSize: 11,
                                color: LuxColors.gold.withValues(alpha: 0.65),
                              ),
                            ),
                          ],
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
                    if (widget.onTap != null) ...[
                      const SizedBox(width: 8),
                      Icon(
                        Icons.expand_more_rounded,
                        size: 20,
                        color: LuxColors.gold.withValues(alpha: 0.7),
                      ),
                    ],
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
        ),
      ),
    );
  }
}

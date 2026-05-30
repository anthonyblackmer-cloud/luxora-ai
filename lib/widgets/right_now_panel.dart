import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/crowd_prediction_service.dart';
import 'package:luxora_ai/services/right_now_service.dart';
import 'package:luxora_ai/services/weather_service.dart';
import 'package:luxora_ai/widgets/luxora_branded_share_card.dart';
import 'package:luxora_ai/widgets/visual_share_icon_button.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_button.dart';
import 'package:latlong2/latlong.dart';

/// Hero CTA — fuses time, weather, crowd, mood, and location into one moment.
class RightNowPanel extends StatefulWidget {
  const RightNowPanel({
    super.key,
    required this.pool,
    required this.origin,
    required this.weatherLat,
    required this.weatherLng,
    this.profile,
    this.onPlaceTap,
  });

  final List<LuxPlace> pool;
  final LatLng origin;
  final TripProfile? profile;
  final double weatherLat;
  final double weatherLng;
  final void Function(LuxPlace place)? onPlaceTap;

  @override
  State<RightNowPanel> createState() => _RightNowPanelState();
}

class _RightNowPanelState extends State<RightNowPanel> {
  RightNowMoment? _moment;
  LuxWeather? _weather;
  bool _loading = false;
  bool _expanded = false;

  Future<void> _generate() async {
    setState(() {
      _loading = true;
      _expanded = true;
    });
    final weather = await WeatherService.instance.fetch(
      widget.weatherLat,
      widget.weatherLng,
    );
    final moment = RightNowService.suggest(
      pool: widget.pool,
      origin: widget.origin,
      profile: widget.profile,
      weather: weather,
    );
    if (!mounted) return;
    setState(() {
      _weather = weather;
      _moment = moment;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LuxButton(
            label: l.rightNowButton,
            icon: Icons.auto_awesome_rounded,
            onPressed: _loading ? null : _generate,
          ),
          if (_loading)
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Center(
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ),
          if (_expanded && !_loading && _moment != null) ...[
            const SizedBox(height: 12),
            _MomentCard(
              moment: _moment!,
              onTap: () => widget.onPlaceTap?.call(_moment!.place),
              narrative: _narrative(context, l, _moment!, _weather),
              secretLine: _secretLine(l, _moment!),
            ),
          ],
          if (_expanded && !_loading && _moment == null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                l.rightNowEmpty,
                style: const TextStyle(color: LuxColors.stone400, fontSize: 13),
              ),
            ),
        ],
      ),
    );
  }

  String? _secretLine(AppLocalizations l, RightNowMoment moment) {
    final key = moment.localSecretL10nKey;
    if (key == null) return null;
    return _localSecretText(l, key);
  }

  String _narrative(
    BuildContext context,
    AppLocalizations l,
    RightNowMoment moment,
    LuxWeather? weather,
  ) {
    final place = catalogText(context, moment.place.title);
    final district = moment.districtLabel ?? place;
    final companion = moment.companionPlace != null
        ? catalogText(context, moment.companionPlace!.title)
        : district;
    final crowd = _crowdLabel(l, moment.crowd);
    final mins = moment.driveMinutes;

    return switch (moment.scenario) {
      RightNowScenario.scenicCoffeeWalk => l.rightNowScenicCoffee(
          mins,
          district,
          place,
          companion,
          crowd,
        ),
      RightNowScenario.perfectWeatherExplore => l.rightNowPerfectWeather(
          mins,
          district,
          place,
          crowd,
        ),
      RightNowScenario.goldenHourSoon => l.rightNowGoldenHour(
          mins,
          place,
          crowd,
        ),
      RightNowScenario.rainyIndoor => l.rightNowRainyIndoor(mins, place),
      RightNowScenario.familyCalmWindow => l.rightNowFamilyCalm(mins, place),
      RightNowScenario.romanticEvening => l.rightNowRomantic(mins, place),
      RightNowScenario.quietHiddenGem => l.rightNowQuietGem(mins, place, crowd),
    };
  }

  String _crowdLabel(AppLocalizations l, CrowdLevel level) => switch (level) {
        CrowdLevel.quiet => l.mapCrowdLevelQuiet,
        CrowdLevel.moderate => l.mapCrowdLevelModerate,
        CrowdLevel.busy => l.mapCrowdLevelBusy,
        CrowdLevel.packed => l.mapCrowdLevelPacked,
      };

  String _localSecretText(AppLocalizations l, String key) => switch (key) {
        'localSecretWinterParkParkAvenue' => l.localSecretWinterParkParkAvenue,
        'localSecretWorldFoodTrucks' => l.localSecretWorldFoodTrucks,
        'localSecretWekiwaSprings' => l.localSecretWekiwaSprings,
        'localSecretDisneySpringsParking' => l.localSecretDisneySpringsParking,
        'localSecretLakeEolaSunset' => l.localSecretLakeEolaSunset,
        _ => '',
      };
}

class _MomentCard extends StatelessWidget {
  const _MomentCard({
    required this.moment,
    required this.narrative,
    required this.onTap,
    this.secretLine,
  });

  final RightNowMoment moment;
  final String narrative;
  final String? secretLine;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final placeTitle = catalogText(context, moment.place.title);
    return GlassCard(
      glow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 12, 0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    l.rightNowResultTitle,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                      color: LuxColors.gold.withValues(alpha: 0.85),
                    ),
                  ),
                ),
                VisualShareIconButton(
                  subject: placeTitle,
                  fileName: 'luxora_right_now.png',
                  color: LuxColors.gold,
                  background: LuxColors.gold.withValues(alpha: 0.12),
                  iconSize: 18,
                  cardBuilder: (ctx) {
                    final lines = <String>[narrative];
                    if (secretLine != null && secretLine!.isNotEmpty) {
                      lines.add(secretLine!);
                    }
                    return LuxoraBrandedShareCard(
                      title: ctx.l10n.rightNowResultTitle,
                      subtitle: catalogText(ctx, moment.place.title),
                      lines: lines,
                    );
                  },
                ),
              ],
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    narrative,
              style: const TextStyle(
                fontSize: 14,
                height: 1.45,
                color: LuxColors.cream,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (secretLine != null && secretLine!.isNotEmpty) ...[
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.tips_and_updates_outlined,
                      size: 16, color: LuxColors.gold),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      secretLine!,
                      style: const TextStyle(
                        fontSize: 12,
                        height: 1.35,
                        color: LuxColors.stone400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 8),
            Text(
              l.rightNowTapForDetails,
              style: TextStyle(fontSize: 11, color: LuxColors.stone500),
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

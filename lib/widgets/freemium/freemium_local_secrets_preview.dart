import 'package:flutter/material.dart';
import 'package:luxora_ai/data/city_content_catalog.dart';
import 'package:luxora_ai/data/local_secrets_registry.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/freemium_limits.dart';
import 'package:luxora_ai/services/freemium_service.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/attraction_detail_sheet.dart';
import 'package:luxora_ai/widgets/freemium/freemium_unlock_cta.dart';
import 'package:luxora_ai/widgets/glass_card.dart';

/// Sample local secrets for free tier — full collection stays locked.
class FreemiumLocalSecretsPreview extends StatelessWidget {
  const FreemiumLocalSecretsPreview({super.key});

  int _totalSecrets() {
    final editorial = CityContentCatalog.curatedLocalSecretsForActive().length;
    final registry = PlacesRepository.instance.activePlaces
        .where((p) => LocalSecretsRegistry.l10nKeyFor(p) != null)
        .length;
    return editorial + registry;
  }

  List<({String title, String body, LuxPlace? place})> _previewSamples(
    BuildContext context,
  ) {
    final l = context.l10n;
    final samples = <({String title, String body, LuxPlace? place})>[];

    for (final gem in FreemiumService.previewSlice(
      CityContentCatalog.curatedLocalSecretsForActive(),
      FreemiumUnlockTrigger.localSecretsPreview,
    )) {
      samples.add((
        title: catalogText(context, gem.title),
        body: catalogText(context, gem.insiderTip),
        place: null,
      ));
    }

    for (final place in FreemiumService.previewLocalSecretPlaces()) {
      final key = LocalSecretsRegistry.l10nKeyFor(place);
      if (key == null) continue;
      final body = _localSecretText(l, key);
      if (body == null) continue;
      samples.add((title: place.title, body: body, place: place));
      if (samples.length >= FreemiumLimits.previewLocalSecrets) break;
    }

    return samples.take(FreemiumLimits.previewLocalSecrets).toList();
  }

  String? _localSecretText(dynamic l, String key) => switch (key) {
        'localSecretWinterParkParkAvenue' => l.localSecretWinterParkParkAvenue,
        'localSecretWorldFoodTrucks' => l.localSecretWorldFoodTrucks,
        'localSecretWekiwaSprings' => l.localSecretWekiwaSprings,
        'localSecretDisneySpringsParking' => l.localSecretDisneySpringsParking,
        'localSecretLakeEolaSunset' => l.localSecretLakeEolaSunset,
        'localSecretMiamiWynwoodAlley' => l.localSecretMiamiWynwoodAlley,
        'localSecretMiamiLittleHavanaDomino' =>
          l.localSecretMiamiLittleHavanaDomino,
        'localSecretMiamiVizcayaMangrove' => l.localSecretMiamiVizcayaMangrove,
        'localSecretMiamiOceanDriveSunrise' =>
          l.localSecretMiamiOceanDriveSunrise,
        'localSecretMiamiPantherAlley' => l.localSecretMiamiPantherAlley,
        'localSecretTampaBayRiverwalkParking' =>
          l.localSecretTampaBayRiverwalkParking,
        'localSecretTampaBayClearwaterSunset' =>
          l.localSecretTampaBayClearwaterSunset,
        'localSecretTampaBayDaliGarden' => l.localSecretTampaBayDaliGarden,
        'localSecretTampaBayPierTiming' => l.localSecretTampaBayPierTiming,
        'localSecretTampaBayYborCourtyard' => l.localSecretTampaBayYborCourtyard,
        'localSecretTampaBaySpongeDocks' => l.localSecretTampaBaySpongeDocks,
        _ => null,
      };

  @override
  Widget build(BuildContext context) {
    if (FreemiumService.hasFullAccess()) return const SizedBox.shrink();

    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    final samples = _previewSamples(context);
    final total = _totalSecrets();
    final locked = FreemiumService.lockedCount(
      total,
      FreemiumUnlockTrigger.localSecretsPreview,
    );
    if (samples.isEmpty && locked <= 0) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l.freemiumLocalSecretsTitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: tokens.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          l.freemiumLocalSecretsSubtitle,
          style: TextStyle(fontSize: 13, height: 1.4, color: tokens.textMuted),
        ),
        const SizedBox(height: 12),
        for (final sample in samples)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GlassCard(
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: sample.place == null
                    ? null
                    : () => showAttractionDetailSheet(
                          context,
                          place: sample.place!,
                        ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sample.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: tokens.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      sample.body,
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.35,
                        color: tokens.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        FreemiumUnlockCta(
          trigger: FreemiumUnlockTrigger.localSecretsPreview,
          lockedCount: locked,
        ),
      ],
    );
  }
}

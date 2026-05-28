import 'package:flutter/widgets.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/discover_radius.dart';
import 'package:luxora_ai/models/lux_place.dart';

extension LuxoraL10nContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

extension DiscoverRadiusL10n on DiscoverRadius {
  String shortLabelL10n(AppLocalizations l) => switch (this) {
        DiscoverRadius.miles25 => l.radius25,
        DiscoverRadius.miles50 => l.radius50,
        DiscoverRadius.miles100 => l.radius100,
        DiscoverRadius.allFlorida => l.radiusAllFlorida,
      };

  String descriptionL10n(AppLocalizations l) => switch (this) {
        DiscoverRadius.miles25 => l.radiusDesc25,
        DiscoverRadius.miles50 => l.radiusDesc50,
        DiscoverRadius.miles100 => l.radiusDesc100,
        DiscoverRadius.allFlorida => l.radiusDescAll,
      };
}

extension LuxPlaceCategoryL10n on LuxPlaceCategory {
  String labelL10n(AppLocalizations l) => switch (this) {
        LuxPlaceCategory.beach => l.placeCatBeach,
        LuxPlaceCategory.dining => l.placeCatDining,
        LuxPlaceCategory.nature => l.placeCatNature,
        LuxPlaceCategory.nightlife => l.placeCatNightlife,
        LuxPlaceCategory.wellness => l.placeCatWellness,
        LuxPlaceCategory.family => l.placeCatFamily,
        LuxPlaceCategory.springs => l.placeCatSprings,
        LuxPlaceCategory.romantic => l.placeCatRomantic,
        LuxPlaceCategory.adventure => l.placeCatAdventure,
      };
}

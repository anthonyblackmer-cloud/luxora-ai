import 'package:flutter/widgets.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/discover_radius.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';

extension LuxoraL10nContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

extension LuxoraHubL10n on AppLocalizations {
  String discoverFromActiveHub() {
    final hub = CityPackRegistry.instance.hubLabel;
    return hub.toLowerCase().contains('orlando') ? discoverFromOrlando : discoverFromHub(hub);
  }

  String detailDriveFromActiveHub(String time) {
    final hub = CityPackRegistry.instance.hubLabel;
    return hub.toLowerCase().contains('orlando')
        ? detailDriveFromOrlando(time)
        : detailDriveFromHub(time, hub);
  }

  String milesFromActiveHub(String distance) {
    final hub = CityPackRegistry.instance.hubLabel;
    return hub.toLowerCase().contains('orlando')
        ? milesFromOrlando(distance)
        : milesFromHub(distance, hub);
  }

  String discoverSearchScopeForRadius(String radiusLabel) {
    final hub = CityPackRegistry.instance.hubLabel;
    return hub.toLowerCase().contains('orlando')
        ? discoverSearchScopeRadius(radiusLabel)
        : discoverSearchScopeRadiusHub(radiusLabel, hub);
  }

  String scopeDestinationsForRadius(int count, String radiusLabel) {
    final hub = CityPackRegistry.instance.hubLabel;
    return hub.toLowerCase().contains('orlando')
        ? scopeDestinationsRadius(count, radiusLabel)
        : scopeDestinationsRadiusHub(count, radiusLabel, hub);
  }
}

extension DiscoverRadiusL10n on DiscoverRadius {
  String shortLabelL10n(AppLocalizations l) => switch (this) {
        DiscoverRadius.miles25 => l.radius25,
        DiscoverRadius.miles50 => l.radius50,
        DiscoverRadius.miles100 => l.radius100,
        DiscoverRadius.allFlorida => l.radiusAllFlorida,
      };

  String descriptionL10n(AppLocalizations l) {
    final cityId = CityPackRegistry.instance.active.cityId;
    if (cityId == 'miami') {
      return switch (this) {
        DiscoverRadius.miles25 => l.radiusDesc25Miami,
        DiscoverRadius.miles50 => l.radiusDesc50Miami,
        DiscoverRadius.miles100 => l.radiusDesc100Miami,
        DiscoverRadius.allFlorida => l.radiusDescAllMiami,
      };
    }
    if (cityId == 'florida-keys') {
      return switch (this) {
        DiscoverRadius.miles25 => l.radiusDesc25Keys,
        DiscoverRadius.miles50 => l.radiusDesc50Keys,
        DiscoverRadius.miles100 => l.radiusDesc100Keys,
        DiscoverRadius.allFlorida => l.radiusDescAllKeys,
      };
    }
    return switch (this) {
      DiscoverRadius.miles25 => l.radiusDesc25,
      DiscoverRadius.miles50 => l.radiusDesc50,
      DiscoverRadius.miles100 => l.radiusDesc100,
      DiscoverRadius.allFlorida => l.radiusDescAll,
    };
  }
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
        LuxPlaceCategory.hotel => l.placeCatHotel,
      };
}

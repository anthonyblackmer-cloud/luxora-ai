import 'package:flutter/material.dart';
import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/services/city_pack_sync.dart';
import 'package:luxora_ai/services/paywall_service.dart';
import 'package:luxora_ai/widgets/city_destination_picker.dart';

/// Shared city-picker behavior — cities vs Orlando theme-park add-on.
abstract final class CityPickerActions {
  static Future<void> handleSelection(
    BuildContext context, {
    required String pickedId,
    required String currentCityId,
    ValueChanged<String>? onCitySelected,
  }) async {
    if (CityDestinationPicker.isThemeParksPickerValue(pickedId)) {
      await PaywallService.showAddonPaywall(
        context,
        addonId: OrlandoAddonCatalog.themeParks,
      );
      return;
    }

    if (pickedId == currentCityId) return;

    if (PaywallService.needsUnlock(pickedId)) {
      final ok = await PaywallService.showPaywall(context, cityId: pickedId);
      if (!ok || !context.mounted) return;
    } else {
      await CityPackSync.switchCity(pickedId);
    }

    onCitySelected?.call(pickedId);

    if (context.mounted &&
        pickedId == OrlandoAddonCatalog.parentCityId) {
      await PaywallService.promptOrlandoThemeParksIfNeeded(context);
    }
  }
}

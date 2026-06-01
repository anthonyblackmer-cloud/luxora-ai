import 'package:flutter/material.dart';
import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/services/city_pack_sync.dart';
import 'package:luxora_ai/widgets/city_destination_picker.dart';

/// Shared city-picker behavior for Luxora destinations.
abstract final class CityPickerActions {
  static Future<void> handleSelection(
    BuildContext context, {
    required String pickedId,
    required String currentCityId,
    ValueChanged<String>? onCitySelected,
  }) async {
    var cityId = pickedId;
    if (CityDestinationPicker.isThemeParksPickerValue(cityId)) {
      cityId = OrlandoAddonCatalog.parentCityId;
    }

    if (cityId == currentCityId) return;

    await CityPackSync.switchCity(cityId);
    onCitySelected?.call(cityId);
  }
}

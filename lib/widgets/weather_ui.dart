import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/services/weather_service.dart';

IconData weatherConditionIcon(LuxWeatherCondition c, bool isDay) => switch (c) {
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

String weatherConditionLabel(AppLocalizations l, LuxWeatherCondition c) =>
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

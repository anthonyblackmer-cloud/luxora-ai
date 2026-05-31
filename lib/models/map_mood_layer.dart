import 'package:flutter/material.dart';

/// Toggleable map overlays — filter pins by traveler mood.
enum MapMoodLayer {
  all,
  gems,
  night,
  dateNight,
  weather,
}

extension MapMoodLayerX on MapMoodLayer {
  IconData get icon => switch (this) {
        MapMoodLayer.all => Icons.layers_rounded,
        MapMoodLayer.gems => Icons.diamond_rounded,
        MapMoodLayer.night => Icons.nightlife_rounded,
        MapMoodLayer.dateNight => Icons.favorite_rounded,
        MapMoodLayer.weather => Icons.wb_sunny_rounded,
      };
}

import 'package:flutter/material.dart';

/// Scannable mood badges for feed, gems, restaurants, and map layers.
enum PlaceVibe {
  sunsetReady,
  viral,
  familyApproved,
  hiddenGem,
  rainSafe,
  dateNight,
  nightVibe,
  foodie,
  luxury,
  trending,
  live,
  seasonal,
  localPick,
  adventure,
  wellness,
  beachDay,
  luxoraPick,
}

extension PlaceVibeX on PlaceVibe {
  IconData get icon => switch (this) {
        PlaceVibe.sunsetReady => Icons.wb_twilight_rounded,
        PlaceVibe.viral => Icons.local_fire_department_rounded,
        PlaceVibe.familyApproved => Icons.family_restroom_rounded,
        PlaceVibe.hiddenGem => Icons.diamond_rounded,
        PlaceVibe.rainSafe => Icons.umbrella_rounded,
        PlaceVibe.dateNight => Icons.favorite_rounded,
        PlaceVibe.nightVibe => Icons.nightlife_rounded,
        PlaceVibe.foodie => Icons.restaurant_rounded,
        PlaceVibe.luxury => Icons.diamond_outlined,
        PlaceVibe.trending => Icons.trending_up_rounded,
        PlaceVibe.live => Icons.sensors_rounded,
        PlaceVibe.seasonal => Icons.eco_rounded,
        PlaceVibe.localPick => Icons.place_rounded,
        PlaceVibe.adventure => Icons.explore_rounded,
        PlaceVibe.wellness => Icons.spa_rounded,
        PlaceVibe.beachDay => Icons.beach_access_rounded,
        PlaceVibe.luxoraPick => Icons.auto_awesome_rounded,
      };

  Color accentColor(BuildContext context) {
    return switch (this) {
      PlaceVibe.sunsetReady => const Color(0xFFF97316),
      PlaceVibe.viral => const Color(0xFFFB7185),
      PlaceVibe.familyApproved => const Color(0xFF38BDF8),
      PlaceVibe.hiddenGem => const Color(0xFFC4B5A0),
      PlaceVibe.rainSafe => const Color(0xFF60A5FA),
      PlaceVibe.dateNight => const Color(0xFFF472B6),
      PlaceVibe.nightVibe => const Color(0xFFA78BFA),
      PlaceVibe.foodie => const Color(0xFFFBBF24),
      PlaceVibe.luxury => const Color(0xFFFBBF24),
      PlaceVibe.trending => const Color(0xFF38BDF8),
      PlaceVibe.live => const Color(0xFF34D399),
      PlaceVibe.seasonal => const Color(0xFF86EFAC),
      PlaceVibe.localPick => const Color(0xFFA8A29E),
      PlaceVibe.adventure => const Color(0xFF22D3EE),
      PlaceVibe.wellness => const Color(0xFF6EE7B7),
      PlaceVibe.beachDay => const Color(0xFF22D3EE),
      PlaceVibe.luxoraPick => const Color(0xFFFBBF24),
    };
  }
}

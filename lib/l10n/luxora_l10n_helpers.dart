import 'package:flutter/material.dart';
import 'package:luxora_ai/data/concierge_prompts.dart';
import 'package:luxora_ai/data/florida_experiences.dart';
import 'package:luxora_ai/data/map_ai_capabilities.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/trip_profile.dart';

/// Localized concierge quick-prompt chips (AI prompts stay English).
List<ConciergePromptChip> conciergePromptChipsL10n(AppLocalizations l) {
  final base = conciergePromptChips;
  return [
    ConciergePromptChip(l.conciergePromptRomantic, base[0].prompt),
    ConciergePromptChip(l.conciergePromptWellness, base[1].prompt),
    ConciergePromptChip(l.conciergePromptFamily, base[2].prompt),
    ConciergePromptChip(l.conciergePromptHiddenLuxury, base[3].prompt),
    ConciergePromptChip(l.conciergePromptFoodie, base[4].prompt),
    ConciergePromptChip(l.conciergePromptSoftLuxury, base[5].prompt),
    ConciergePromptChip(l.conciergePromptAdventure, base[6].prompt),
    ConciergePromptChip(l.conciergePromptDisney, base[7].prompt),
  ];
}

/// English canonical strings stored in session memory.
const styleMemoryCanonicalPrefs = [
  'Less crowded',
  'Luxury but not flashy',
  'Hidden luxury',
  'Walkable when possible',
  'Slow mornings',
  'No tourist traps',
  'Nature heavy',
  'Nature + wellness only',
  'Aesthetic dining',
  'Family-easy logistics',
];

String localizeStylePref(AppLocalizations l, String canonicalEn) =>
    switch (canonicalEn) {
      'Less crowded' => l.styleLessCrowded,
      'Luxury but not flashy' => l.styleLuxurySubtle,
      'Hidden luxury' => l.styleHiddenLuxury,
      'Walkable when possible' => l.styleWalkable,
      'Slow mornings' => l.styleSlowMornings,
      'No tourist traps' => l.styleNoTraps,
      'Nature heavy' => l.styleNatureHeavy,
      'Nature + wellness only' => l.styleNatureWellness,
      'Aesthetic dining' => l.styleAestheticDining,
      'Family-easy logistics' => l.styleFamilyEasy,
      _ => canonicalEn,
    };

List<MapAiCapability> mapAiCapabilitiesL10n(AppLocalizations l) => [
      MapAiCapability(
        icon: Icons.favorite_outline_rounded,
        title: l.mapCapMoodTitle,
        description: l.mapCapMoodDesc,
        comingSoon: false,
      ),
      MapAiCapability(
        icon: Icons.route_rounded,
        title: l.mapCapDriveTitle,
        description: l.mapCapDriveDesc,
        comingSoon: false,
      ),
      MapAiCapability(
        icon: Icons.cloud_outlined,
        title: l.mapCapWeatherTitle,
        description: l.mapCapWeatherDesc,
        comingSoon: false,
      ),
      MapAiCapability(
        icon: Icons.wb_twilight_rounded,
        title: l.mapCapSunsetTitle,
        description: l.mapCapSunsetDesc,
        comingSoon: false,
      ),
      MapAiCapability(
        icon: Icons.groups_outlined,
        title: l.mapCapCrowdTitle,
        description: l.mapCapCrowdDesc,
        comingSoon: false,
      ),
      MapAiCapability(
        icon: Icons.diamond_outlined,
        title: l.mapCapGemsTitle,
        description: l.mapCapGemsDesc,
        comingSoon: false,
      ),
      MapAiCapability(
        icon: Icons.tune_rounded,
        title: l.mapCapPersonalTitle,
        description: l.mapCapPersonalDesc,
        comingSoon: false,
      ),
    ];

List<MapAiCapability> mapAiCapabilitiesFutureL10n(AppLocalizations l) => [
      MapAiCapability(
        icon: Icons.local_fire_department_outlined,
        title: l.mapFutureCrowdTitle,
        description: l.mapFutureCrowdDesc,
        comingSoon: false,
      ),
      MapAiCapability(
        icon: Icons.local_parking_outlined,
        title: l.mapFutureParkingTitle,
        description: l.mapFutureParkingDesc,
      ),
      MapAiCapability(
        icon: Icons.traffic_outlined,
        title: l.mapFutureTrafficTitle,
        description: l.mapFutureTrafficDesc,
      ),
      MapAiCapability(
        icon: Icons.alt_route_rounded,
        title: l.mapFutureRerouteTitle,
        description: l.mapFutureRerouteDesc,
        comingSoon: false,
      ),
    ];

List<String> floridaCategoriesL10n(AppLocalizations l) => [
      l.catHiddenGems,
      l.catLuxuryStay,
      l.catBeaches,
      l.catRooftop,
      l.catSpas,
      l.catNightlife,
      l.catFamily,
      l.catEco,
      l.catThemeParks,
      l.catRomantic,
      l.catFood,
      l.catSprings,
      l.catIslands,
      l.catInfluencer,
    ];

List<String> affiliateCategoriesL10n(AppLocalizations l) => [
      l.affiliateHotels,
      l.affiliateExperiences,
      l.affiliateRestaurants,
      l.affiliateThemeParks,
      l.affiliateDayPasses,
      l.affiliateCarRentals,
      l.affiliateWellness,
    ];

List<MoodOption> moodOptionsL10n(AppLocalizations l) => [
      MoodOption(TripMood.romantic, l.moodRomantic, '✨'),
      MoodOption(TripMood.relaxing, l.moodRelaxing, '🌊'),
      MoodOption(TripMood.adventurous, l.moodAdventurous, '🌴'),
      MoodOption(TripMood.luxurious, l.moodLuxurious, '🥂'),
      MoodOption(TripMood.familyBonding, l.moodFamily, '👨‍👩‍👧'),
      MoodOption(TripMood.social, l.moodSocial, '🎉'),
      MoodOption(TripMood.nature, l.moodNature, '🦋'),
      MoodOption(TripMood.wellness, l.moodWellness, '🧘'),
      MoodOption(TripMood.foodie, l.moodFoodie, '🍽️'),
    ];

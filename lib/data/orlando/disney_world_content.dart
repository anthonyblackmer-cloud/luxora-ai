import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/models/orlando/orlando_park_mood_route.dart';

/// Walt Disney World routes — part of the bundled theme-parks add-on.
abstract final class DisneyWorldContent {
  static const addonId = OrlandoAddonCatalog.themeParks;

  static const moodRoutes = <OrlandoParkMoodRoute>[
    OrlandoParkMoodRoute(
      routeId: 'disney-rope-drop-mk',
      title: 'Rope drop — Magic Kingdom',
      description:
          'Seven Dwarfs first, then Liberty Square before the midday surge.',
      moodTags: ['family', 'iconic', 'trending'],
      morningPlaceId: 'place-magic-kingdom',
      afternoonPlaceId: 'place-hollywood-studios',
      eveningPlaceId: 'place-disney-springs',
      bestStartTime: 'Park open − 45 min',
      crowdSensitive: true,
    ),
    OrlandoParkMoodRoute(
      routeId: 'disney-epcot-foodie',
      title: 'EPCOT festival evening',
      description:
          'World Showcase grazing, then fireworks from the lagoon edge.',
      moodTags: ['foodie', 'couples', 'iconic'],
      morningPlaceId: 'place-epcot',
      afternoonPlaceId: 'place-epcot',
      eveningPlaceId: 'place-disney-springs',
      bestStartTime: '2 PM · lighter park entry',
      crowdSensitive: true,
    ),
    OrlandoParkMoodRoute(
      routeId: 'disney-animal-kingdom-calm',
      title: 'Animal Kingdom calm day',
      description:
          'Safari morning, Pandora dusk, skip the midday heat in Pandora.',
      moodTags: ['family', 'nature', 'relaxing'],
      morningPlaceId: 'place-animal-kingdom',
      afternoonPlaceId: 'place-typhoon-lagoon',
      eveningPlaceId: 'place-disney-springs',
      bestStartTime: '8 AM safari window',
      crowdSensitive: true,
    ),
  ];
}

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
      afternoonPlaceId: 'place-magic-kingdom',
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
      afternoonPlaceId: 'place-animal-kingdom',
      eveningPlaceId: 'place-disney-springs',
      bestStartTime: '8 AM safari window',
      crowdSensitive: true,
    ),
    OrlandoParkMoodRoute(
      routeId: 'disney-hollywood-studios-thrills',
      title: 'Hollywood Studios thrill day',
      description:
          'Galaxy\'s Edge morning, then Sunset Boulevard coasters before the crowds peak.',
      moodTags: ['adventure', 'family', 'iconic'],
      morningPlaceId: 'place-hollywood-studios',
      afternoonPlaceId: 'place-hollywood-studios',
      eveningPlaceId: 'place-disney-springs',
      bestStartTime: 'Park open − 30 min',
      crowdSensitive: true,
    ),
    OrlandoParkMoodRoute(
      routeId: 'disney-typhoon-lagoon-reset',
      title: 'Typhoon Lagoon water day',
      description:
          'Wave pool morning, lazy river reset — pairs with a light Springs evening.',
      moodTags: ['family', 'relaxing', 'water'],
      morningPlaceId: 'place-typhoon-lagoon',
      afternoonPlaceId: 'place-typhoon-lagoon',
      eveningPlaceId: 'place-disney-springs',
      bestStartTime: '10 AM · chairs first',
      crowdSensitive: false,
    ),
  ];
}

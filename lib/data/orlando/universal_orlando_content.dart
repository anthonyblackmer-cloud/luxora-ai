import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/models/orlando/orlando_park_mood_route.dart';

/// Universal Orlando routes — part of the bundled theme-parks add-on.
abstract final class UniversalOrlandoContent {
  static const addonId = OrlandoAddonCatalog.themeParks;

  static const moodRoutes = <OrlandoParkMoodRoute>[
    OrlandoParkMoodRoute(
      routeId: 'universal-wizarding-morning',
      title: 'Wizarding World morning',
      description:
          'Hogsmeade at open, then Diagon Alley before Express lines peak.',
      moodTags: ['family', 'adventure', 'iconic'],
      morningPlaceId: 'place-islands-of-adventure',
      afternoonPlaceId: 'place-universal-studios',
      eveningPlaceId: 'place-universal-studios',
      bestStartTime: '30 min before open',
      crowdSensitive: true,
    ),
    OrlandoParkMoodRoute(
      routeId: 'universal-coaster-day',
      title: 'Coaster marathon',
      description:
          'Islands thrill anchors, Express Pass ROI on peak weekends.',
      moodTags: ['adventure', 'trending'],
      morningPlaceId: 'place-islands-of-adventure',
      afternoonPlaceId: 'place-universal-studios',
      eveningPlaceId: 'place-volcano-bay',
      bestStartTime: 'Park open',
      crowdSensitive: true,
    ),
    OrlandoParkMoodRoute(
      routeId: 'universal-water-breather',
      title: 'Volcano Bay breather',
      description:
          'Half-day water park reset between dry-park heavy days.',
      moodTags: ['family', 'relaxing', 'luxury'],
      morningPlaceId: 'place-volcano-bay',
      afternoonPlaceId: 'place-volcano-bay',
      eveningPlaceId: 'place-universal-studios',
      bestStartTime: '10 AM · TapuTapu first',
      crowdSensitive: false,
    ),
  ];
}

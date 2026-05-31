// ignore_for_file: avoid_print
import 'dart:io';

class PackSpec {
  PackSpec({
    required this.cityId,
    required this.dartFolder,
    required this.classPrefix,
    required this.displayName,
    required this.hubLabel,
    required this.hubLat,
    required this.hubLng,
    required this.iapSuffix,
    required this.tagline,
    required this.heroPhoto,
    required this.districts,
    required this.moodRoutes,
    required this.restaurantStyles,
    required this.secretKinds,
    required this.flagships,
    required this.supportedCategories,
    this.stateId = 'florida',
    this.isVegasPremium = false,
    this.isNycPremium = false,
  });

  final String cityId;
  final String dartFolder;
  final String classPrefix;
  final String displayName;
  final String hubLabel;
  final double hubLat;
  final double hubLng;
  final String iapSuffix;
  final String tagline;
  final String heroPhoto;
  final List<DistrictSeed> districts;
  final List<(String, List<String>)> moodRoutes;
  final List<(String, List<String>)> restaurantStyles;
  final List<(String, String)> secretKinds;
  final List<Flagship> flagships;
  final List<String> supportedCategories;
  final String stateId;
  final bool isVegasPremium;
  final bool isNycPremium;
}

class _PackScale {
  const _PackScale({
    required this.restaurantsPerDistrict,
    required this.attractionsPerDistrict,
    required this.experiencesPerDistrict,
    required this.showsPerDistrict,
    required this.nightlifePerDistrict,
    required this.broadwayPerDistrict,
    required this.guidesPerDistrict,
    required this.gemPlacesPerDistrict,
    required this.gemsBuildPerDistrict,
    required this.maxGemsTotal,
    required this.maxHotels,
    required this.secretsPerDistrict,
  });

  final int restaurantsPerDistrict;
  final int attractionsPerDistrict;
  final int experiencesPerDistrict;
  final int showsPerDistrict;
  final int nightlifePerDistrict;
  final int broadwayPerDistrict;
  final int guidesPerDistrict;
  final int gemPlacesPerDistrict;
  final int gemsBuildPerDistrict;
  final int maxGemsTotal;
  final int maxHotels;
  final int secretsPerDistrict;
}

_PackScale _packScale(PackSpec s) {
  if (s.isNycPremium) {
    return const _PackScale(
      restaurantsPerDistrict: 17,
      attractionsPerDistrict: 9,
      experiencesPerDistrict: 9,
      showsPerDistrict: 0,
      nightlifePerDistrict: 0,
      broadwayPerDistrict: 3,
      guidesPerDistrict: 2,
      gemPlacesPerDistrict: 6,
      gemsBuildPerDistrict: 9,
      maxGemsTotal: 165,
      maxHotels: 100,
      secretsPerDistrict: 6,
    );
  }
  if (s.isVegasPremium) {
    return const _PackScale(
      restaurantsPerDistrict: 20,
      attractionsPerDistrict: 10,
      experiencesPerDistrict: 15,
      showsPerDistrict: 10,
      nightlifePerDistrict: 8,
      broadwayPerDistrict: 0,
      guidesPerDistrict: 0,
      gemPlacesPerDistrict: 6,
      gemsBuildPerDistrict: 10,
      maxGemsTotal: 110,
      maxHotels: 80,
      secretsPerDistrict: 8,
    );
  }
  return const _PackScale(
    restaurantsPerDistrict: 9,
    attractionsPerDistrict: 4,
    experiencesPerDistrict: 6,
    showsPerDistrict: 0,
    nightlifePerDistrict: 0,
    broadwayPerDistrict: 0,
    guidesPerDistrict: 0,
    gemPlacesPerDistrict: 6,
    gemsBuildPerDistrict: 6,
    maxGemsTotal: 105,
    maxHotels: 52,
    secretsPerDistrict: 3,
  );
}

class DistrictSeed {
  DistrictSeed(this.slug, this.name, this.type, this.description, this.vibeTags, this.bestFor, this.lat, this.lng);
  final String slug;
  final String name;
  final String type;
  final String description;
  final List<String> vibeTags;
  final List<String> bestFor;
  final double lat;
  final double lng;
}

class Flagship {
  Flagship(this.id, this.slug, this.title, this.category, this.photo, this.location, this.lat, this.lng, this.description, this.moodTags);
  final String id;
  final String slug;
  final String title;
  final String category;
  final String photo;
  final String location;
  final double lat;
  final double lng;
  final String description;
  final List<String> moodTags;
}

void main(List<String> args) {
  final root = Directory.current;
  if (!File('pubspec.yaml').existsSync()) {
    stderr.writeln('Run from luxora_ai repo root');
    exit(1);
  }
  if (args.contains('--nyc')) {
    final spec = _nyc();
    _generatePack(spec, root);
    _generateTest(spec, root);
    _generateJson(spec, root);
    _patchNycWiring(root);
    print('Generated New York City pack.');
    return;
  }
  if (args.contains('--vegas')) {
    final spec = _vegas();
    _generatePack(spec, root);
    _generateTest(spec, root);
    _generateJson(spec, root);
    _patchVegasWiring(root);
    print('Generated Las Vegas city pack.');
    return;
  }
  for (final spec in _specs) {
    _generatePack(spec, root);
    _generateTest(spec, root);
    _generateJson(spec, root);
  }
  _patchWiring(root);
  print('Generated ${_specs.length} Florida city packs.');
}

final _photos = [
  'sWK9wki5zHU', 'X_LNSoZ7xeM', 'JZYQ_P94T-Q', 'AK2vwEobto4', 'eQ2ElhooTjc',
  'RE1uPSyVuls', 'xEaAoizNFV8', 'pXe2PzLwVgA', 'M4RVCkMpb1I', 'p0vZplFhKYI',
  'z78FxiNCA5w', '3i-TsBuiTPk',
];

final _specs = <PackSpec>[
  _stAugustine(),
  _naples(),
  _destin30a(),
];

PackSpec _stAugustine() {
  const hubLat = 29.8946;
  const hubLng = -81.3145;
  final districts = [
    DistrictSeed('historic-district', 'Historic District', 'other', 'America\'s oldest streets, coquina walls, and lantern-lit evenings.', ['historic', 'walkable', 'romantic'], ['couples', 'culture', 'weekend'], hubLat + 0.004, hubLng - 0.003),
    DistrictSeed('st-george-street', 'St. George Street', 'downtown', 'Pedestrian spine of shops, courtyards, and living history performers.', ['walkable', 'historic', 'foodie'], ['families', 'weekend', 'culture'], hubLat + 0.002, hubLng - 0.001),
    DistrictSeed('anastasia-island', 'Anastasia Island', 'beach', 'Dunes, state park trails, and quieter Atlantic swims across the bridge.', ['beach', 'nature', 'family'], ['families', 'beach', 'weekend'], hubLat - 0.018, hubLng + 0.012),
    DistrictSeed('vilano-beach', 'Vilano Beach', 'beach', 'Inlet views, surf culture, and sunset decks north of the Matanzas.', ['beach', 'sunset', 'local'], ['couples', 'beach', 'local'], hubLat + 0.022, hubLng + 0.008),
    DistrictSeed('downtown-waterfront', 'Downtown Waterfront', 'downtown', 'Marina walks, bay breezes, and harbor dining along the Matanzas River.', ['waterfront', 'walkable', 'sunset'], ['couples', 'foodie', 'weekend'], hubLat + 0.001, hubLng + 0.004),
    DistrictSeed('lincolnville', 'Lincolnville', 'other', 'Historic African-American heritage, galleries, and quiet residential charm.', ['culture', 'historic', 'local'], ['culture', 'local', 'weekend'], hubLat - 0.006, hubLng - 0.008),
    DistrictSeed('castillo-district', 'Castillo District', 'other', 'Fort views, cannon demos, and coquina ramparts defining the skyline.', ['historic', 'iconic', 'family'], ['families', 'culture', 'weekend'], hubLat + 0.005, hubLng + 0.002),
    DistrictSeed('lighthouse-area', 'Lighthouse Area', 'beach', 'St. Augustine Lighthouse climbs and maritime museum energy.', ['historic', 'photo', 'coastal'], ['families', 'photo', 'weekend'], hubLat - 0.012, hubLng + 0.015),
    DistrictSeed('uptown-antique', 'Uptown Antique', 'suburban', 'San Marco antiques, cafés, and slower-paced browsing north of downtown.', ['local', 'walkable', 'romantic'], ['couples', 'weekend', 'local'], hubLat + 0.012, hubLng - 0.006),
    DistrictSeed('st-augustine-beach', 'St Augustine Beach', 'beach', 'Classic Atlantic beach town pier, tacos, and family sand days.', ['beach', 'family', 'casual'], ['families', 'beach', 'weekend'], hubLat - 0.025, hubLng + 0.018),
    DistrictSeed('aviles-street', 'Aviles Street', 'arts', 'Oldest platted street in the U.S. — art studios and intimate courtyards.', ['arts', 'historic', 'hidden'], ['culture', 'couples', 'photo'], hubLat + 0.003, hubLng - 0.002),
    DistrictSeed('spanish-quarter', 'Spanish Quarter', 'other', 'Living history village and colonial craft demonstrations.', ['historic', 'family', 'culture'], ['families', 'culture', 'weekend'], hubLat + 0.004, hubLng + 0.001),
    DistrictSeed('flagler-legacy', 'Flagler Legacy', 'resort', 'Flagler-era hotels, college campus beauty, and gilded-age architecture.', ['luxury', 'historic', 'romantic'], ['couples', 'luxury', 'culture'], hubLat + 0.006, hubLng - 0.004),
    DistrictSeed('san-marco-avenue', 'San Marco Avenue', 'suburban', 'Tree-lined dining strip connecting uptown to the historic core.', ['foodie', 'walkable', 'local'], ['foodies', 'weekend', 'local'], hubLat + 0.009, hubLng - 0.005),
    DistrictSeed('matanzas-inlet', 'Matanzas Inlet', 'beach', 'Inlet fishing, sandbars, and dramatic tidal shifts at the river mouth.', ['nature', 'adventure', 'photo'], ['adventure', 'local', 'photo'], hubLat + 0.028, hubLng + 0.022),
    DistrictSeed('cathedral-quarter', 'Cathedral Quarter', 'other', 'Plaza cathedral bells, courtyards, and Spanish colonial symmetry.', ['historic', 'romantic', 'walkable'], ['couples', 'culture', 'weekend'], hubLat + 0.003, hubLng - 0.003),
    DistrictSeed('mission-district', 'Mission District', 'nature', 'Mission Nombre de Dios grounds and peaceful riverfront reflection.', ['historic', 'relaxing', 'spiritual'], ['couples', 'culture', 'wellness'], hubLat + 0.008, hubLng + 0.006),
    DistrictSeed('ponte-vedra-edge', 'Ponte Vedra Edge', 'suburban', 'Upscale coastal golf edge — resort calm a short drive south.', ['luxury', 'golf', 'beach'], ['luxury', 'couples', 'golf'], hubLat - 0.045, hubLng + 0.035),
  ];
  return PackSpec(
    cityId: 'st-augustine',
    dartFolder: 'st_augustine',
    classPrefix: 'StAugustine',
    displayName: 'St. Augustine',
    hubLabel: 'St. Augustine, FL',
    hubLat: hubLat,
    hubLng: hubLng,
    iapSuffix: 'st_augustine',
    tagline: 'Historic streets, coastal romance, ghost tours, and walkable colonial charm — Florida\'s oldest city concierge.',
    heroPhoto: 'RE1uPSyVuls',
    districts: districts,
    moodRoutes: _stAugMoodRoutes(),
    restaurantStyles: _stAugRestaurants(),
    secretKinds: _stAugSecrets(),
    flagships: _stAugFlagships(),
    supportedCategories: ['hotel', 'dining', 'beach', 'historic', 'culture', 'foodie', 'romantic', 'adventure', 'family'],
  );
}

List<(String, List<String>)> _stAugMoodRoutes() => [
  ('Romantic St Augustine', ['romantic', 'couples', 'sunset', 'walkable']),
  ('Historic Walking Tour', ['historic', 'culture', 'walkable', 'full-day']),
  ('Food & Wine Weekend', ['foodie', 'weekend', 'dining', 'local']),
  ('Hidden St Augustine', ['hidden', 'local', 'gem', 'off-path']),
  ('Coastal Escape', ['beach', 'coastal', 'relaxing', 'sunset']),
  ('Family Weekend', ['family', 'beach', 'historic', 'weekend']),
  ('Photography Route', ['photo', 'historic', 'sunset', 'scenic']),
  ('Ghost Tour Adventure', ['nightlife', 'historic', 'culture', 'evening']),
  ('Sunset Waterfront Route', ['sunset', 'waterfront', 'romantic', 'dining']),
  ('Rainy Day St Augustine', ['rainy-day', 'indoor', 'culture', 'museum']),
];

List<(String, List<String>)> _stAugRestaurants() => [
  ('Historic tavern', ['foodie', 'historic', 'local', 'casual']),
  ('Waterfront seafood', ['seafood', 'sunset', 'waterfront', 'foodie']),
  ('Spanish tapas', ['foodie', 'culture', 'romantic', 'dining']),
  ('Ghost tour pub', ['nightlife', 'historic', 'local', 'social']),
  ('Coffee roastery', ['local', 'walkable', 'morning', 'hidden']),
  ('Farm-to-table bistro', ['foodie', 'romantic', 'local', 'dining']),
  ('Oyster bar', ['seafood', 'waterfront', 'social', 'foodie']),
  ('Courtyard wine bar', ['romantic', 'hidden', 'date-night', 'dining']),
  ('Cuban café', ['foodie', 'local', 'casual', 'culture']),
  ('Fine dining colonial', ['luxury', 'romantic', 'historic', 'dining']),
];

List<(String, String)> _stAugSecrets() => [
  ('Ghost tour timing', 'Book 8 PM slot — smaller groups and cooler brick-street walks'),
  ('Parking near Castillo', 'Use Castillo lot before 10 AM — afternoon tour buses fill fast'),
  ('Hidden courtyard', 'Alley off Aviles — quiet bench away from St. George crowds'),
  ('Lighthouse sunset', 'Climb 30 min before golden hour — east glow on the marsh'),
  ('St. George side street', 'Parallel lane one block west — same shops, half the strollers'),
  ('Vilano inlet pull-off', 'North end parking — dolphins often trace the channel at dusk'),
  ('Rainy museum pivot', 'Living history indoors when afternoon storms stack on the coast'),
  ('Anastasia dune path', 'South park entrance — fewer chairs, wider beach morning window'),
  ('Flagler college photo', 'West lawn at opening — empty quad frames the tower'),
  ('Matanzas sandbar walk', 'Low tide only — check tide chart before driving the inlet'),
];

List<Flagship> _stAugFlagships() => [
  Flagship('place-castillo-san-marcos', 'castillo-san-marcos', 'Castillo de San Marcos', 'adventure', 'AK2vwEobto4', 'Castillo District', 29.8979, -81.3114, 'Coquina fort guarding the bay — cannon demos and sweeping rampart views.', ['historic', 'iconic', 'family', 'culture']),
  Flagship('place-st-george-street', 'st-george-street', 'St. George Street', 'adventure', 'RE1uPSyVuls', 'St. George Street', 29.8949, -81.3128, 'Pedestrian heart of the old city — shops, performers, and colonial facades.', ['walkable', 'historic', 'family', 'iconic']),
  Flagship('place-st-augustine-lighthouse', 'st-augustine-lighthouse', 'St. Augustine Lighthouse', 'adventure', 'xEaAoizNFV8', 'Lighthouse Area', 29.8858, -81.2885, 'Climb 219 steps for panoramic Atlantic and marsh views.', ['historic', 'photo', 'family', 'iconic']),
  Flagship('place-anastasia-state-park', 'anastasia-state-park', 'Anastasia State Park', 'beach', 'X_LNSoZ7xeM', 'Anastasia Island', 29.8635, -81.2720, 'Dune trails, wide beach, and calmer swims away from downtown buzz.', ['beach', 'nature', 'family', 'relaxing']),
  Flagship('place-flagler-college', 'flagler-college', 'Flagler College Campus', 'adventure', 'z78FxiNCA5w', 'Flagler Legacy', 29.8920, -81.3175, 'Ponce de Leon Hotel masterpiece — courtyard tours and gilded-age detail.', ['historic', 'culture', 'romantic', 'photo']),
  Flagship('place-lightner-museum', 'lightner-museum', 'Lightner Museum', 'adventure', 'eQ2ElhooTjc', 'Historic District', 29.8935, -81.3148, 'Gilded-age collections in Alcazar Hotel — rainy-day culture anchor.', ['culture', 'historic', 'rainy-day', 'romantic']),
  Flagship('place-vilano-beach-pier', 'vilano-beach-pier', 'Vilano Beach Pier', 'beach', 'JZYQ_P94T-Q', 'Vilano Beach', 29.9165, -81.3010, 'Inlet sunsets and local surf energy without downtown congestion.', ['beach', 'sunset', 'local', 'photo']),
  Flagship('place-fountain-of-youth', 'fountain-of-youth', 'Fountain of Youth Archaeological Park', 'adventure', 'pXe2PzLwVgA', 'Mission District', 29.9045, -81.3155, 'Spring claims, peacocks, and riverfront history — family-friendly lore.', ['family', 'historic', 'culture', 'full-day']),
  Flagship('place-aviles-art-walk', 'aviles-art-walk', 'Aviles Street Art Walk', 'adventure', 'M4RVCkMpb1I', 'Aviles Street', 29.8938, -81.3135, 'Gallery hop on America\'s oldest platted street — intimate courtyards.', ['arts', 'walkable', 'culture', 'hidden']),
  Flagship('place-matanzas-riverwalk', 'matanzas-riverwalk', 'Matanzas Riverwalk', 'adventure', 'sWK9wki5zHU', 'Downtown Waterfront', 29.8910, -81.3090, 'Harbor benches and sailboat views — golden hour without beach drive.', ['waterfront', 'sunset', 'walkable', 'romantic']),
];

PackSpec _naples() {
  const hubLat = 26.1420;
  const hubLng = -81.7948;
  final districts = [
    DistrictSeed('downtown-naples', 'Downtown Naples', 'downtown', 'Fifth and Third corridors — polished dining and gallery walks.', ['luxury', 'walkable', 'foodie'], ['luxury', 'foodies', 'weekend'], hubLat + 0.002, hubLng - 0.002),
    DistrictSeed('fifth-avenue-south', 'Fifth Avenue South', 'downtown', 'Designer boutiques, al fresco dining, and palm-lined evenings.', ['luxury', 'foodie', 'romantic'], ['couples', 'luxury', 'weekend'], hubLat + 0.001, hubLng - 0.003),
    DistrictSeed('third-street-south', 'Third Street South', 'downtown', 'Courtyard cafés and art galleries in Old Naples charm.', ['arts', 'foodie', 'walkable'], ['foodies', 'culture', 'couples'], hubLat - 0.001, hubLng - 0.004),
    DistrictSeed('vanderbilt-beach', 'Vanderbilt Beach', 'beach', 'Upscale Gulf access, paddleboard launches, and sunset decks.', ['beach', 'luxury', 'sunset'], ['couples', 'beach', 'luxury'], hubLat + 0.035, hubLng - 0.015),
    DistrictSeed('mercato', 'Mercato', 'nightlife', 'Open-air luxury retail, cinema, and social dining hub north of town.', ['luxury', 'social', 'nightlife'], ['friend-groups', 'luxury', 'weekend'], hubLat + 0.025, hubLng - 0.008),
    DistrictSeed('naples-pier-area', 'Naples Pier Area', 'beach', 'Iconic pier sunsets and gentle Gulf swims at the city beach.', ['beach', 'iconic', 'family'], ['families', 'beach', 'sunset'], hubLat - 0.008, hubLng - 0.006),
    DistrictSeed('old-naples', 'Old Naples', 'suburban', 'Banyan-shaded streets and quiet luxury residential calm.', ['luxury', 'relaxing', 'local'], ['couples', 'luxury', 'local'], hubLat - 0.004, hubLng - 0.005),
    DistrictSeed('park-shore', 'Park Shore', 'resort', 'High-rise resorts and private beach club energy.', ['luxury', 'beach', 'resort'], ['luxury', 'couples', 'beach'], hubLat + 0.012, hubLng - 0.010),
    DistrictSeed('pelican-bay', 'Pelican Bay', 'resort', 'Audubon preserves meet club-resort golf and tennis.', ['luxury', 'golf', 'nature'], ['luxury', 'golf', 'wellness'], hubLat + 0.018, hubLng - 0.012),
    DistrictSeed('marco-island', 'Marco Island', 'beach', 'Island resorts, shelling beaches, and boat-day launches.', ['beach', 'luxury', 'adventure'], ['families', 'luxury', 'beach'], hubLat - 0.12, hubLng + 0.05),
    DistrictSeed('bonita-springs', 'Bonita Springs', 'suburban', 'Estero Bay access and relaxed Gulf-town dining south of Naples.', ['beach', 'local', 'family'], ['families', 'local', 'weekend'], hubLat + 0.08, hubLng - 0.02),
    DistrictSeed('estero-bay', 'Estero Bay', 'nature', 'Kayak mangroves and paddle calm back-bay waters.', ['nature', 'adventure', 'water'], ['adventure', 'nature', 'couples'], hubLat + 0.06, hubLng - 0.025),
    DistrictSeed('north-naples', 'North Naples', 'suburban', 'Country-club corridors and quiet beach park escapes.', ['luxury', 'golf', 'local'], ['luxury', 'golf', 'local'], hubLat + 0.045, hubLng - 0.018),
    DistrictSeed('gulf-shore', 'Gulf Shore', 'beach', 'Million-dollar views and soft-sand morning walks.', ['beach', 'luxury', 'romantic'], ['couples', 'luxury', 'beach'], hubLat - 0.006, hubLng - 0.008),
    DistrictSeed('waterside', 'Waterside', 'downtown', 'Naples Bay marina dining and boat-watching terraces.', ['waterfront', 'foodie', 'sunset'], ['foodies', 'couples', 'weekend'], hubLat + 0.003, hubLng + 0.002),
    DistrictSeed('tin-city', 'Tin City', 'other', 'Waterfront shops, casual seafood, and charter boat hub.', ['waterfront', 'foodie', 'local'], ['families', 'local', 'foodie'], hubLat + 0.005, hubLng + 0.004),
    DistrictSeed('crayton-cove', 'Crayton Cove', 'suburban', 'Yacht-club village feel and hidden bayfront bistros.', ['luxury', 'hidden', 'waterfront'], ['couples', 'luxury', 'local'], hubLat - 0.002, hubLng + 0.003),
    DistrictSeed('royal-poinciana', 'Royal Poinciana', 'suburban', 'Plaza shopping and polished Old Naples gateway.', ['luxury', 'walkable', 'shopping'], ['luxury', 'weekend', 'couples'], hubLat - 0.001, hubLng - 0.002),
  ];
  return PackSpec(
    cityId: 'naples',
    dartFolder: 'naples',
    classPrefix: 'Naples',
    displayName: 'Naples',
    hubLabel: 'Naples, FL',
    hubLat: hubLat,
    hubLng: hubLng,
    iapSuffix: 'naples',
    tagline: 'Gulf luxury, white-sand beaches, golf corridors, and Fifth Avenue polish — Naples lifestyle concierge.',
    heroPhoto: 'X_LNSoZ7xeM',
    districts: districts,
    moodRoutes: [
      ('Luxury Naples Weekend', ['luxury', 'beach', 'dining', 'weekend']),
      ('Fifth Avenue Food & Shop', ['foodie', 'luxury', 'walkable', 'shopping']),
      ('Gulf Beach Day', ['beach', 'family', 'sunset', 'relaxing']),
      ('Romantic Naples Escape', ['romantic', 'couples', 'luxury', 'sunset']),
      ('Golf & Spa Retreat', ['golf', 'wellness', 'luxury', 'relaxing']),
      ('Marco Island Adventure', ['beach', 'adventure', 'luxury', 'full-day']),
      ('Hidden Naples Locals', ['hidden', 'local', 'gem', 'waterfront']),
      ('Sunset Pier Route', ['sunset', 'beach', 'iconic', 'photo']),
      ('Family Gulf Weekend', ['family', 'beach', 'casual', 'weekend']),
      ('Rainy Day Naples', ['rainy-day', 'culture', 'spa', 'indoor']),
    ],
    restaurantStyles: [
      ('Waterfront fine dining', ['luxury', 'seafood', 'sunset', 'dining']),
      ('Steak & wine', ['luxury', 'date-night', 'foodie', 'dining']),
      ('Fresh Gulf seafood', ['seafood', 'foodie', 'local', 'waterfront']),
      ('Italian coastal', ['foodie', 'romantic', 'luxury', 'dining']),
      ('Beach club grill', ['beach', 'casual', 'family', 'sunset']),
      ('Sushi lounge', ['luxury', 'date-night', 'foodie', 'dining']),
      ('Farm-to-table', ['foodie', 'local', 'wellness', 'dining']),
      ('Rooftop cocktails', ['luxury', 'sunset', 'romantic', 'nightlife']),
      ('Casual bayfront', ['waterfront', 'family', 'local', 'casual']),
      ('Chef\'s tasting menu', ['luxury', 'foodie', 'romantic', 'dining']),
    ],
    secretKinds: [
      ('Pier parking timing', 'Arrive 90 min before sunset — lot turns over slowly but fills by golden hour'),
      ('Vanderbilt beach access', 'North end walk-on — fewer chair rentals and wider sand'),
      ('Fifth Avenue reservation', 'Book 6 PM — walk the avenue after without heat'),
      ('Marco shelling window', 'Low tide morning on south end — best shell line'),
      ('Mercato weeknight', 'Tuesday cinema crowd — easier parking and patio tables'),
      ('Estero kayak launch', 'Sunrise paddle — wind under 8 kt before afternoon sea breeze'),
      ('Hidden bayfront table', 'Crayton Cove back patio — request waterfront when booking'),
      ('Golf twilight tee', 'Late afternoon rates — cooler and faster rounds'),
      ('Tin City charter tip', 'Book morning fishing — afternoon storms common summer'),
      ('Third Street courtyard', 'Alley seating behind galleries — quiet lunch escape'),
    ],
    flagships: [
      Flagship('place-naples-pier', 'naples-pier', 'Naples Pier', 'beach', 'X_LNSoZ7xeM', 'Naples Pier Area', 26.1315, -81.8075, 'City beach icon — sunset ritual and gentle Gulf swims.', ['beach', 'iconic', 'family', 'sunset']),
      Flagship('place-fifth-avenue-naples', 'fifth-avenue-naples', 'Fifth Avenue South', 'adventure', 'z78FxiNCA5w', 'Fifth Avenue South', 26.1425, -81.7985, 'Palm-lined luxury dining and boutique stroll.', ['luxury', 'walkable', 'foodie', 'romantic']),
      Flagship('place-third-street-naples', 'third-street-naples', 'Third Street South', 'adventure', 'RE1uPSyVuls', 'Third Street South', 26.1405, -81.7995, 'Courtyard galleries and polished al fresco dining.', ['arts', 'foodie', 'walkable', 'luxury']),
      Flagship('place-vanderbilt-beach-park', 'vanderbilt-beach-park', 'Vanderbilt Beach', 'beach', 'JZYQ_P94T-Q', 'Vanderbilt Beach', 26.2520, -81.8120, 'Upscale Gulf access and paddleboard launches.', ['beach', 'luxury', 'sunset', 'family']),
      Flagship('place-mercato-naples', 'mercato-naples', 'Mercato', 'dining', 'p0vZplFhKYI', 'Mercato', 26.2525, -81.8010, 'Open-air luxury social hub — dining, cinema, and shops.', ['luxury', 'social', 'nightlife', 'family']),
      Flagship('place-tin-city-naples', 'tin-city-naples', 'Tin City Waterfront', 'dining', 'sWK9wki5zHU', 'Tin City', 26.1455, -81.7895, 'Casual seafood shacks and charter boats on the bay.', ['waterfront', 'foodie', 'local', 'family']),
      Flagship('place-del-nordest', 'del-nordest-naples', 'Old Naples Bayfront', 'adventure', 'xEaAoizNFV8', 'Waterside', 26.1430, -81.7910, 'Marina views and sunset terraces along Naples Bay.', ['waterfront', 'sunset', 'luxury', 'romantic']),
      Flagship('place-corkscrew-sanctuary', 'corkscrew-sanctuary', 'Corkscrew Swamp Sanctuary', 'nature', 'AK2vwEobto4', 'Estero Bay', 26.3750, -81.5160, 'Boardwalk through ancient cypress — wildlife and quiet canopy.', ['nature', 'adventure', 'photo', 'family']),
      Flagship('place-marco-island-beach', 'marco-island-beach', 'Marco Island South Beach', 'beach', 'eQ2ElhooTjc', 'Marco Island', 25.9200, -81.7290, 'Wide sand and resort calm — shelling and boat days.', ['beach', 'luxury', 'family', 'relaxing']),
      Flagship('place-naples-botanical', 'naples-botanical', 'Naples Botanical Garden', 'nature', 'pXe2PzLwVgA', 'East Naples', 26.1050, -81.7710, 'Tropical collections and butterfly house — rainy-day nature pivot.', ['nature', 'family', 'rainy-day', 'photo']),
    ],
    supportedCategories: ['hotel', 'dining', 'beach', 'luxury', 'golf', 'wellness', 'foodie', 'romantic', 'family'],
  );
}

PackSpec _destin30a() {
  const hubLat = 30.3935;
  const hubLng = -86.4958;
  final districts = [
    DistrictSeed('destin-harbor', 'Destin Harbor', 'downtown', 'Fishing fleet, harborwalk dining, and emerald water views.', ['waterfront', 'foodie', 'family'], ['families', 'foodie', 'weekend'], hubLat + 0.002, hubLng - 0.003),
    DistrictSeed('henderson-beach', 'Henderson Beach', 'beach', 'State park dunes and wide emerald Gulf sand.', ['beach', 'nature', 'family'], ['families', 'beach', 'photo'], hubLat - 0.015, hubLng - 0.008),
    DistrictSeed('miramar-beach', 'Miramar Beach', 'beach', 'Resort strip and public beach access along 98.', ['beach', 'family', 'resort'], ['families', 'beach', 'weekend'], hubLat - 0.025, hubLng - 0.012),
    DistrictSeed('sandestin', 'Sandestin', 'resort', 'Golf, bay, and beach resort village with tram loops.', ['luxury', 'golf', 'beach'], ['luxury', 'families', 'golf'], hubLat - 0.035, hubLng - 0.018),
    DistrictSeed('rosemary-beach', 'Rosemary Beach', 'suburban', 'New Urbanism town center and cobblestone dining.', ['walkable', 'luxury', 'foodie'], ['couples', 'luxury', 'weekend'], hubLat - 0.055, hubLng - 0.025),
    DistrictSeed('seaside', 'Seaside', 'suburban', 'Pastel cottages, central square, and Truman Show fame.', ['walkable', 'family', 'iconic'], ['families', 'photo', 'weekend'], hubLat - 0.058, hubLng - 0.028),
    DistrictSeed('grayton-beach', 'Grayton Beach', 'beach', 'Old Florida beach town vibe and state park trails.', ['beach', 'local', 'relaxing'], ['couples', 'local', 'beach'], hubLat - 0.065, hubLng - 0.032),
    DistrictSeed('watercolor', 'WaterColor', 'resort', 'Coastal lake trails and family-friendly resort calm.', ['family', 'nature', 'beach'], ['families', 'beach', 'relaxing'], hubLat - 0.056, hubLng - 0.030),
    DistrictSeed('alys-beach', 'Alys Beach', 'resort', 'White Bermudian architecture and polished quiet luxury.', ['luxury', 'photo', 'romantic'], ['luxury', 'couples', 'photo'], hubLat - 0.052, hubLng - 0.026),
    DistrictSeed('santa-rosa-beach', 'Santa Rosa Beach', 'beach', '30A communities hub and dune lake access points.', ['beach', 'family', 'local'], ['families', 'beach', 'weekend'], hubLat - 0.048, hubLng - 0.024),
    DistrictSeed('30a-east', '30A East', 'suburban', 'Eastern 30A bike path and quieter rental corridors.', ['local', 'adventure', 'bike'], ['friend-groups', 'local', 'weekend'], hubLat - 0.040, hubLng - 0.015),
    DistrictSeed('blue-mountain-beach', 'Blue Mountain Beach', 'beach', 'Highest dune on the Gulf — quiet rental enclave.', ['beach', 'hidden', 'relaxing'], ['couples', 'local', 'beach'], hubLat - 0.070, hubLng - 0.035),
    DistrictSeed('dune-allen', 'Dune Allen', 'beach', 'Western 30A gateway and dune lake paddling.', ['nature', 'beach', 'adventure'], ['adventure', 'nature', 'family'], hubLat - 0.045, hubLng - 0.020),
    DistrictSeed('destin-commons', 'Destin Commons', 'suburban', 'Shopping, dining, and rainy-day indoor backup.', ['family', 'shopping', 'rainy-day'], ['families', 'weekend', 'local'], hubLat + 0.008, hubLng - 0.005),
    DistrictSeed('crab-island', 'Crab Island', 'other', 'Sandbar party boats and pontoon day culture.', ['water', 'social', 'adventure'], ['friend-groups', 'adventure', 'summer'], hubLat + 0.005, hubLng - 0.012),
    DistrictSeed('okaloosa-island', 'Okaloosa Island', 'beach', 'Boardwalk, pier, and calmer family beach parks.', ['beach', 'family', 'iconic'], ['families', 'beach', 'weekend'], hubLat + 0.012, hubLng + 0.015),
    DistrictSeed('fort-walton-edge', 'Fort Walton Edge', 'suburban', 'History museums and bay-side calm west of Destin.', ['culture', 'family', 'local'], ['families', 'culture', 'local'], hubLat + 0.025, hubLng + 0.020),
    DistrictSeed('inlet-beach', 'Inlet Beach', 'beach', 'Eastern 30A quiet sands near Panama City edge.', ['beach', 'hidden', 'relaxing'], ['couples', 'local', 'beach'], hubLat - 0.075, hubLng - 0.038),
  ];
  return PackSpec(
    cityId: 'destin-30a',
    dartFolder: 'destin_30a',
    classPrefix: 'Destin30a',
    displayName: 'Destin & 30A',
    hubLabel: 'Destin & 30A, FL',
    hubLat: hubLat,
    hubLng: hubLng,
    iapSuffix: 'destin_30a',
    tagline: 'Emerald Gulf water, Crab Island boats, and 30A bike days — beach-family concierge for Destin and Scenic Highway 30A.',
    heroPhoto: 'JZYQ_P94T-Q',
    districts: districts,
    moodRoutes: [
      ('Family Beach Weekend', ['family', 'beach', 'full-day', 'weekend']),
      ('Emerald Coast Explorer', ['beach', 'water', 'adventure', 'photo']),
      ('30A Bike & Beach Day', ['bike', 'walkable', 'beach', 'local']),
      ('Crab Island Adventure', ['water', 'social', 'adventure', 'summer']),
      ('Romantic 30A Escape', ['romantic', 'couples', 'luxury', 'sunset']),
      ('Hidden Beaches Route', ['hidden', 'local', 'beach', 'gem']),
      ('Harbor & Seafood Day', ['foodie', 'waterfront', 'local', 'family']),
      ('Sunset Chaser 30A', ['sunset', 'beach', 'photo', 'romantic']),
      ('Luxury Rosemary & Alys', ['luxury', 'walkable', 'foodie', 'couples']),
      ('Rainy Day Destin', ['rainy-day', 'shopping', 'indoor', 'family']),
    ],
    restaurantStyles: [
      ('Harbor seafood shack', ['seafood', 'waterfront', 'casual', 'family']),
      ('Beach bar & grill', ['beach', 'casual', 'sunset', 'social']),
      ('Gulf fine dining', ['seafood', 'luxury', 'sunset', 'dining']),
      ('Taco & margarita spot', ['casual', 'family', 'beach', 'social']),
      ('Breakfast burrito window', ['local', 'morning', 'casual', 'family']),
      ('Sushi on 30A', ['foodie', 'date-night', 'beach', 'dining']),
      ('Pizza on the square', ['family', 'walkable', 'casual', 'weekend']),
      ('Oyster raw bar', ['seafood', 'foodie', 'local', 'waterfront']),
      ('Coffee & acai', ['local', 'morning', 'beach', 'wellness']),
      ('Chef-driven coastal', ['foodie', 'luxury', 'local', 'dining']),
    ],
    secretKinds: [
      ('Crab Island timing', 'Arrive before 11 AM — calmer anchoring and easier parking at marina'),
      ('Henderson park entrance', 'East lot — shorter dune walk to wide sand'),
      ('30A bike path segment', 'Eastern leg dawn — empty path and cooler pavement'),
      ('Harborwalk lunch window', '11:30 AM — tables before charter crowds return'),
      ('Grayton old oak shade', 'North county access — picnic under trees midday'),
      ('Seaside square parking', 'Perry Ave lot — walk the square without A1A stress'),
      ('Emerald water photo', 'Midday sun angle — sand color pops for photos'),
      ('Pontoon rental tip', 'Book weekday — half the traffic at Crab Island'),
      ('Rainy Destin Commons', 'Indoor play + dinner combo when Gulf storms stack'),
      ('Inlet Beach morning', 'First light — empty sand before rental turnover'),
    ],
    flagships: [
      Flagship('place-destin-harborwalk', 'destin-harborwalk', 'Destin Harborwalk', 'adventure', 'sWK9wki5zHU', 'Destin Harbor', 30.3930, -86.5020, 'Fishing boats, harbor dining, and emerald water panoramas.', ['waterfront', 'foodie', 'family', 'iconic']),
      Flagship('place-henderson-beach-state-park', 'henderson-beach-state-park', 'Henderson Beach State Park', 'beach', 'X_LNSoZ7xeM', 'Henderson Beach', 30.3780, -86.5040, 'Protected dunes and flagship emerald Gulf swimming.', ['beach', 'nature', 'family', 'iconic']),
      Flagship('place-crab-island', 'crab-island-destin', 'Crab Island', 'adventure', 'JZYQ_P94T-Q', 'Crab Island', 30.3880, -86.5120, 'Sandbar boat culture — pontoon days and floating social scene.', ['water', 'adventure', 'social', 'summer']),
      Flagship('place-seaside-florida', 'seaside-florida', 'Seaside Town Center', 'adventure', 'RE1uPSyVuls', 'Seaside', 30.3210, -86.1410, 'Pastel cottages and central square — iconic 30A stroll.', ['walkable', 'family', 'iconic', 'photo']),
      Flagship('place-rosemary-beach', 'rosemary-beach', 'Rosemary Beach', 'adventure', 'z78FxiNCA5w', 'Rosemary Beach', 30.2780, -86.0130, 'Cobblestone lanes and town-center dining.', ['luxury', 'walkable', 'foodie', 'romantic']),
      Flagship('place-grayton-beach-state-park', 'grayton-beach-state-park', 'Grayton Beach State Park', 'beach', 'AK2vwEobto4', 'Grayton Beach', 30.3320, -86.1550, 'Old Florida dunes and coastal lake trails.', ['beach', 'nature', 'local', 'relaxing']),
      Flagship('place-alys-beach', 'alys-beach', 'Alys Beach', 'adventure', 'xEaAoizNFV8', 'Alys Beach', 30.2860, -86.0300, 'White architecture and quiet luxury on the eastern 30A.', ['luxury', 'photo', 'romantic', 'walkable']),
      Flagship('place-okaloosa-island-pier', 'okaloosa-island-pier', 'Okaloosa Island Pier', 'beach', 'eQ2ElhooTjc', 'Okaloosa Island', 30.4050, -86.4720, 'Family pier fishing and gentle Gulf swims.', ['beach', 'family', 'iconic', 'fishing']),
      Flagship('place-sandestin-resort', 'sandestin-resort', 'Sandestin Golf and Beach Resort', 'adventure', 'pXe2PzLwVgA', 'Sandestin', 30.3680, -86.3280, 'Bay-to-beach resort village with golf and tram loops.', ['luxury', 'golf', 'family', 'beach']),
      Flagship('place-30a-bike-trail', '30a-bike-trail', 'Timpoochee Trail', 'adventure', 'M4RVCkMpb1I', '30A East', 30.3100, -86.1200, 'Scenic 30A bike path linking beaches and dune lakes.', ['bike', 'adventure', 'family', 'local']),
    ],
    supportedCategories: ['hotel', 'dining', 'beach', 'water', 'family', 'luxury', 'adventure', 'foodie', 'local'],
  );
}

void _generatePack(PackSpec spec, Directory root) {
  final dataDir = Directory('lib/data/${spec.dartFolder}');
  dataDir.createSync(recursive: true);
  Directory('lib/models/${spec.dartFolder}').createSync(recursive: true);
  Directory('lib/widgets/${spec.dartFolder}').createSync(recursive: true);
  Directory('assets/city_packs').createSync(recursive: true);

  File('lib/data/${spec.dartFolder}/${spec.dartFolder}_hub.dart').writeAsStringSync(_hubDart(spec));
  File('lib/data/${spec.dartFolder}/${spec.dartFolder}_content.dart').writeAsStringSync(_contentDart(spec));
  File('lib/data/${spec.dartFolder}/${spec.dartFolder}_curated_places.dart').writeAsStringSync(_curatedDart(spec));
  File('lib/data/${spec.dartFolder}/${spec.dartFolder}_hotels_catalog.dart').writeAsStringSync(_hotelsDart(spec));
  File('lib/data/${spec.dartFolder}/${spec.dartFolder}_feed_items.dart').writeAsStringSync(_feedDart(spec));
  File('lib/data/${spec.dartFolder}/${spec.dartFolder}_gem_discoveries.dart').writeAsStringSync(_gemDart(spec));
  File('lib/data/${spec.dartFolder}/${spec.dartFolder}_local_secrets.dart').writeAsStringSync(_localSecretsDart(spec));
  File('lib/data/${spec.dartFolder}/${spec.dartFolder}_ticket_deals.dart').writeAsStringSync(_ticketDart(spec));
  File('lib/models/${spec.dartFolder}/${spec.dartFolder}_mood_route.dart').writeAsStringSync(_moodRouteModel(spec));
  File('lib/services/${spec.dartFolder}_concierge_service.dart').writeAsStringSync(_conciergeService(spec));
  File('lib/widgets/${spec.dartFolder}/${spec.dartFolder}_concierge_cards.dart').writeAsStringSync(_conciergeCards(spec));

  _templateFromTampa(root, spec);
}

void _templateFromTampa(Directory root, PackSpec spec) {
  // no-op placeholder — all files generated explicitly
}

String _hubDart(PackSpec s) => '''
/// ${s.displayName} metro hub — concierge center point.
abstract final class ${s.classPrefix}Hub {
  static const latitude = ${s.hubLat};
  static const longitude = ${s.hubLng};
  static const label = '${s.hubLabel}';
}
''';

String _moodRouteModel(PackSpec s) => '''
/// Prebuilt ${s.displayName} mood route — maps to [LuxPlace] ids in the active pack.
class ${s.classPrefix}MoodRoute {
  const ${s.classPrefix}MoodRoute({
    required this.routeId,
    required this.title,
    required this.description,
    required this.moodTags,
    required this.morningPlaceId,
    required this.lunchPlaceId,
    required this.afternoonPlaceId,
    required this.dinnerPlaceId,
    required this.eveningPlaceId,
    required this.bestStartTime,
    required this.weatherSensitive,
    required this.crowdSensitive,
    required this.estimatedDriveMinutes,
  });

  final String routeId;
  final String title;
  final String description;
  final List<String> moodTags;
  final String morningPlaceId;
  final String lunchPlaceId;
  final String afternoonPlaceId;
  final String dinnerPlaceId;
  final String eveningPlaceId;
  final String bestStartTime;
  final bool weatherSensitive;
  final bool crowdSensitive;
  final int estimatedDriveMinutes;

  List<String> get orderedPlaceIds => [
        morningPlaceId,
        lunchPlaceId,
        afternoonPlaceId,
        dinnerPlaceId,
        eveningPlaceId,
      ];
}
''';

String _conciergeService(PackSpec s) => '''
import 'package:luxora_ai/data/${s.dartFolder}/${s.dartFolder}_content.dart';
import 'package:luxora_ai/models/miami/beach_intelligence.dart';
import 'package:luxora_ai/models/${s.dartFolder}/${s.dartFolder}_mood_route.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';

/// ${s.displayName} beach & water intelligence — active when pack is selected.
abstract final class ${s.classPrefix}BeachIntelligenceService {
  static BeachIntelligence? forPlace(String placeId) {
    if (!_isActive) return null;
    for (final b in ${s.classPrefix}Content.beachIntelligence) {
      if (b.placeId == placeId) return b;
    }
    return null;
  }

  static bool get _isActive =>
      CityPackRegistry.instance.active.cityId == ${s.classPrefix}Content.cityId;
}

abstract final class ${s.classPrefix}MoodRouteService {
  static List<${s.classPrefix}MoodRoute> routesForActive() {
    if (!_isActive) return const [];
    return ${s.classPrefix}Content.moodRoutes;
  }

  static ${s.classPrefix}MoodRoute? byId(String routeId) {
    for (final r in routesForActive()) {
      if (r.routeId == routeId) return r;
    }
    return null;
  }

  static List<${s.classPrefix}MoodRoute> matchingTags(Set<String> tags) {
    if (tags.isEmpty) return routesForActive();
    return routesForActive()
        .where((r) => r.moodTags.any(tags.contains))
        .toList();
  }

  static bool get _isActive =>
      CityPackRegistry.instance.active.cityId == ${s.classPrefix}Content.cityId;
}
''';

String _conciergeCards(PackSpec s) {
  final usesL10nTitle = s.isNycPremium || s.isVegasPremium;
  final l10nImport = usesL10nTitle
      ? "import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';\n"
      : '';
  final titleExpr = s.isNycPremium
      ? 'l.nycMoodRoutesTitle'
      : s.isVegasPremium
          ? 'l.vegasMoodRoutesTitle'
          : "'${s.displayName} mood routes'";
  final l10nInit = usesL10nTitle ? '    final l = context.l10n;\n' : '';
  return '''
import 'package:flutter/material.dart';
${l10nImport}import 'package:luxora_ai/models/${s.dartFolder}/${s.dartFolder}_mood_route.dart';
import 'package:luxora_ai/services/${s.dartFolder}_concierge_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Horizontal mood route picker — ${s.displayName} pack only.
class ${s.classPrefix}MoodRoutesPanel extends StatelessWidget {
  const ${s.classPrefix}MoodRoutesPanel({
    super.key,
    this.onRouteSelected,
  });

  final void Function(${s.classPrefix}MoodRoute route)? onRouteSelected;

  @override
  Widget build(BuildContext context) {
$l10nInit    final tokens = luxThemeTokensOf(context);
    final routes = ${s.classPrefix}MoodRouteService.routesForActive();
    if (routes.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Text(
            $titleExpr,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: tokens.textPrimary,
            ),
          ),
        ),
        SizedBox(
          height: 132,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: routes.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, i) {
              final route = routes[i];
              return GestureDetector(
                onTap: () => onRouteSelected?.call(route),
                child: Container(
                  width: 220,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        tokens.accent.withValues(alpha: 0.14),
                        tokens.bgSecondary,
                      ],
                    ),
                    border: Border.all(
                      color: tokens.accent.withValues(alpha: 0.22),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        route.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: tokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Start \${route.bestStartTime}',
                        style: TextStyle(
                          fontSize: 12,
                          color: tokens.textMuted,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        route.moodTags.take(3).join(' · '),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          color: tokens.accent.withValues(alpha: 0.85),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
''';
}

String _contentDart(PackSpec s) {
  final scale = _packScale(s);
  final rpd = scale.restaurantsPerDistrict;
  final apd = scale.attractionsPerDistrict;
  final epd = scale.experiencesPerDistrict;
  final spd = scale.showsPerDistrict;
  final npd = scale.nightlifePerDistrict;
  final bpd = scale.broadwayPerDistrict;
  final ngpd = scale.guidesPerDistrict;
  final gpd = scale.gemPlacesPerDistrict;
  final gemsPerDistrict = scale.gemsBuildPerDistrict;
  final maxGemsTotal = scale.maxGemsTotal;
  final buf = StringBuffer();
  buf.writeln("import 'package:luxora_ai/data/feed_items.dart';");
  buf.writeln("import 'package:luxora_ai/data/gem_discoveries.dart';");
  buf.writeln("import 'package:luxora_ai/data/${s.dartFolder}/${s.dartFolder}_curated_places.dart';");
  buf.writeln("import 'package:luxora_ai/data/${s.dartFolder}/${s.dartFolder}_feed_items.dart';");
  buf.writeln("import 'package:luxora_ai/data/${s.dartFolder}/${s.dartFolder}_gem_discoveries.dart';");
  buf.writeln("import 'package:luxora_ai/data/${s.dartFolder}/${s.dartFolder}_hotels_catalog.dart';");
  buf.writeln("import 'package:luxora_ai/data/${s.dartFolder}/${s.dartFolder}_local_secrets.dart';");
  buf.writeln("import 'package:luxora_ai/models/city_pack/district_pack.dart';");
  buf.writeln("import 'package:luxora_ai/models/lux_hotel.dart';");
  buf.writeln("import 'package:luxora_ai/models/lux_place.dart';");
  buf.writeln("import 'package:luxora_ai/models/miami/beach_intelligence.dart';");
  buf.writeln("import 'package:luxora_ai/models/${s.dartFolder}/${s.dartFolder}_mood_route.dart';");
  buf.writeln();
  buf.writeln('/// ${s.displayName} city pack — ${s.tagline.split('—').first.trim()}.');
  buf.writeln('abstract final class ${s.classPrefix}Content {');
  buf.writeln("  static const cityId = '${s.cityId}';");
  buf.writeln();
  buf.writeln('  static const _photos = [');
  for (final p in _photos) {
    buf.writeln("    '$p',");
  }
  buf.writeln('  ];');
  buf.writeln();
  buf.writeln('  static const _restaurantStyles = [');
  for (final r in s.restaurantStyles) {
    buf.writeln("    ('${_esc(r.$1)}', [${_qList(r.$2)}]),");
  }
  buf.writeln('  ];');
  buf.writeln();
  buf.writeln('''  static const _attractionKinds = [
${_attractionKindsBlock(s)}
  ];

  static const _experienceKinds = [
${_experienceKindsBlock(s)}
  ];
${s.isVegasPremium ? '''
  static const _showKinds = [
${_vegasShowKinds()}
  ];

  static const _nightlifeKinds = [
${_vegasNightlifeKinds()}
  ];
''' : ''}${s.isNycPremium ? '''
  static const _broadwayKinds = [
${_nycBroadwayKinds()}
  ];

  static const _guideKinds = [
${_nycGuideKinds()}
  ];
''' : ''}
''');
  buf.writeln('  static List<DistrictPack>? _districts;');
  buf.writeln('  static List<LuxPlace>? _places;');
  buf.writeln('  static List<LuxHotel>? _hotels;');
  buf.writeln('  static List<HiddenGem>? _gems;');
  buf.writeln('  static List<HiddenGem>? _localSecrets;');
  buf.writeln('  static List<FeedItem>? _feed;');
  buf.writeln('  static List<BeachIntelligence>? _beachIntel;');
  buf.writeln('  static List<${s.classPrefix}MoodRoute>? _routes;');
  buf.writeln();
  buf.writeln('  static List<DistrictPack> get districts => _districts ??= _buildDistricts();');
  buf.writeln('  static List<LuxPlace> get places => _places ??= _buildAllPlaces();');
  buf.writeln('  static List<LuxHotel> get hotels => _hotels ??= ${s.classPrefix}HotelsCatalog.all;');
  buf.writeln('  static List<HiddenGem> get gems => _gems ??= _buildGems();');
  buf.writeln('  static List<HiddenGem> get localSecrets =>');
  buf.writeln('      _localSecrets ??= ${s.classPrefix}LocalSecrets.buildForDistricts(districts);');
  buf.writeln('  static List<FeedItem> get feedItems => _feed ??= ${s.dartFolder}DiscoveryFeed;');
  buf.writeln('  static List<BeachIntelligence> get beachIntelligence =>');
  buf.writeln('      _beachIntel ??= _buildBeachIntel();');
  buf.writeln('  static List<${s.classPrefix}MoodRoute> get moodRoutes => _routes ??= _buildMoodRoutes();');
  buf.writeln();
  buf.writeln('  static Map<String, String> get feedItemPlaceIds => k${s.classPrefix}FeedItemPlaceIds;');
  buf.writeln('  static Map<String, String> get gemPlaceIds => k${s.classPrefix}GemPlaceIds;');
  buf.writeln('  static Map<String, String> get itineraryMomentPlaceIds =>');
  buf.writeln('      k${s.classPrefix}ItineraryMomentPlaceIds;');
  buf.writeln();
  buf.writeln('  static String _photo(int i) => _photos[i % _photos.length];');
  buf.writeln();
  buf.writeln('  static List<DistrictPack> _buildDistricts() {');
  buf.writeln('    const seeds = [');
  for (final d in s.districts) {
    final id = '${s.cityId}-${d.slug}';
    buf.writeln(
      "      ('$id', '${_esc(d.name)}', DistrictType.${d.type}, "
      "'${_esc(d.description)}', [${_qList(d.vibeTags)}], [${_qList(d.bestFor)}], ${d.lat}, ${d.lng}),",
    );
  }
  buf.writeln('    ];');
  buf.writeln(_districtBuildBody(
    s,
    rpd: rpd,
    apd: apd,
    epd: epd,
    spd: spd,
    npd: npd,
    bpd: bpd,
    ngpd: ngpd,
    gpd: gpd,
    gemsPerDistrict: gemsPerDistrict,
    maxGemsTotal: maxGemsTotal,
  ));
  return buf.toString();
}

String _attractionKindsBlock(PackSpec s) {
  if (s.isNycPremium) return _nycAttractionKinds();
  if (s.isVegasPremium) return _vegasAttractionKinds();
  return _defaultAttractionKinds();
}

String _experienceKindsBlock(PackSpec s) {
  if (s.isNycPremium) return _nycExperienceKinds();
  if (s.isVegasPremium) return _vegasExperienceKinds();
  return _defaultExperienceKinds();
}

String _vegasPremium(PackSpec s, String vegas, String def) =>
    s.isVegasPremium ? vegas : def;

String _defaultAttractionKinds() => '''
    ('Waterfront walk', LuxPlaceCategory.adventure, ['waterfront', 'walkable', 'scenic']),
    ('Beach park', LuxPlaceCategory.beach, ['beach', 'family', 'sunset']),
    ('Historic landmark', LuxPlaceCategory.adventure, ['culture', 'historic', 'walkable']),
    ('Nature preserve', LuxPlaceCategory.nature, ['nature', 'relaxing', 'photo']),''';

String _vegasAttractionKinds() => '''
    ('Casino resort', LuxPlaceCategory.adventure, ['casino', 'luxury', 'nightlife']),
    ('Signature show venue', LuxPlaceCategory.adventure, ['show', 'entertainment', 'bucket-list']),
    ('Rooftop lounge', LuxPlaceCategory.adventure, ['rooftop', 'nightlife', 'views']),
    ('Luxury shopping atrium', LuxPlaceCategory.adventure, ['shopping', 'luxury', 'indoor']),
    ('Pool club', LuxPlaceCategory.adventure, ['pool', 'dayclub', 'summer']),
    ('Sportsbook lounge', LuxPlaceCategory.adventure, ['sportsbook', 'casino', 'social']),
    ('Fine dining room', LuxPlaceCategory.dining, ['fine-dining', 'celebrity', 'luxury']),
    ('Desert overlook', LuxPlaceCategory.nature, ['desert', 'scenic', 'photo']),''';

String _defaultExperienceKinds() => '''
    ('Sunset cruise', ['sunset', 'water', 'romantic', 'cruise']),
    ('Dolphin cruise', ['wildlife', 'water', 'family', 'cruise']),
    ('Kayak tour', ['adventure', 'water', 'nature']),
    ('Fishing charter', ['adventure', 'water', 'local']),
    ('Food tour', ['foodie', 'culture', 'local']),
    ('Boat rental', ['water', 'adventure', 'family']),
    ('Bike rental', ['bike', 'local', 'adventure']),
    ('Snorkel trip', ['beach', 'water', 'adventure']),''';

String _vegasExperienceKinds() => '''
    ('Helicopter Strip flight', ['bucket-list', 'aerial', 'luxury', 'show']),
    ('VIP nightclub table', ['nightlife', 'luxury', 'social', 'evening']),
    ('Show ticket package', ['show', 'entertainment', 'evening', 'bucket-list']),
    ('Speakeasy crawl', ['speakeasy', 'hidden', 'nightlife', 'local']),
    ('Celebrity chef tasting', ['foodie', 'fine-dining', 'luxury', 'evening']),
    ('Pool cabana day', ['pool', 'dayclub', 'summer', 'relaxing']),
    ('Red Rock hike', ['desert', 'nature', 'adventure', 'morning']),
    ('High-roller observation', ['views', 'luxury', 'bucket-list', 'evening']),
    ('Slot tournament entry', ['casino', 'social', 'nightlife', 'local']),
    ('Romantic gondola ride', ['romantic', 'luxury', 'couples', 'evening']),
    ('Race & sports experience', ['sportsbook', 'adventure', 'social']),
    ('Magic / comedy night', ['show', 'entertainment', 'nightlife']),''';

String _vegasShowKinds() => '''
    ('Residency headliner', ['show', 'entertainment', 'bucket-list', 'evening']),
    ('Cirque-style spectacle', ['show', 'family', 'iconic', 'evening']),
    ('Magic revue', ['show', 'entertainment', 'nightlife', 'evening']),
    ('Comedy club headliner', ['show', 'nightlife', 'social', 'late-night']),
    ('Tribute production', ['show', 'entertainment', 'budget', 'evening']),
    ('Adult revue', ['show', 'nightlife', 'couples', 'evening']),
    ('Live music residency', ['show', 'nightlife', 'live-music', 'evening']),
    ('Production show', ['show', 'luxury', 'bucket-list', 'evening']),''';

String _vegasNightlifeKinds() => '''
    ('Mega nightclub', ['nightclub', 'nightlife', 'high-energy', 'late-night']),
    ('Rooftop day club', ['dayclub', 'pool', 'luxury', 'summer']),
    ('Sportsbook bar', ['sportsbook', 'casino', 'social', 'game-day']),
    ('Speakeasy lounge', ['speakeasy', 'hidden', 'cocktails', 'late-night']),
    ('Cigar & whiskey lounge', ['luxury', 'nightlife', 'couples', 'late-night']),
    ('Dance lounge', ['nightlife', 'social', 'high-energy', 'late-night']),
    ('Karaoke lounge', ['nightlife', 'social', 'budget', 'late-night']),
    ('VIP host club', ['nightlife', 'luxury', 'bucket-list', 'late-night']),''';

String _nycAttractionKinds() => '''
    ('Observation deck', LuxPlaceCategory.adventure, ['views', 'iconic', 'bucket-list']),
    ('World-class museum', LuxPlaceCategory.adventure, ['museum', 'culture', 'rainy-day']),
    ('Historic landmark', LuxPlaceCategory.adventure, ['historic', 'walkable', 'photo']),
    ('Urban park', LuxPlaceCategory.nature, ['park', 'walkable', 'local']),
    ('Broadway theater district', LuxPlaceCategory.adventure, ['broadway', 'entertainment', 'evening']),
    ('Food market hall', LuxPlaceCategory.dining, ['foodie', 'market', 'local']),
    ('Rooftop bar', LuxPlaceCategory.adventure, ['rooftop', 'views', 'nightlife']),
    ('Iconic pizza slice shop', LuxPlaceCategory.dining, ['pizza', 'foodie', 'local']),''';

String _nycExperienceKinds() => '''
    ('Neighborhood walking tour', ['walkable', 'local', 'culture', 'exploration']),
    ('Subway food crawl', ['foodie', 'local', 'subway', 'value']),
    ('Photography walk', ['photo', 'iconic', 'walkable', 'exploration']),
    ('Broadway ticket concierge', ['broadway', 'entertainment', 'evening', 'bucket-list']),
    ('Central Park guided stroll', ['park', 'family', 'walkable', 'morning']),
    ('Speakeasy crawl', ['speakeasy', 'hidden', 'nightlife', 'local']),
    ('Harbor cruise', ['waterfront', 'views', 'romantic', 'evening']),
    ('Bagel & coffee trail', ['foodie', 'morning', 'local', 'walkable']),
    ('Museum skip-the-line pass', ['museum', 'culture', 'rainy-day', 'efficient']),
    ('Brooklyn bridge sunrise', ['photo', 'iconic', 'morning', 'walkable']),''';

String _nycBroadwayKinds() => '''
    ('Tony-winning musical', ['broadway', 'show', 'entertainment', 'evening']),
    ('Intimate off-Broadway play', ['broadway', 'culture', 'local', 'evening']),
    ('Classic revival production', ['broadway', 'historic', 'iconic', 'evening']),
    ('Family Broadway matinee', ['broadway', 'family', 'matinee', 'weekend']),''';

String _nycGuideKinds() => '''
    ('Neighborhood walking route', ['walkable', 'local', 'cluster', 'efficient']),
    ('Subway-efficient day plan', ['subway', 'efficient', 'local', 'no-backtrack']),''';

String _generatedShowLoop(PackSpec s, int spd) => '''
      for (var sh = 0; sh < $spd; sh++) {
        final kind = _showKinds[(d + sh) % _showKinds.length];
        out.add(_place(
          id: '${s.cityId}-show-\${dist.districtId}-\$sh',
          title: '\${dist.districtName} \${kind.\$1}',
          category: LuxPlaceCategory.adventure,
          lat: lat + (sh * 0.0022),
          lng: lng - (sh * 0.0019),
          location: '\${dist.districtName}, ${s.displayName}',
          description:
              'Show intelligence — \${kind.\$1.toLowerCase()} with concierge seat timing.',
          moodTags: [...kind.\$2, 'show', '${s.cityId}'],
          photo: _photo(idx++),
        ));
      }
''';

String _generatedBroadwayLoop(PackSpec s, int bpd) => '''
      for (var b = 0; b < $bpd; b++) {
        final kind = _broadwayKinds[(d + b) % _broadwayKinds.length];
        out.add(_place(
          id: '${s.cityId}-broadway-\${dist.districtId}-\$b',
          title: '\${dist.districtName} \${kind.\$1}',
          category: LuxPlaceCategory.adventure,
          lat: lat + (b * 0.0018),
          lng: lng - (b * 0.0015),
          location: '\${dist.districtName}, ${s.displayName}',
          description:
              'Broadway intelligence — \${kind.\$1.toLowerCase()} with TKTS and rush-seat timing.',
          moodTags: [...kind.\$2, 'broadway', '${s.cityId}'],
          photo: _photo(idx++),
        ));
      }
''';

String _generatedGuideLoop(PackSpec s, int ngpd) => '''
      for (var g = 0; g < $ngpd; g++) {
        final kind = _guideKinds[(d + g) % _guideKinds.length];
        out.add(_place(
          id: '${s.cityId}-guide-\${dist.districtId}-\$g',
          title: '\${dist.districtName} \${kind.\$1}',
          category: LuxPlaceCategory.adventure,
          lat: lat + (g * 0.0014),
          lng: lng + (g * 0.0011),
          location: '\${dist.districtName} · neighborhood guide',
          description:
              'Clustered day plan — \${kind.\$1.toLowerCase()} minimizing subway hops and backtracking.',
          moodTags: [...kind.\$2, 'guide', '${s.cityId}'],
          photo: _photo(idx++),
        ));
      }
''';

String _generatedNightlifeLoop(PackSpec s, int npd) => '''
      for (var n = 0; n < $npd; n++) {
        final kind = _nightlifeKinds[(d + n) % _nightlifeKinds.length];
        out.add(_place(
          id: '${s.cityId}-nightlife-\${dist.districtId}-\$n',
          title: '\${dist.districtName} \${kind.\$1}',
          category: LuxPlaceCategory.adventure,
          lat: lat - (n * 0.0021),
          lng: lng + (n * 0.0028),
          location: '\${dist.districtName}, ${s.displayName}',
          description:
              'Nightlife intel — \${kind.\$1.toLowerCase()} with door and table timing.',
          moodTags: [...kind.\$2, 'nightlife', '${s.cityId}'],
          photo: _photo(idx++),
        ));
      }
''';

String _districtBuildBody(
  PackSpec s, {
  required int rpd,
  required int apd,
  required int epd,
  required int spd,
  required int npd,
  required int bpd,
  required int ngpd,
  required int gpd,
  required int gemsPerDistrict,
  required int maxGemsTotal,
}) => '''
    return [
      for (final s in seeds)
        DistrictPack(
          districtId: s.\$1,
          cityId: cityId,
          districtName: s.\$2,
          districtType: s.\$3,
          description: s.\$4,
          vibeTags: s.\$5,
          bestFor: s.\$6,
          mapBounds: DistrictBounds(
            north: s.\$7 + 0.022,
            south: s.\$7 - 0.022,
            east: s.\$8 + 0.022,
            west: s.\$8 - 0.022,
          ),
        ),
    ];
  }

  static List<LuxPlace> _buildAllPlaces() {
    final out = <LuxPlace>[
      ...${s.classPrefix}CuratedPlaces.flagship,
      ...${s.classPrefix}HotelsCatalog.hotelPlaces,
    ];
    var idx = 0;

    for (var d = 0; d < districts.length; d++) {
      final dist = districts[d];
      final lat = _districtLat(dist);
      final lng = _districtLng(dist);

      for (var r = 0; r < $rpd; r++) {
        final style = _restaurantStyles[(d + r) % _restaurantStyles.length];
        out.add(_place(
          id: '${s.cityId}-dining-\${dist.districtId}-\$r',
          title: '\${dist.districtName} \${style.\$1}',
          category: LuxPlaceCategory.dining,
          lat: lat + (r * 0.0018),
          lng: lng - (r * 0.0012),
          location: '\${dist.districtName}, ${s.displayName}',
          description:
              'Concierge-curated \${style.\$1.toLowerCase()} — \${dist.description}',
          moodTags: [...style.\$2, 'dining', '${s.cityId}'],
          photo: _photo(idx++),
        ));
      }

      for (var a = 0; a < $apd; a++) {
        final kind = _attractionKinds[(d + a) % _attractionKinds.length];
        out.add(_place(
          id: '${s.cityId}-attr-\${dist.districtId}-\$a',
          title: '\${dist.districtName} \${kind.\$1}',
          category: kind.\$2,
          lat: lat - (a * 0.0025),
          lng: lng + (a * 0.0018),
          location: '\${dist.districtName}, ${s.displayName}',
          description: '\${kind.\$1} — \${dist.vibeTags.take(2).join(' & ')} energy.',
          moodTags: [...kind.\$3, '${s.cityId}'],
          photo: _photo(idx++),
        ));
      }

      for (var e = 0; e < $epd; e++) {
        final kind = _experienceKinds[(d + e) % _experienceKinds.length];
        out.add(_place(
          id: '${s.cityId}-exp-\${dist.districtId}-\$e',
          title: '\${dist.districtName} \${kind.\$1}',
          category: LuxPlaceCategory.adventure,
          lat: lat + (e * 0.003),
          lng: lng + (e * 0.0025),
          location: '\${dist.districtName}, ${s.displayName}',
          description:
              'Bookable experience — \${kind.\$1.toLowerCase()} with local operators.',
          moodTags: [...kind.\$2, 'experience', '${s.cityId}'],
          photo: _photo(idx++),
        ));
      }

${spd > 0 ? _generatedShowLoop(s, spd) : ''}${npd > 0 ? _generatedNightlifeLoop(s, npd) : ''}${bpd > 0 ? _generatedBroadwayLoop(s, bpd) : ''}${ngpd > 0 ? _generatedGuideLoop(s, ngpd) : ''}
      for (var g = 0; g < $gpd; g++) {
        out.add(_place(
          id: '${s.cityId}-gem-place-\${dist.districtId}-\$g',
          title: 'Hidden \${dist.districtName} \${g + 1}',
          category: ${s.isNycPremium ? 'LuxPlaceCategory.adventure' : s.isVegasPremium ? 'LuxPlaceCategory.adventure' : 'g.isEven ? LuxPlaceCategory.beach : LuxPlaceCategory.dining'},
          lat: lat + (g * 0.0012),
          lng: lng - (g * 0.0016),
          location: '\${dist.districtName} · local gem',
          description:
              '${s.isNycPremium ? "Insider-only — quiet block, secret view, or neighborhood bite locals guard." : s.isVegasPremium ? "Insider-only — speakeasy angle, quiet bar, or view locals guard." : "Insider-only — secret beach, courtyard, or sunset bench worth the detour."}',
          moodTags: ['hidden', 'local', 'gem', '${s.cityId}'],
          photo: _photo(idx++),
        ));
      }
    }

    return out;
  }

  static List<HiddenGem> _buildGems() {
    final out = <HiddenGem>[...${s.dartFolder}HiddenGemsCatalog];
    for (final dist in districts) {
      for (var g = 0; g < $gemsPerDistrict; g++) {
        if (out.length >= $maxGemsTotal) break;
        out.add(
          HiddenGem(
            id: '${s.cityId}-gem-\${dist.districtId}-\$g',
            title: 'Hidden \${dist.districtName} \${g + 1}',
            location: '\${dist.districtName} · ${s.displayName}',
            whySpecial:
                'Local-only \${dist.vibeTags.first} spot — photogenic, quiet, and off the tourist loop.',
            bestTime: g.isEven ? 'Sunrise · weekdays' : 'Golden hour',
            crowdLevel: g.isEven ? 'Low' : 'Moderate weekends',
            insiderTip:
                'Pair with \${dist.districtName} dinner — arrive 30 min before peak.',
            localOnlyNote: 'Residents guard this one — not in guidebooks.',
            gradient: ${s.dartFolder}HiddenGemsCatalog.first.gradient,
          ),
        );
      }
    }
    return out;
  }

  static List<BeachIntelligence> _buildBeachIntel() {
    final targets = ${s.isNycPremium
        ? "places.where((p) => p.moodTags.contains('park') || p.moodTags.contains('museum') || p.moodTags.contains('walkable')).take(100).toList()"
        : s.isVegasPremium
        ? "places.where((p) => p.moodTags.contains('pool') || p.moodTags.contains('show') || p.id.contains('-nightlife-')).take(80).toList()"
        : "places.where((p) => p.category == LuxPlaceCategory.beach).toList()"};
    return [
      for (var i = 0; i < targets.length; i++)
        BeachIntelligence(
          placeId: targets[i].id,
          bestTimeToVisit: ${s.isNycPremium ? "i.isEven ? 'Weekday morning · lighter crowds' : 'Golden hour · rooftop season'" : s.isVegasPremium ? "i.isEven ? 'After 6 PM · cooler walks' : 'Morning before 10 AM · heat advisory'" : "i.isEven ? 'Before noon · calmer water' : 'Sunset golden hour'"},
          familyFriendlyScore: ${s.isNycPremium ? '50 + (i * 4) % 35' : s.isVegasPremium ? '45 + (i * 5) % 35' : '55 + (i * 7) % 40'},
          crowdScore: 35 + (i * 9) % 50,
          photoScore: 72 + (i * 5) % 26,
          romanceScore: ${s.isNycPremium ? '65 + (i * 5) % 30' : s.isVegasPremium ? '70 + (i * 6) % 28' : '60 + (i * 8) % 35'},
          walkabilityScore: ${s.isNycPremium ? '88 + (i * 2) % 10' : s.isVegasPremium ? '40 + (i * 4) % 30' : '58 + (i * 6) % 38'},
          windSensitivity: ${s.isNycPremium ? '20 + (i * 4) % 35' : s.isVegasPremium ? '15 + (i * 3) % 20' : '25 + (i * 7) % 45'},
          sunsetValue: ${s.isNycPremium ? '75 + (i * 3) % 20' : s.isVegasPremium ? '85 + (i * 2) % 12' : '80 + (i * 3) % 18'},
          sunriseValue: ${s.isNycPremium ? '60 + (i * 4) % 25' : s.isVegasPremium ? '30 + (i * 3) % 25' : '70 + (i * 4) % 25'},
          parkingDifficulty: ${s.isNycPremium ? "i.isEven ? 'Walk or subway · skip driving' : 'Rain plan · subway underfoot routes'" : s.isVegasPremium ? "i.isEven ? 'Use garage comps · validate tickets' : 'Strip weekends · valet only'" : "i.isEven ? 'Moderate' : 'Difficult weekends'"},
          nearbyRestaurantPlaceIds: places
              .where((p) => p.category == LuxPlaceCategory.dining)
              .skip(i)
              .take(2)
              .map((p) => p.id)
              .toList(),
        ),
    ];
  }

  static List<${s.classPrefix}MoodRoute> _buildMoodRoutes() {
    final dining = places.where((p) => p.category == LuxPlaceCategory.dining).toList();
${s.isNycPremium ? '''    final parks = places.where((p) => p.moodTags.contains('park')).toList();
    final museums = places.where((p) => p.moodTags.contains('museum')).toList();
    final broadway = places.where((p) => p.id.contains('-broadway-')).toList();
    final rooftops = places.where((p) => p.moodTags.contains('rooftop')).toList();''' : s.isVegasPremium ? '''    final shows = places.where((p) => p.id.contains('-show-')).toList();
    final nightlife = places.where((p) => p.id.contains('-nightlife-')).toList();
    final pools = places.where((p) => p.moodTags.contains('pool')).toList();''' : '''    final beaches = places.where((p) => p.category == LuxPlaceCategory.beach).toList();
    final culture = places.where((p) => p.moodTags.contains('culture')).toList();
    final waterfront = places.where((p) => p.moodTags.contains('waterfront')).toList();'''}

    String pick(List<LuxPlace> list, int i) =>
        list.isEmpty ? dining[i % dining.length].id : list[i % list.length].id;

    const routes = [
${_moodRouteConstList(s)}
    ];

    return [
      for (var i = 0; i < routes.length; i++)
        ${s.classPrefix}MoodRoute(
          routeId: '${s.cityId}-route-\$i',
          title: routes[i].\$1,
          description:
              'Prebuilt Luxora concierge flow — \${routes[i].\$2.join(', ')}.',
          moodTags: routes[i].\$2,
          morningPlaceId: pick(${s.isNycPremium ? 'parks.isNotEmpty ? parks : museums' : s.isVegasPremium ? 'pools.isNotEmpty ? pools : shows' : 'beaches.isNotEmpty ? beaches : waterfront'}, i),
          lunchPlaceId: pick(dining, i + 1),
          afternoonPlaceId: pick(${s.isNycPremium ? 'museums.isNotEmpty ? museums : dining' : s.isVegasPremium ? 'shows.isNotEmpty ? shows : dining' : 'culture.isNotEmpty ? culture : dining'}, i + 2),
          dinnerPlaceId: pick(dining, i + 3),
          eveningPlaceId: pick(${s.isNycPremium ? 'broadway.isNotEmpty ? broadway : rooftops' : s.isVegasPremium ? 'nightlife.isNotEmpty ? nightlife : shows' : 'waterfront.isNotEmpty ? waterfront : beaches'}, i),
          bestStartTime: ${s.isNycPremium ? "i.isEven ? '8:30 AM · walkable cluster start' : '5:30 PM · show then dinner'" : s.isVegasPremium ? "i.isEven ? '10:00 AM · beat the heat' : '4:00 PM · pool to show'" : "i.isEven ? '8:00 AM' : '9:30 AM'"},
          weatherSensitive: true,
          crowdSensitive: i % 2 == 0,
          estimatedDriveMinutes: ${s.isNycPremium ? '8 + (i * 3) % 18' : s.isVegasPremium ? '15 + (i * 4) % 25' : '20 + (i * 6) % 40'},
        ),
    ];
  }

  static LuxPlace _place({
    required String id,
    required String title,
    required LuxPlaceCategory category,
    required double lat,
    required double lng,
    required String location,
    required String description,
    required List<String> moodTags,
    required String photo,
  }) {
    return LuxPlace(
      id: id,
      slug: id,
      title: title,
      category: category,
      unsplashPhotoId: photo,
      location: location,
      latitude: lat,
      longitude: lng,
      description: description,
      moodTags: moodTags,
      cityPackId: cityId,
    );
  }

  static double _districtLat(DistrictPack d) =>
      (d.mapBounds!.north + d.mapBounds!.south) / 2;

  static double _districtLng(DistrictPack d) =>
      (d.mapBounds!.east + d.mapBounds!.west) / 2;
}
''';

String _moodRouteConstList(PackSpec s) {
  final lines = <String>[];
  for (final r in s.moodRoutes) {
    lines.add("      ('${_esc(r.$1)}', [${_qList(r.$2)}]),");
  }
  return lines.join('\n');
}

String _esc(String v) => v.replaceAll("'", "\\'");
String _qList(List<String> items) => items.map((e) => "'${_esc(e)}'").join(', ');

String _camelPrefix(String dartFolder) {
  final parts = dartFolder.split('_');
  final b = StringBuffer(parts.first);
  for (var i = 1; i < parts.length; i++) {
    final p = parts[i];
    if (p.isEmpty) continue;
    b.write(p[0].toUpperCase() + p.substring(1));
  }
  return b.toString();
}

String _curatedDart(PackSpec s) {
  final buf = StringBuffer();
  buf.writeln("import 'package:luxora_ai/models/lux_place.dart';");
  buf.writeln();
  buf.writeln('/// Flagship ${s.displayName} places — stable IDs for feed, gems, tickets, and routes.');
  buf.writeln('abstract final class ${s.classPrefix}CuratedPlaces {');
  buf.writeln("  static const cityId = '${s.cityId}';");
  buf.writeln();
  buf.writeln('  static const List<LuxPlace> flagship = [');
  for (final f in s.flagships) {
    buf.writeln('    LuxPlace(');
    buf.writeln("      id: '${f.id}',");
    buf.writeln("      slug: '${f.slug}',");
    buf.writeln("      title: '${_esc(f.title)}',");
    buf.writeln('      category: LuxPlaceCategory.${f.category},');
    buf.writeln("      unsplashPhotoId: '${f.photo}',");
    buf.writeln("      location: '${_esc(f.location)}',");
    buf.writeln('      latitude: ${f.lat},');
    buf.writeln('      longitude: ${f.lng},');
    buf.writeln("      description: '${_esc(f.description)}',");
    buf.writeln('      moodTags: [${_qList(f.moodTags)}],');
    buf.writeln('      cityPackId: cityId,');
    buf.writeln('      source: LuxPlaceSource.curated,');
    buf.writeln('    ),');
  }
  buf.writeln('  ];');
  buf.writeln('}');
  return buf.toString();
}

String _hotelsDart(PackSpec s) {
  final scale = _packScale(s);
  final maxHotels = scale.maxHotels;
  final categoriesBlock = s.isNycPremium
      ? '''
  static const _categories = [
    ('Midtown Luxury Tower', HotelPriceRange.luxury, [HotelBestForTag.luxuryStaycation, HotelBestForTag.walkableDining], 95, 70, 90),
    ('Boutique Townhouse', HotelPriceRange.luxury, [HotelBestForTag.quietEscape, HotelBestForTag.bestForCouples], 92, 55, 88),
    ('Classic NYC Hotel', HotelPriceRange.luxury, [HotelBestForTag.luxuryStaycation, HotelBestForTag.walkableDining], 94, 65, 85),
    ('Family Suite Hotel', HotelPriceRange.upscale, [HotelBestForTag.familyFriendly, HotelBestForTag.walkableDining], 82, 88, 70),
    ('Downtown Value Stay', HotelPriceRange.upscale, [HotelBestForTag.budgetFriendly, HotelBestForTag.walkableDining], 78, 75, 80),
    ('Brooklyn Loft Hotel', HotelPriceRange.upscale, [HotelBestForTag.quietEscape, HotelBestForTag.walkableDining], 80, 70, 72),
    ('Riverside Retreat', HotelPriceRange.luxury, [HotelBestForTag.bestForCouples, HotelBestForTag.quietEscape], 90, 60, 88),
    ('Extended Stay Studio', HotelPriceRange.moderate, [HotelBestForTag.budgetFriendly, HotelBestForTag.familyFriendly], 68, 80, 55),
  ];'''
      : s.isVegasPremium
      ? '''
  static const _categories = [
    ('Strip Luxury Tower', HotelPriceRange.luxury, [HotelBestForTag.luxuryStaycation, HotelBestForTag.bestForCouples], 96, 75, 92),
    ('Boutique Casino Hotel', HotelPriceRange.luxury, [HotelBestForTag.walkableDining, HotelBestForTag.quietEscape], 90, 70, 88),
    ('Pool & Dayclub Resort', HotelPriceRange.luxury, [HotelBestForTag.resortFeel, HotelBestForTag.luxuryStaycation], 94, 65, 85),
    ('Family Mega Resort', HotelPriceRange.upscale, [HotelBestForTag.familyFriendly, HotelBestForTag.resortFeel], 82, 92, 70),
    ('Downtown Classic', HotelPriceRange.upscale, [HotelBestForTag.budgetFriendly, HotelBestForTag.walkableDining], 78, 80, 60),
    ('Off-Strip Value', HotelPriceRange.moderate, [HotelBestForTag.budgetFriendly, HotelBestForTag.quietEscape], 68, 75, 55),
    ('Spa & Wellness Tower', HotelPriceRange.luxury, [HotelBestForTag.luxuryStaycation, HotelBestForTag.quietEscape], 95, 60, 90),
    ('High-Roller Suite', HotelPriceRange.luxury, [HotelBestForTag.bestForCouples, HotelBestForTag.luxuryStaycation], 98, 55, 94),
  ];'''
      : '''
  static const _categories = [
    ('Luxury Waterfront', HotelPriceRange.luxury, [HotelBestForTag.bestForCouples, HotelBestForTag.luxuryStaycation], 94, 88, 90),
    ('Beach Resort', HotelPriceRange.luxury, [HotelBestForTag.resortFeel, HotelBestForTag.familyFriendly], 90, 85, 95),
    ('Boutique Hotel', HotelPriceRange.upscale, [HotelBestForTag.walkableDining, HotelBestForTag.quietEscape], 82, 78, 70),
    ('Family Resort', HotelPriceRange.upscale, [HotelBestForTag.familyFriendly, HotelBestForTag.resortFeel], 78, 92, 80),
    ('Downtown Hotel', HotelPriceRange.upscale, [HotelBestForTag.walkableDining, HotelBestForTag.quietEscape], 80, 70, 55),
    ('Romantic Escape', HotelPriceRange.luxury, [HotelBestForTag.bestForCouples, HotelBestForTag.quietEscape], 92, 75, 85),
    ('Budget Friendly', HotelPriceRange.moderate, [HotelBestForTag.budgetFriendly, HotelBestForTag.familyFriendly], 55, 80, 60),
    ('Spa Resort', HotelPriceRange.luxury, [HotelBestForTag.luxuryStaycation, HotelBestForTag.quietEscape], 95, 65, 75),
  ];''';
  final hotelDesc = s.isNycPremium
      ? "'\\\${cat.\\\$1} in \\\${district.\\\$2} — subway-adjacent, walkable clusters, and crowd-smart timing.'"
      : s.isVegasPremium
      ? "'\\\${cat.\\\$1} in \\\${district.\\\$2} — Strip access, pool timing, and show-night logistics.'"
      : "'\\\${cat.\\\$1} in \\\${district.\\\$2} — local food access and concierge-timed beach windows.'";
  final dining = s.flagships.take(2).map((f) => "'${f.id}'").join(', ');
  final plannedTags = s.isNycPremium
      ? "['walkable', 'subway', 'foodie']"
      : s.isVegasPremium
      ? "['show', 'nightlife', 'foodie']"
      : "['local', 'foodie', 'beach']";
  final hotelSubtitle = s.isNycPremium
      ? 'walkable, subway-smart, and neighborhood-clustered stays.'
      : s.isVegasPremium
      ? 'Strip, pool, and suite intelligence.'
      : 'beach, boutique, luxury, and family intelligence.';
  final districtSeedLines = s.districts
      .map((d) => "    ('${s.cityId}-${d.slug}', '${_esc(d.name)}', ${d.lat}, ${d.lng}),")
      .join('\n');
  return '''
import 'package:luxora_ai/data/${s.dartFolder}/${s.dartFolder}_curated_places.dart';
import 'package:luxora_ai/data/${s.dartFolder}/${s.dartFolder}_hub.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';

/// ${s.displayName} stays — $hotelSubtitle
abstract final class ${s.classPrefix}HotelsCatalog {
  static const cityId = ${s.classPrefix}CuratedPlaces.cityId;

  static const _photos = [
    'qQFzQyt2ur0', 'V8YLE7LEjOY', 'JZYQ_P94T-Q', 'X_LNSoZ7xeM',
    'sWK9wki5zHU', 'xEaAoizNFV8', 'RE1uPSyVuls', 'AK2vwEobto4',
  ];

$categoriesBlock

  static const _districtSeeds = [
$districtSeedLines
  ];

  static List<LuxHotel>? _all;

  static List<LuxHotel> get all => _all ??= _buildHotels();

  static List<LuxHotel> _buildHotels() {
    final out = <LuxHotel>[];
    var photoIdx = 0;

    for (var d = 0; d < _districtSeeds.length; d++) {
      final district = _districtSeeds[d];
      for (var c = 0; c < _categories.length; c++) {
        if (out.length >= $maxHotels) break;
        final cat = _categories[c];
        final slot = c + 1;
        final id = '${s.cityId}-hotel-intel-\${district.\$1}-\$slot';
        final placeId = 'hotel-${s.cityId}-\${district.\$1}-\$slot';
        out.add(
          LuxHotel(
            id: id,
            placeId: placeId,
            name: '\${district.\$2} \${cat.\$1} \$slot',
            neighborhood: '\${district.\$2} · ${s.displayName}',
            unsplashPhotoId: _photos[photoIdx++ % _photos.length],
            priceRange: cat.\$2,
            luxuryScore: cat.\$4,
            familyScore: cat.\$5,
            romanceScore: cat.\$4 - 4,
            walkabilityScore: cat.\$6,
            nightlifeScore: ${s.isNycPremium ? '60 + (c * 2) % 25' : s.isVegasPremium ? '88 + (c * 2) % 10' : "district.\$1.contains('night') ? 88 : 55"},
            beachAccessScore: ${s.isNycPremium ? '15 + (c * 2) % 10' : s.isVegasPremium ? '25 + (c * 3) % 15' : "district.\$1.contains('beach') ? 96 : 45"},
            foodAccessScore: 75 + (c * 3) % 20,
            attractionDistances: {
              ${s.isNycPremium ? "'Subway': '\${4 + c} min',\n              'Midtown': '\${10 + d} min',\n              'Brooklyn': '\${18 + d} min'," : s.isVegasPremium ? "'Strip': '\${8 + c} min',\n              'Downtown': '\${15 + d} min',\n              'Red Rock': '\${25 + d} min'," : "'Downtown': '\${12 + c} min',\n              'Beach': '\${18 + d} min',\n              'Harbor': '\${15 + d} min',"}
            },
            bestForTags: cat.\$3,
            emotionalDescription: $hotelDesc,
            hotelWebsiteUrl: 'https://example.com/${s.cityId}/\$placeId',
            checkRatesUrl: 'https://example.com/${s.cityId}/\$placeId/rates',
            bookingPartner: 'direct',
            externalId: placeId,
            lastUpdated: DateTime(2026, 5, 31),
            cityPackId: cityId,
            districtId: district.\$1,
            nearbyDiningPlaceIds: const [$dining],
            plannedAttractionTags: $plannedTags,
          ),
        );
      }
    }
    return out;
  }

  static List<LuxPlace> get hotelPlaces => [
        for (final h in all)
          LuxPlace(
            id: h.placeId,
            slug: h.placeId,
            title: h.name,
            category: LuxPlaceCategory.hotel,
            unsplashPhotoId: h.unsplashPhotoId,
            location: h.neighborhood,
            latitude: _coordsFor(h.districtId!).\$1,
            longitude: _coordsFor(h.districtId!).\$2,
            description: h.emotionalDescription,
            moodTags: ['hotel', '${s.cityId}', ...h.plannedAttractionTags],
            cityPackId: cityId,
            source: LuxPlaceSource.curated,
          ),
      ];

  static (double, double) _coordsFor(String districtId) {
    for (final s in _districtSeeds) {
      if (s.\$1 == districtId) return (s.\$3, s.\$4);
    }
    return (${s.classPrefix}Hub.latitude, ${s.classPrefix}Hub.longitude);
  }

  static LuxHotel? byId(String id) {
    for (final h in all) {
      if (h.id == id) return h;
    }
    return null;
  }
}
''';
}

String _feedDart(PackSpec s) {
  final prefix = _camelPrefix(s.dartFolder);
  final feedName = '${prefix}DiscoveryFeed';
  final buf = StringBuffer();
  buf.writeln("import 'package:flutter/material.dart';");
  buf.writeln("import 'package:luxora_ai/data/feed_items.dart';");
  buf.writeln();
  buf.writeln('const $feedName = [');
  for (var i = 0; i < 10; i++) {
    final f = s.flagships[i % s.flagships.length];
    buf.writeln('  FeedItem(');
    buf.writeln("    id: '${s.cityId}-feed-$i',");
    buf.writeln('    kind: FeedItemKind.${i.isEven ? 'trending' : 'creatorPick'},');
    buf.writeln("    title: '${_esc(f.title)} highlight',");
    buf.writeln("    subtitle: '${_esc(s.districts[i % s.districts.length].name)} · ${s.displayName}',");
    buf.writeln("    location: '${_esc(f.location)}',");
    buf.writeln("    headline: '${_esc(f.description)}',");
    buf.writeln("    socialProof: '${1000 + i * 800} saves · #${s.cityId.replaceAll('-', '')}',");
    buf.writeln('    gradient: [Color(0xFF0EA5E9), Color(0xFF6366F1), Color(0xFF1E1B4B)],');
    if (i == 0) buf.writeln('    isLive: true,');
    buf.writeln('  ),');
  }
  buf.writeln('];');
  buf.writeln();
  buf.writeln('const k${s.classPrefix}FeedItemPlaceIds = <String, String>{');
  for (var i = 0; i < 10; i++) {
    final f = s.flagships[i % s.flagships.length];
    buf.writeln("  '${s.cityId}-feed-$i': '${f.id}',");
  }
  buf.writeln('};');
  buf.writeln();
  buf.writeln('const k${s.classPrefix}ItineraryMomentPlaceIds = <String, String>{');
  for (var i = 0; i < 3; i++) {
    buf.writeln("  'moment-${i + 1}': '${s.flagships[i].id}',");
  }
  buf.writeln('};');
  return buf.toString();
}

String _gemDart(PackSpec s) {
  final prefix = _camelPrefix(s.dartFolder);
  final buf = StringBuffer();
  buf.writeln("import 'package:flutter/material.dart';");
  buf.writeln("import 'package:luxora_ai/data/gem_discoveries.dart';");
  buf.writeln();
  buf.writeln('const ${prefix}HiddenGemsCatalog = [');
  for (var i = 0; i < 5; i++) {
    final f = s.flagships[i];
    buf.writeln('  HiddenGem(');
    buf.writeln("    id: '${s.cityId}-gem-curated-$i',");
    buf.writeln("    title: '${_esc(f.title)} insider angle',");
    buf.writeln("    location: '${_esc(f.location)} · local',");
    buf.writeln("    whySpecial: '${_esc(f.description)}',");
    buf.writeln("    bestTime: 'Golden hour · weekdays',");
    buf.writeln("    crowdLevel: 'Low if timed right',");
    buf.writeln("    insiderTip: 'Arrive 30 min before peak — ${s.displayName} locals tip.',");
    buf.writeln("    localOnlyNote: 'Not on typical visitor maps.',");
    buf.writeln('    gradient: [Color(0xFF0EA5E9), Color(0xFF0D9488), Color(0xFF134E4A)],');
    buf.writeln('  ),');
  }
  buf.writeln('];');
  buf.writeln();
  buf.writeln('const k${s.classPrefix}GemPlaceIds = <String, String>{');
  for (var i = 0; i < 5; i++) {
    buf.writeln("  '${s.cityId}-gem-curated-$i': '${s.flagships[i].id}',");
  }
  buf.writeln('};');
  return buf.toString();
}

String _localSecretsDart(PackSpec s) {
  final secretsPerDistrict = _packScale(s).secretsPerDistrict;
  final kinds = s.secretKinds
      .map((k) => "    ('${_esc(k.$1)}', '${_esc(k.$2)}'),")
      .join('\n');
  return '''
import 'package:flutter/material.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/models/city_pack/district_pack.dart';

/// ${s.displayName} local secrets — insider timing, parking, and seasonal pivots.
abstract final class ${s.classPrefix}LocalSecrets {
  static const _seasons = [
    'Year-round',
    'Oct–Apr best',
    'Summer mornings',
    'Dry season',
    'Shoulder season',
  ];

  static const _gradients = [
    [Color(0xFF0EA5E9), Color(0xFF0D9488), Color(0xFF134E4A)],
    [Color(0xFFF97316), Color(0xFFEC4899), Color(0xFF4C1D95)],
    [Color(0xFF78716C), Color(0xFF57534E), Color(0xFF292524)],
    [Color(0xFF14B8A6), Color(0xFF365314), Color(0xFF134E4A)],
    [Color(0xFF6366F1), Color(0xFF8B5CF6), Color(0xFF1E1B4B)],
  ];

  static const _secretKinds = [
$kinds
  ];

  static List<HiddenGem>? _catalog;

  static List<HiddenGem> buildForDistricts(List<DistrictPack> districts) {
    return _catalog ??= _build(districts);
  }

  static List<HiddenGem> _build(List<DistrictPack> districts) {
    final out = <HiddenGem>[];
    var idx = 0;
    for (final dist in districts) {
      for (var s = 0; s < $secretsPerDistrict; s++) {
        final kind = _secretKinds[(idx + s) % _secretKinds.length];
        out.add(
          HiddenGem(
            id: '${s.cityId}-secret-\${dist.districtId}-\$s',
            title: '\${dist.districtName}: \${kind.\$1}',
            location: '\${dist.districtName} · ${s.displayName} insider',
            whySpecial:
                '\${kind.\$2}. Concierge-verified local pivot — hard to Google, easy to miss.',
            bestTime: _seasons[(idx + s) % _seasons.length],
            crowdLevel: s == 0 ? 'Low if timed right' : 'Moderate at peak',
            insiderTip:
                'Seasonality: \${_seasons[(idx + s + 1) % _seasons.length]} — adjust for humidity and UV.',
            localOnlyNote: 'Resident tip — not on typical visitor maps.',
            gradient: _gradients[(idx + s) % _gradients.length],
          ),
        );
      }
      idx++;
    }
    return out;
  }
}
''';
}

String _ticketDart(PackSpec s) {
  final fn = '_${s.dartFolder.replaceAll('-', '_')}DaysFromNow';
  final buf = StringBuffer();
  buf.writeln("import 'package:luxora_ai/models/ticket_deal.dart';");
  buf.writeln();
  buf.writeln('final ${s.dartFolder.replaceAll('-', '_')}TicketDealsCatalog = <TicketDeal>[');
  for (var i = 0; i < 10; i++) {
    final f = s.flagships[i % s.flagships.length];
    buf.writeln('  TicketDeal(');
    buf.writeln("    id: 'deal-${s.cityId}-$i',");
    buf.writeln("    placeId: '${f.id}',");
    buf.writeln("    title: '${_esc(f.title)} — Concierge Deal',");
    buf.writeln('    category: TicketDealCategory.${i.isEven ? 'attractions' : 'tours'},');
    buf.writeln('    officialPriceUsd: ${40 + i * 5},');
    buf.writeln('    discountPriceUsd: ${32 + i * 4},');
    buf.writeln("    sourceName: '${s.displayName} Direct',");
    buf.writeln('    expiresAt: $fn(${14 + i * 3}),');
    buf.writeln('    familyFriendly: true,');
    buf.writeln('    popularityScore: ${75 + i * 2},');
    buf.writeln('    milesFromOrlando: ${80 + i * 3},');
    buf.writeln("    itineraryTags: ['${s.cityId}', 'local', 'concierge'],");
    buf.writeln("    conciergeBestDay: 'Weekday mornings · fewer crowds',");
    buf.writeln('    confidence: DealConfidence.verified,');
    buf.writeln('  ),');
  }
  buf.writeln('];');
  buf.writeln();
  buf.writeln('DateTime $fn(int days) =>');
  buf.writeln('    DateTime.now().add(Duration(days: days));');
  return buf.toString();
}

void _generateTest(PackSpec spec, Directory root) {
  final className = spec.classPrefix;
  final catalogVar = '${_camelPrefix(spec.dartFolder)}TicketDealsCatalog';
  final minDistricts = spec.isNycPremium
      ? 18
      : spec.isVegasPremium
          ? 10
          : 18;
  final minHotels = spec.isNycPremium
      ? 100
      : spec.isVegasPremium
          ? 75
          : 50;
  final minDining = spec.isNycPremium
      ? 300
      : spec.isVegasPremium
          ? 200
          : 150;
  final minAttr = spec.isNycPremium
      ? 150
      : spec.isVegasPremium
          ? 100
          : 75;
  final minExp = spec.isNycPremium
      ? 150
      : spec.isVegasPremium
          ? 150
          : 100;
  final minGems = spec.isNycPremium
      ? 150
      : spec.isVegasPremium
          ? 100
          : 100;
  final minSecrets = spec.isNycPremium
      ? 100
      : spec.isVegasPremium
          ? 75
          : 50;
  final showTest = spec.isNycPremium
      ? '''
    expect(
      places.where((p) => p.id.contains('-broadway-')).length,
      greaterThanOrEqualTo(50),
    );
    expect(
      places.where((p) => p.id.contains('-guide-')).length,
      greaterThanOrEqualTo(25),
    );'''
      : spec.isVegasPremium
          ? '''
    expect(
      places.where((p) => p.id.contains('-show-')).length,
      greaterThanOrEqualTo(100),
    );
    expect(
      places.where((p) => p.id.contains('-nightlife-')).length,
      greaterThanOrEqualTo(75),
    );'''
          : '';
  File('test/${spec.dartFolder}_content_test.dart').writeAsStringSync('''
import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/data/${spec.dartFolder}/${spec.dartFolder}_content.dart';
import 'package:luxora_ai/data/${spec.dartFolder}/${spec.dartFolder}_ticket_deals.dart';
import 'package:luxora_ai/models/lux_place.dart';

void main() {
  test('${spec.displayName} city pack meets launch content targets', () {
    final places = ${className}Content.places;

    expect(${className}Content.districts.length, greaterThanOrEqualTo($minDistricts));
    expect(${className}Content.hotels.length, greaterThanOrEqualTo($minHotels));
    expect(
      places.where((p) => p.category == LuxPlaceCategory.dining).length,
      greaterThanOrEqualTo($minDining),
    );
    expect(
      places
          .where(
            (p) =>
                p.category == LuxPlaceCategory.adventure ||
                p.category == LuxPlaceCategory.beach ||
                p.category == LuxPlaceCategory.nature,
          )
          .length,
      greaterThanOrEqualTo($minAttr),
    );
    expect(
      places.where((p) => p.id.contains('-exp-')).length,
      greaterThanOrEqualTo($minExp),
    );$showTest
    expect(${className}Content.gems.length, greaterThanOrEqualTo($minGems));
    expect(${className}Content.localSecrets.length, greaterThanOrEqualTo($minSecrets));
    expect(${className}Content.moodRoutes.length, greaterThanOrEqualTo(10));
    expect($catalogVar.length, greaterThanOrEqualTo(8));

    for (final p in places) {
      expect(p.cityPackId, '${spec.cityId}');
    }
  });
}
''');
}

void _generateJson(PackSpec spec, Directory root) {
  final cats = spec.supportedCategories.map((c) => '    "$c"').join(',\n');
  File('assets/city_packs/city_pack_${spec.cityId}.json').writeAsStringSync('''
{
  "cityId": "${spec.cityId}",
  "cityName": "${spec.displayName}",
  "stateId": "${spec.stateId}",
  "description": "${_esc(spec.tagline)}",
  "heroImageUrl": "${spec.heroPhoto}",
  "mapCenterLat": ${spec.hubLat},
  "mapCenterLng": ${spec.hubLng},
  "hubLabel": "${spec.hubLabel}",
  "supportedCategories": [
$cats
  ],
  "featuredExperiences": [],
  "featuredHotels": [],
  "featuredRestaurants": [],
  "featuredTicketDeals": [],
  "featuredHotelIntel": [],
  "defaultRadiusMiles": 35,
  "maxRadiusMiles": 75,
  "districts": [],
  "experiences": [],
  "feedItemPlaceIds": {},
  "gemPlaceIds": {},
  "itineraryMomentPlaceIds": {}
}
''');
}

void _patchWiring(Directory root) {
  _patchFile('lib/services/city_pack_registry.dart', (c) {
    c = _ensureImport(c, "import 'package:luxora_ai/data/st_augustine/st_augustine_content.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/data/st_augustine/st_augustine_hub.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/data/st_augustine/st_augustine_ticket_deals.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/data/naples/naples_content.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/data/naples/naples_hub.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/data/naples/naples_ticket_deals.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/data/destin_30a/destin_30a_content.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/data/destin_30a/destin_30a_hub.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/data/destin_30a/destin_30a_ticket_deals.dart';");

    if (!c.contains('_mergeStAugustineFromDartCatalog')) {
      c = c.replaceFirst(
        '_mergeTampaBayFromDartCatalog();',
        '_mergeTampaBayFromDartCatalog();\n    _mergeStAugustineFromDartCatalog();\n    _mergeNaplesFromDartCatalog();\n    _mergeDestin30aFromDartCatalog();',
      );
    }

    for (final asset in [
      'assets/city_packs/city_pack_st-augustine.json',
      'assets/city_packs/city_pack_naples.json',
      'assets/city_packs/city_pack_destin-30a.json',
    ]) {
      if (!c.contains(asset)) {
        c = c.replaceFirst(
          "'assets/city_packs/city_pack_tampa-bay.json',",
          "'assets/city_packs/city_pack_tampa-bay.json',\n      '$asset',",
        );
      }
    }

    c = c.replaceFirst(
      RegExp(r"destinationCount: 4,\s*\n\s*cityIds: \['orlando', 'miami', 'florida-keys', 'tampa-bay'\],"),
      "destinationCount: 7,\n        cityIds: ['orlando', 'miami', 'florida-keys', 'tampa-bay', 'st-augustine', 'naples', 'destin-30a'],",
    );

    if (!c.contains('_mergeStAugustineFromDartCatalog()')) {
      c = c.replaceFirst(
        RegExp(r'\n\}\s*$'),
        _registryMergeMethods(),
      );
    } else if (!c.contains('void _mergeStAugustineFromDartCatalog')) {
      c = c.replaceFirst(
        RegExp(r'\n\}\s*$'),
        _registryMergeMethods(),
      );
    }
    return c;
  });

  _patchFile('lib/data/iap_product_catalog.dart', (c) {
    c = c.replaceFirst(
      "static const launchCityIds = {'orlando', 'miami', 'florida-keys', 'tampa-bay'};",
      "static const launchCityIds = {'orlando', 'miami', 'florida-keys', 'tampa-bay', 'st-augustine', 'naples', 'destin-30a'};",
    );
    if (!c.contains("'st-augustine'")) {
      c = c.replaceFirst(
        "'tampa-bay': '\$_prefix.city.tampa_bay',",
        "'tampa-bay': '\$_prefix.city.tampa_bay',\n    'st-augustine': '\$_prefix.city.st_augustine',\n    'naples': '\$_prefix.city.naples',\n    'destin-30a': '\$_prefix.city.destin_30a',",
      );
    }
    return c;
  });

  _patchFile('lib/data/paywall_catalog.dart', (c) {
    if (!c.contains("'st-augustine'")) {
      c = c.replaceFirst(
        "'florida-keys': PaywallCityOffer(",
        "'st-augustine': PaywallCityOffer(\n      cityId: 'st-augustine',\n      cityName: 'St. Augustine',\n      regionLabel: 'Florida',\n      heroUnsplashId: 'RE1uPSyVuls',\n      priceUsd: defaultPriceUsd,\n      vacationCostMinUsd: 1600,\n      vacationCostMaxUsd: 4200,\n      couplesHeroUnsplashId: 'RE1uPSyVuls',\n      romanticHeroUnsplashId: 'RE1uPSyVuls',\n    ),\n    'naples': PaywallCityOffer(\n      cityId: 'naples',\n      cityName: 'Naples',\n      regionLabel: 'Florida',\n      heroUnsplashId: 'X_LNSoZ7xeM',\n      priceUsd: defaultPriceUsd,\n      vacationCostMinUsd: 2400,\n      vacationCostMaxUsd: 6500,\n      luxuryHeroUnsplashId: 'X_LNSoZ7xeM',\n      couplesHeroUnsplashId: 'RE1uPSyVuls',\n    ),\n    'destin-30a': PaywallCityOffer(\n      cityId: 'destin-30a',\n      cityName: 'Destin & 30A',\n      regionLabel: 'Florida',\n      heroUnsplashId: 'JZYQ_P94T-Q',\n      priceUsd: defaultPriceUsd,\n      vacationCostMinUsd: 1900,\n      vacationCostMaxUsd: 4800,\n      familyHeroUnsplashId: 'X_LNSoZ7xeM',\n      adventureHeroUnsplashId: 'AK2vwEobto4',\n    ),\n    'florida-keys': PaywallCityOffer(",
      );
    }
    return c;
  });

  _patchCityContentCatalog();
  _patchPlacesRepository();
  _patchHotelServices();
  _patchTicketResolver();
  _patchMapScreen();
  _patchAttractionSheet();
  _patchPubspec();
}

void _patchCityContentCatalog() {
  _patchFile('lib/data/city_content_catalog.dart', (c) {
    c = _ensureImport(c, "import 'package:luxora_ai/data/st_augustine/st_augustine_content.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/data/naples/naples_content.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/data/destin_30a/destin_30a_content.dart';");
    for (final entry in [
      ('StAugustineContent', 'StAugustineContent'),
      ('NaplesContent', 'NaplesContent'),
      ('Destin30aContent', 'Destin30aContent'),
    ]) {
      c = _insertCityBranch(c, entry.$1, entry.$2);
    }
    return c;
  });
}

String _insertCityBranch(String c, String className, String contentClass) {
  if (c.contains('cityId == $contentClass.cityId')) return c;
  const anchor = "if (cityId == TampaBayContent.cityId) {";
  final block = '''
    if (cityId == $contentClass.cityId) {
      return $contentClass.feedItems;
    }
''';
  if (c.contains(anchor) && !c.contains('cityId == $contentClass.cityId')) {
    c = c.replaceFirst(anchor, block + anchor);
  }
  const gemsAnchor = 'if (cityId == TampaBayContent.cityId) {\n      return TampaBayContent.gems;';
  final gemsBlock = '''
    if (cityId == $contentClass.cityId) {
      return $contentClass.gems;
    }
''';
  if (c.contains(gemsAnchor) && !c.contains('$contentClass.gems')) {
    c = c.replaceFirst(gemsAnchor, gemsBlock + gemsAnchor);
  }
  const secretsAnchor = 'if (cityId == TampaBayContent.cityId) {\n      return TampaBayContent.localSecrets;';
  final secretsBlock = '''
    if (cityId == $contentClass.cityId) {
      return $contentClass.localSecrets;
    }
''';
  if (c.contains(secretsAnchor) && !c.contains('$contentClass.localSecrets')) {
    c = c.replaceFirst(secretsAnchor, secretsBlock + secretsAnchor);
  }
  return c;
}

void _patchPlacesRepository() {
  _patchFile('lib/services/places_repository.dart', (c) {
    c = _ensureImport(c, "import 'package:luxora_ai/data/st_augustine/st_augustine_content.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/data/naples/naples_content.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/data/destin_30a/destin_30a_content.dart';");
    if (!c.contains('StAugustineContent.places')) {
      c = c.replaceFirst(
        'for (final p in TampaBayContent.places) {',
        'for (final p in StAugustineContent.places) {\n      _byId[p.id] = p;\n      _bySlug[p.slug] = p;\n    }\n    for (final p in NaplesContent.places) {\n      _byId[p.id] = p;\n      _bySlug[p.slug] = p;\n    }\n    for (final p in Destin30aContent.places) {\n      _byId[p.id] = p;\n      _bySlug[p.slug] = p;\n    }\n    for (final p in TampaBayContent.places) {',
      );
    }
    return c;
  });
}

void _patchHotelServices() {
  for (final path in [
    'lib/services/hotel_intelligence_service.dart',
    'lib/services/stay_dining_catalog_service.dart',
  ]) {
    _patchFile(path, (c) {
      c = _ensureImport(c, "import 'package:luxora_ai/data/st_augustine/st_augustine_hotels_catalog.dart';");
      c = _ensureImport(c, "import 'package:luxora_ai/data/naples/naples_hotels_catalog.dart';");
      c = _ensureImport(c, "import 'package:luxora_ai/data/destin_30a/destin_30a_hotels_catalog.dart';");
      if (!c.contains('StAugustineHotelsCatalog')) {
        c = c.replaceFirst(
          'final tampaBay = TampaBayHotelsCatalog.all.where((h) => ids.contains(h.id));',
          'final stAug = StAugustineHotelsCatalog.all.where((h) => ids.contains(h.id));\n    final naplesHotels = NaplesHotelsCatalog.all.where((h) => ids.contains(h.id));\n    final destin = Destin30aHotelsCatalog.all.where((h) => ids.contains(h.id));\n    final tampaBay = TampaBayHotelsCatalog.all.where((h) => ids.contains(h.id));',
        );
        c = c.replaceFirst(
          'return [...orlando, ...miami, ...keys, ...tampaBay]',
          'return [...orlando, ...miami, ...keys, ...stAug, ...naplesHotels, ...destin, ...tampaBay]',
        );
      }
      if (path.contains('hotel_intelligence') && !c.contains('StAugustineHotelsCatalog.byId')) {
        c = c.replaceFirst(
          'TampaBayHotelsCatalog.byId(id);',
          'StAugustineHotelsCatalog.byId(id) ??\n      NaplesHotelsCatalog.byId(id) ??\n      Destin30aHotelsCatalog.byId(id) ??\n      TampaBayHotelsCatalog.byId(id);',
        );
      }
      return c;
    });
  }
}

void _patchTicketResolver() {
  _patchFile('lib/data/ticket_deals_resolver.dart', (c) {
    c = _ensureImport(c, "import 'package:luxora_ai/data/st_augustine/st_augustine_ticket_deals.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/data/naples/naples_ticket_deals.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/data/destin_30a/destin_30a_ticket_deals.dart';");
    c = c.replaceFirst(
      "'tampa-bay' => tampaBayTicketDealsCatalog,",
      "'st-augustine' => stAugustineTicketDealsCatalog,\n      'naples' => naplesTicketDealsCatalog,\n      'destin-30a' => destin30aTicketDealsCatalog,\n      'tampa-bay' => tampaBayTicketDealsCatalog,",
    );
    c = c.replaceFirst(
      "for (final cityId in ['orlando', 'miami', 'florida-keys', 'tampa-bay'])",
      "for (final cityId in ['orlando', 'miami', 'florida-keys', 'tampa-bay', 'st-augustine', 'naples', 'destin-30a'])",
    );
    if (!c.contains('stAugustineTicketDealsCatalog')) {
      c = c.replaceFirst(
        'for (final d in tampaBayTicketDealsCatalog) {',
        'for (final d in stAugustineTicketDealsCatalog) {\n      if (d.id == id) return d;\n    }\n    for (final d in naplesTicketDealsCatalog) {\n      if (d.id == id) return d;\n    }\n    for (final d in destin30aTicketDealsCatalog) {\n      if (d.id == id) return d;\n    }\n    for (final d in tampaBayTicketDealsCatalog) {',
      );
    }
    return c;
  });
}

void _patchMapScreen() {
  _patchFile('lib/screens/map/map_screen.dart', (c) {
    c = _ensureImport(c, "import 'package:luxora_ai/widgets/st_augustine/st_augustine_concierge_cards.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/widgets/naples/naples_concierge_cards.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/widgets/destin_30a/destin_30a_concierge_cards.dart';");
    if (!c.contains("'st-augustine'")) {
      c = c.replaceFirst(
        "if (CityPackRegistry.instance.active.cityId == 'tampa-bay') ...[",
        _mapPanelBlock('st-augustine', 'StAugustineMoodRoutesPanel') +
            _mapPanelBlock('naples', 'NaplesMoodRoutesPanel') +
            _mapPanelBlock('destin-30a', 'Destin30aMoodRoutesPanel') +
            "if (CityPackRegistry.instance.active.cityId == 'tampa-bay') ...[",
      );
    }
    return c;
  });
}

String _mapPanelBlock(String cityId, String panel) => '''
          if (CityPackRegistry.instance.active.cityId == '$cityId') ...[
            const SizedBox(height: 14),
            $panel(
              onRouteSelected: (route) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(route.title),
                  ),
                );
              },
            ),
          ],
''';

void _patchAttractionSheet() {
  _patchFile('lib/widgets/attraction_detail_sheet.dart', (c) {
    c = _ensureImport(c, "import 'package:luxora_ai/services/st_augustine_concierge_service.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/services/naples_concierge_service.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/services/destin_30a_concierge_service.dart';");
    if (!c.contains('StAugustineBeachIntelligenceService')) {
      c = c.replaceFirst(
        'TampaBayBeachIntelligenceService.forPlace(place.id)',
        'StAugustineBeachIntelligenceService.forPlace(place.id) ??\n                    NaplesBeachIntelligenceService.forPlace(place.id) ??\n                    Destin30aBeachIntelligenceService.forPlace(place.id) ??\n                    TampaBayBeachIntelligenceService.forPlace(place.id)',
      );
    }
    return c;
  });
}

void _patchPubspec() {
  _patchFile('pubspec.yaml', (c) {
    for (final asset in [
      'assets/city_packs/city_pack_st-augustine.json',
      'assets/city_packs/city_pack_naples.json',
      'assets/city_packs/city_pack_destin-30a.json',
    ]) {
      if (!c.contains(asset)) {
        c = c.replaceFirst(
          'assets/city_packs/city_pack_tampa-bay.json',
          'assets/city_packs/city_pack_tampa-bay.json\n    - $asset',
        );
      }
    }
    return c;
  });
}

String _registryMergeMethods() => '''

  void _mergeStAugustineFromDartCatalog() {
    _mergeCityPack(
      cityId: StAugustineContent.cityId,
      cityName: 'St. Augustine',
      description:
          'Historic streets, coastal romance, ghost tours, and walkable colonial charm.',
      heroImageUrl: 'RE1uPSyVuls',
      hubLat: StAugustineHub.latitude,
      hubLng: StAugustineHub.longitude,
      hubLabel: StAugustineHub.label,
      content: StAugustineContent,
      ticketDeals: stAugustineTicketDealsCatalog,
      defaultRadiusMiles: 30,
      maxRadiusMiles: 60,
    );
  }

  void _mergeNaplesFromDartCatalog() {
    _mergeCityPack(
      cityId: NaplesContent.cityId,
      cityName: 'Naples',
      description:
          'Gulf luxury, white-sand beaches, golf corridors, and Fifth Avenue polish.',
      heroImageUrl: 'X_LNSoZ7xeM',
      hubLat: NaplesHub.latitude,
      hubLng: NaplesHub.longitude,
      hubLabel: NaplesHub.label,
      content: NaplesContent,
      ticketDeals: naplesTicketDealsCatalog,
      defaultRadiusMiles: 25,
      maxRadiusMiles: 70,
    );
  }

  void _mergeDestin30aFromDartCatalog() {
    _mergeCityPack(
      cityId: Destin30aContent.cityId,
      cityName: 'Destin & 30A',
      description:
          'Emerald Gulf water, Crab Island boats, and Scenic Highway 30A beach days.',
      heroImageUrl: 'JZYQ_P94T-Q',
      hubLat: Destin30aHub.latitude,
      hubLng: Destin30aHub.longitude,
      hubLabel: Destin30aHub.label,
      content: Destin30aContent,
      ticketDeals: destin30aTicketDealsCatalog,
      defaultRadiusMiles: 35,
      maxRadiusMiles: 80,
    );
  }

  void _mergeCityPack({
    required String cityId,
    required String cityName,
    required String description,
    required String heroImageUrl,
    required double hubLat,
    required double hubLng,
    required String hubLabel,
    required dynamic content,
    required List<dynamic> ticketDeals,
    required int defaultRadiusMiles,
    required int maxRadiusMiles,
  }) {
    final existing = _cities[cityId];
    final places = content.places as List;
    final hotels = content.hotels as List;
    final pack = CityPack(
      cityId: cityId,
      cityName: cityName,
      stateId: 'florida',
      description: existing?.description ?? description,
      heroImageUrl: existing?.heroImageUrl ?? heroImageUrl,
      mapCenterLat: hubLat,
      mapCenterLng: hubLng,
      hubLabel: hubLabel,
      supportedCategories: existing?.supportedCategories ??
          [
            'hotel',
            'dining',
            'beach',
            'culture',
            'foodie',
            'family',
            'adventure',
          ],
      featuredExperienceIds: places
          .where((p) => p.id.toString().contains('-exp-'))
          .map((p) => p.id as String)
          .toList(),
      featuredHotelIds: hotels.map((h) => h.placeId as String).toList(),
      featuredRestaurantIds: places
          .where((p) => p.category.name == 'dining')
          .map((p) => p.id as String)
          .toList(),
      featuredTicketDealIds: ticketDeals.map((d) => d.id as String).toList(),
      featuredHotelIntelIds: hotels.map((h) => h.id as String).toList(),
      districts: content.districts,
      experiences: const [],
      feedItemPlaceIds: content.feedItemPlaceIds,
      gemPlaceIds: content.gemPlaceIds,
      itineraryMomentPlaceIds: content.itineraryMomentPlaceIds,
      osmAssetPath: existing?.osmAssetPath,
      defaultRadiusMiles: defaultRadiusMiles,
      maxRadiusMiles: maxRadiusMiles,
    );
    _cities[cityId] = pack;
  }
''';

String _ensureImport(String content, String importLine) {
  if (content.contains(importLine)) return content;
  return content.replaceFirst(
    "import 'package:flutter/foundation.dart';",
    "import 'package:flutter/foundation.dart';\n$importLine",
  ).replaceFirst(
    "import 'package:luxora_ai/data/ticket_deals_catalog.dart';",
    "$importLine\nimport 'package:luxora_ai/data/ticket_deals_catalog.dart';",
  ).replaceFirst(
    "import 'package:flutter/material.dart';",
    "import 'package:flutter/material.dart';\n$importLine",
  ).replaceFirst(
    "import 'package:flutter_test/flutter_test.dart';",
    "import 'package:flutter_test/flutter_test.dart';\n$importLine",
  );
}

void _patchFile(String relativePath, String Function(String) transform) {
  final file = File(relativePath);
  if (!file.existsSync()) {
    stderr.writeln('Missing $relativePath');
    return;
  }
  final updated = transform(file.readAsStringSync());
  if (updated != file.readAsStringSync()) {
    file.writeAsStringSync(updated);
  }
}

PackSpec _vegas() {
  const hubLat = 36.1699;
  const hubLng = -115.1398;
  final districts = [
    DistrictSeed('las-vegas-strip', 'Las Vegas Strip', 'nightlife', 'Four-mile resort corridor — casinos, shows, and spectacle at every turn.', ['luxury', 'nightlife', 'entertainment'], ['couples', 'bucket-list', 'weekend'], 36.1147, -115.1728),
    DistrictSeed('downtown-las-vegas', 'Downtown Las Vegas', 'downtown', 'Classic Vegas energy beyond the Strip — murals, bars, and local rhythm.', ['local', 'nightlife', 'foodie'], ['foodies', 'budget', 'weekend'], 36.1673, -115.1484),
    DistrictSeed('fremont-street', 'Fremont Street', 'nightlife', 'Neon canopy, zip lines, and vintage Vegas under the Viva Vision screen.', ['nightlife', 'entertainment', 'budget'], ['friend-groups', 'weekend', 'nightlife'], 36.1705, -115.1435),
    DistrictSeed('arts-district', 'Arts District', 'arts', 'Gallery walks, cocktail bars, and creative dining south of downtown.', ['arts', 'foodie', 'local'], ['foodies', 'culture', 'couples'], 36.1550, -115.1520),
    DistrictSeed('summerlin', 'Summerlin', 'suburban', 'Master-planned west-side calm — golf, spas, and Red Rock access.', ['luxury', 'relaxing', 'local'], ['couples', 'luxury', 'wellness'], 36.1490, -115.3330),
    DistrictSeed('red-rock-area', 'Red Rock Area', 'other', 'Desert sandstone, scenic loops, and sunrise hikes minutes from the Strip.', ['desert', 'nature', 'adventure'], ['adventure', 'photo', 'wellness'], 36.1350, -115.4280),
    DistrictSeed('henderson', 'Henderson', 'suburban', 'Green Valley dining, locals-only casinos, and quieter resort pools.', ['local', 'family', 'foodie'], ['families', 'local', 'budget'], 36.0395, -115.0350),
    DistrictSeed('venetian-area', 'Venetian Area', 'resort', 'Grand canals, luxury shopping, and high-limit tables on the mid-Strip.', ['luxury', 'romantic', 'shopping'], ['couples', 'luxury', 'shopping'], 36.1212, -115.1697),
    DistrictSeed('bellagio-corridor', 'Bellagio Corridor', 'resort', 'Fountains, conservatory, and fine-dining icons on the central Strip.', ['luxury', 'romantic', 'iconic'], ['couples', 'luxury', 'bucket-list'], 36.1126, -115.1767),
    DistrictSeed('caesars-corridor', 'Caesars Corridor', 'resort', 'Roman spectacle, mega-mall energy, and show-residency central.', ['entertainment', 'luxury', 'shopping'], ['friend-groups', 'luxury', 'show'], 36.1162, -115.1745),
  ];
  return PackSpec(
    cityId: 'vegas',
    dartFolder: 'vegas',
    classPrefix: 'Vegas',
    displayName: 'Las Vegas',
    hubLabel: 'Las Vegas, NV',
    hubLat: hubLat,
    hubLng: hubLng,
    iapSuffix: 'vegas',
    stateId: 'nevada',
    isVegasPremium: true,
    tagline: 'Strip spectacle, residency shows, rooftop nights, and desert escapes — a Vegas insider concierge, not a generic travel app.',
    heroPhoto: 'eQ2ElhooTjc',
    districts: districts,
    moodRoutes: _vegasMoodRoutes(),
    restaurantStyles: _vegasRestaurants(),
    secretKinds: _vegasSecrets(),
    flagships: _vegasFlagships(),
    supportedCategories: [
      'hotel', 'dining', 'nightlife', 'show', 'casino', 'pool', 'shopping',
      'adventure', 'luxury', 'foodie', 'romantic', 'wellness', 'family',
    ],
  );
}

List<(String, List<String>)> _vegasMoodRoutes() => [
  ('First Time Vegas', ['first-time', 'iconic', 'strip', 'bucket-list']),
  ('Ultimate Vegas Weekend', ['weekend', 'high-energy', 'nightlife', 'show']),
  ('Luxury Vegas Escape', ['luxury', 'spa', 'fine-dining', 'couples']),
  ('Vegas On A Budget', ['budget', 'downtown', 'local', 'value']),
  ('Romantic Vegas', ['romantic', 'couples', 'fountains', 'fine-dining']),
  ('Bachelor Party Route', ['bachelor', 'nightlife', 'pool', 'high-energy']),
  ('Bachelorette Weekend', ['bachelorette', 'pool', 'show', 'nightlife']),
  ('Foodie Vegas', ['foodie', 'celebrity', 'fine-dining', 'local']),
  ('Hidden Vegas', ['hidden', 'speakeasy', 'local', 'off-strip']),
  ('Non-Gambling Vegas', ['no-casino', 'show', 'dining', 'wellness']),
  ('Family Vegas', ['family', 'daytime', 'show', 'attraction']),
  ('Show Lover Route', ['show', 'entertainment', 'evening', 'bucket-list']),
];

List<(String, List<String>)> _vegasRestaurants() => [
  ('Celebrity steakhouse', ['foodie', 'luxury', 'steak', 'evening']),
  ('Buffet icon', ['foodie', 'value', 'family', 'iconic']),
  ('Rooftop tasting menu', ['rooftop', 'luxury', 'romantic', 'views']),
  ('Speakeasy supper club', ['speakeasy', 'hidden', 'nightlife', 'foodie']),
  ('Late-night diner', ['late-night', 'local', 'budget', 'comfort']),
  ('Omakase counter', ['foodie', 'luxury', 'hidden', 'date-night']),
  ('Poolside cabana bites', ['pool', 'dayclub', 'summer', 'social']),
  ('Sportsbook grill', ['sportsbook', 'casual', 'social', 'game-day']),
  ('Vegas classic prime rib', ['iconic', 'foodie', 'historic', 'local']),
  ('Plant-based tasting', ['wellness', 'foodie', 'modern', 'local']),
  ('Dim sum lounge', ['foodie', 'nightlife', 'social', 'late-night']),
  ('Chef\'s table experience', ['luxury', 'foodie', 'bucket-list', 'evening']),
];

List<(String, String)> _vegasSecrets() => [
  ('Bellagio fountain viewing', 'Stand center-lawn 15 minutes before show — avoid rail crowds at the front edge'),
  ('Free attraction loop', 'Wildlife habitat, conservatory, and street performers — chain before 6 PM dinner rush'),
  ('Sportsbook strategy', 'Weekday afternoons on major games — comps and seats without weekend elbow wars'),
  ('Speakeasy entrance', 'Look for unmarked doors in Arts District alleys — reservations unlock the real room'),
  ('Casino side entrance', 'Use parking-garage connectors — skip Strip sidewalk bottle-neck at peak hours'),
  ('Late-night food', 'Off-Strip diners after 1 AM — locals beat Strip kitchen close times'),
  ('Parking validation', 'Garage ticket at partner restaurant — validate before leaving the property'),
  ('Fremont timing', 'Weeknight 9 PM canopy — full light show without Saturday shoulder crush'),
  ('Pool day window', 'Arrive 10 AM cabana check-in — beat heat index and secure shade'),
  ('Heat walk advisory', 'Use casino connectors Strip-to-Strip — never cross boulevard at 2 PM July'),
  ('Hydration pivot', 'Free water at sportsbooks and bars — ask politely at any active counter'),
  ('Desert excursion slot', 'Red Rock loop at sunrise — back before noon heat advisory kicks in'),
];

List<Flagship> _vegasFlagships() => [
  Flagship('place-bellagio-fountains', 'bellagio-fountains', 'Bellagio Fountains', 'adventure', 'eQ2ElhooTjc', 'Bellagio Corridor', 36.1126, -115.1767, 'Synchronized water ballet — the free Strip moment everyone remembers.', ['iconic', 'romantic', 'free', 'evening']),
  Flagship('place-fremont-street', 'fremont-street', 'Fremont Street Experience', 'adventure', 'RE1uPSyVuls', 'Fremont Street', 36.1705, -115.1435, 'Neon canopy, live bands, and vintage Vegas under one light show.', ['nightlife', 'budget', 'entertainment', 'iconic']),
  Flagship('place-caesars-palace', 'caesars-palace', 'Caesars Palace', 'adventure', 'xEaAoizNFV8', 'Caesars Corridor', 36.1162, -115.1745, 'Roman spectacle, celebrity chef row, and residency-show central.', ['luxury', 'show', 'shopping', 'iconic']),
  Flagship('place-the-venetian', 'the-venetian', 'The Venetian Resort', 'adventure', 'JZYQ_P94T-Q', 'Venetian Area', 36.1212, -115.1697, 'Grand canals, gondolas, and luxury shopping without leaving the Strip.', ['luxury', 'romantic', 'shopping', 'couples']),
  Flagship('place-red-rock-canyon', 'red-rock-canyon', 'Red Rock Canyon', 'nature', 'AK2vwEobto4', 'Red Rock Area', 36.1350, -115.4280, 'Sandstone loops and desert air — the essential non-Strip reset.', ['desert', 'nature', 'adventure', 'photo']),
  Flagship('place-high-roller', 'high-roller', 'High Roller Observation Wheel', 'adventure', 'X_LNSoZ7xeM', 'Las Vegas Strip', 36.1177, -115.1689, '550-foot views — book golden hour pods for Strip-wide color.', ['views', 'romantic', 'bucket-list', 'evening']),
  Flagship('place-sphere-experience', 'sphere-experience', 'Sphere Immersive Experience', 'adventure', 'sWK9wki5zHU', 'Las Vegas Strip', 36.1205, -115.1655, 'Next-gen dome spectacle — concierge seat selection matters here.', ['show', 'entertainment', 'bucket-list', 'iconic']),
  Flagship('place-arts-district-murals', 'arts-district-murals', 'Arts District Murals', 'adventure', 'M4RVCkMpb1I', 'Arts District', 36.1550, -115.1520, 'Gallery hops and mural walks — downtown\'s creative counterpoint to the Strip.', ['arts', 'local', 'walkable', 'foodie']),
  Flagship('place-wet-republic', 'wet-republic', 'Wet Republic Ultra Pool', 'adventure', 'pXe2PzLwVgA', 'Las Vegas Strip', 36.1020, -115.1740, 'Dayclub energy with DJ residencies — cabana timing is everything.', ['pool', 'dayclub', 'luxury', 'summer']),
  Flagship('place-downtown-circa', 'downtown-circa', 'Circa Resort & Stadium Swim', 'adventure', 'z78FxiNCA5w', 'Downtown Las Vegas', 36.1710, -115.1450, 'Stadium Swim and sportsbook scale — downtown\'s boldest new anchor.', ['sportsbook', 'pool', 'nightlife', 'entertainment']),
];

void _patchVegasWiring(Directory root) {
  _patchFile('lib/services/city_pack_registry.dart', (c) {
    c = _ensureImport(c, "import 'package:luxora_ai/data/vegas/vegas_content.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/data/vegas/vegas_hub.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/data/vegas/vegas_ticket_deals.dart';");
    if (!c.contains('_registerNevadaState')) {
      c = c.replaceFirst(
        '_registerFloridaState();',
        '_registerFloridaState();\n    _registerNevadaState();',
      );
    }
    if (!c.contains('_mergeVegasFromDartCatalog')) {
      c = c.replaceFirst(
        '_mergeDestin30aFromDartCatalog();',
        '_mergeDestin30aFromDartCatalog();\n    _mergeVegasFromDartCatalog();',
      );
    }
    if (!c.contains('void _registerNevadaState')) {
      c = c.replaceFirst(
        RegExp(r'\n\}\s*$'),
        _vegasRegistryMethods(),
      );
    }
    return c;
  });

  _patchFile('lib/data/iap_product_catalog.dart', (c) {
    if (!c.contains("'vegas'")) {
      c = c.replaceFirst(
        "'destin-30a'};",
        "'destin-30a', 'vegas'};",
      );
      c = c.replaceFirst(
        "'destin-30a': '\$_prefix.city.destin_30a',",
        "'destin-30a': '\$_prefix.city.destin_30a',\n    'vegas': '\$_prefix.city.vegas',",
      );
    }
    return c;
  });

  _patchFile('lib/data/city_content_catalog.dart', (c) {
    c = _ensureImport(c, "import 'package:luxora_ai/data/vegas/vegas_content.dart';");
    return _insertCityBranch(c, 'VegasContent', 'VegasContent');
  });

  _patchFile('lib/services/places_repository.dart', (c) {
    c = _ensureImport(c, "import 'package:luxora_ai/data/vegas/vegas_content.dart';");
    if (!c.contains('VegasContent.places')) {
      c = c.replaceFirst(
        'for (final p in TampaBayContent.places) {',
        'for (final p in VegasContent.places) {\n      _byId[p.id] = p;\n      _bySlug[p.slug] = p;\n    }\n    for (final p in TampaBayContent.places) {',
      );
    }
    return c;
  });

  for (final path in [
    'lib/services/hotel_intelligence_service.dart',
    'lib/services/stay_dining_catalog_service.dart',
  ]) {
    _patchFile(path, (c) {
      c = _ensureImport(c, "import 'package:luxora_ai/data/vegas/vegas_hotels_catalog.dart';");
      if (!c.contains('VegasHotelsCatalog')) {
        c = c.replaceFirst(
          'final tampaBay = TampaBayHotelsCatalog.all.where((h) => ids.contains(h.id));',
          'final vegas = VegasHotelsCatalog.all.where((h) => ids.contains(h.id));\n    final tampaBay = TampaBayHotelsCatalog.all.where((h) => ids.contains(h.id));',
        );
        c = c.replaceFirst(
          'return [...orlando, ...miami, ...keys, ...stAug, ...naplesHotels, ...destin, ...tampaBay]',
          'return [...orlando, ...miami, ...keys, ...stAug, ...naplesHotels, ...destin, ...vegas, ...tampaBay]',
        );
      }
      if (path.contains('hotel_intelligence') && !c.contains('VegasHotelsCatalog.byId')) {
        c = c.replaceFirst(
          'TampaBayHotelsCatalog.byId(id);',
          'VegasHotelsCatalog.byId(id) ??\n      TampaBayHotelsCatalog.byId(id);',
        );
      }
      return c;
    });
  }

  _patchFile('lib/data/ticket_deals_resolver.dart', (c) {
    c = _ensureImport(c, "import 'package:luxora_ai/data/vegas/vegas_ticket_deals.dart';");
    if (!c.contains("'vegas' => vegasTicketDealsCatalog")) {
      c = c.replaceFirst(
        "'tampa-bay' => tampaBayTicketDealsCatalog,",
        "'vegas' => vegasTicketDealsCatalog,\n      'tampa-bay' => tampaBayTicketDealsCatalog,",
      );
    }
    c = c.replaceFirst(
      "for (final cityId in ['orlando', 'miami', 'florida-keys', 'tampa-bay', 'st-augustine', 'naples', 'destin-30a'])",
      "for (final cityId in ['orlando', 'miami', 'florida-keys', 'tampa-bay', 'st-augustine', 'naples', 'destin-30a', 'vegas'])",
    );
    if (!c.contains('vegasTicketDealsCatalog')) {
      c = c.replaceFirst(
        'for (final d in tampaBayTicketDealsCatalog) {',
        'for (final d in vegasTicketDealsCatalog) {\n      if (d.id == id) return d;\n    }\n    for (final d in tampaBayTicketDealsCatalog) {',
      );
    }
    return c;
  });

  _patchFile('lib/screens/map/map_screen.dart', (c) {
    c = _ensureImport(c, "import 'package:luxora_ai/widgets/vegas/vegas_concierge_cards.dart';");
    if (!c.contains("'vegas'")) {
      c = c.replaceFirst(
        "if (CityPackRegistry.instance.active.cityId == 'tampa-bay') ...[",
        _mapPanelBlock('vegas', 'VegasMoodRoutesPanel') +
            "if (CityPackRegistry.instance.active.cityId == 'tampa-bay') ...[",
      );
    }
    return c;
  });

  _patchFile('lib/widgets/attraction_detail_sheet.dart', (c) {
    c = _ensureImport(c, "import 'package:luxora_ai/services/vegas_concierge_service.dart';");
    if (!c.contains('VegasBeachIntelligenceService')) {
      c = c.replaceFirst(
        'TampaBayBeachIntelligenceService.forPlace(place.id)',
        'VegasBeachIntelligenceService.forPlace(place.id) ??\n                    TampaBayBeachIntelligenceService.forPlace(place.id)',
      );
    }
    return c;
  });

  _patchFile('pubspec.yaml', (c) {
    if (!c.contains('city_pack_vegas.json')) {
      c = c.replaceFirst(
        'assets/city_packs/city_pack_tampa-bay.json',
        'assets/city_packs/city_pack_tampa-bay.json\n    - assets/city_packs/city_pack_vegas.json',
      );
    }
    return c;
  });
}

String _vegasRegistryMethods() => '''

  void _registerNevadaState() {
    registerStatePack(
      const StatePack(
        stateId: 'nevada',
        stateName: 'Nevada',
        heroImageUrl: 'eQ2ElhooTjc',
        destinationCount: 1,
        cityIds: ['vegas'],
      ),
    );
  }

  void _mergeVegasFromDartCatalog() {
    final existing = _cities['vegas'];
    final vegasPlaces = VegasContent.places;
    final vegasHotels = VegasContent.hotels;
    final vegas = CityPack(
      cityId: 'vegas',
      cityName: 'Las Vegas',
      stateId: 'nevada',
      description: existing?.description ??
          'Strip spectacle, residency shows, rooftop nights, and desert escapes — '
          'Vegas insider concierge for heat, shows, and high-energy planning.',
      heroImageUrl: existing?.heroImageUrl ?? 'eQ2ElhooTjc',
      mapCenterLat: VegasHub.latitude,
      mapCenterLng: VegasHub.longitude,
      hubLabel: VegasHub.label,
      supportedCategories: existing?.supportedCategories ??
          [
            'hotel',
            'dining',
            'nightlife',
            'show',
            'casino',
            'pool',
            'shopping',
            'luxury',
            'foodie',
            'romantic',
            'adventure',
            'wellness',
          ],
      featuredExperienceIds: vegasPlaces
          .where((p) => p.id.contains('-exp-'))
          .map((p) => p.id)
          .toList(),
      featuredHotelIds: vegasHotels.map((h) => h.placeId).toList(),
      featuredRestaurantIds: vegasPlaces
          .where((p) => p.category.name == 'dining')
          .map((p) => p.id)
          .toList(),
      featuredTicketDealIds:
          vegasTicketDealsCatalog.map((d) => d.id).toList(),
      featuredHotelIntelIds: vegasHotels.map((h) => h.id).toList(),
      districts: VegasContent.districts,
      experiences: const [],
      feedItemPlaceIds: VegasContent.feedItemPlaceIds,
      gemPlaceIds: VegasContent.gemPlaceIds,
      itineraryMomentPlaceIds: VegasContent.itineraryMomentPlaceIds,
      osmAssetPath: existing?.osmAssetPath,
      defaultRadiusMiles: 20,
      maxRadiusMiles: 60,
    );
    _cities['vegas'] = vegas;
  }
''';

PackSpec _nyc() {
  const hubLat = 40.7128;
  const hubLng = -74.0060;
  final districts = [
    DistrictSeed('midtown', 'Midtown', 'downtown', 'Theater District, museums, and classic Manhattan energy between Bryant Park and Rockefeller Center.', ['iconic', 'walkable', 'entertainment'], ['first-time', 'culture', 'shopping'], 40.7549, -73.9840),
    DistrictSeed('times-square', 'Times Square', 'nightlife', 'Neon crossroads, TKTS, and Broadway box offices — pulse of Midtown nights.', ['broadway', 'entertainment', 'iconic'], ['first-time', 'nightlife', 'weekend'], 40.7580, -73.9855),
    DistrictSeed('upper-east-side', 'Upper East Side', 'suburban', 'Museum Mile, brownstones, and Central Park east-side gates.', ['culture', 'luxury', 'walkable'], ['couples', 'museum', 'luxury'], 40.7736, -73.9566),
    DistrictSeed('upper-west-side', 'Upper West Side', 'suburban', 'Lincoln Center, Riverside Park, and neighborhood bodega rhythm.', ['culture', 'local', 'walkable'], ['families', 'culture', 'local'], 40.7870, -73.9754),
    DistrictSeed('soho', 'SoHo', 'arts', 'Cast-iron streets, gallery hops, and boutique dining below Houston.', ['shopping', 'foodie', 'walkable'], ['foodies', 'shopping', 'photo'], 40.7233, -73.9989),
    DistrictSeed('greenwich-village', 'Greenwich Village', 'arts', 'Winding lanes, jazz clubs, and Washington Square student energy.', ['culture', 'nightlife', 'local'], ['foodies', 'culture', 'nightlife'], 40.7336, -73.9967),
    DistrictSeed('chelsea', 'Chelsea', 'arts', 'High Line access, gallery district, and Hudson Yards skyline views.', ['walkable', 'photo', 'culture'], ['culture', 'photo', 'walkable'], 40.7465, -74.0014),
    DistrictSeed('financial-district', 'Financial District', 'downtown', 'Wall Street history, harbor views, and ferry connections downtown.', ['historic', 'walkable', 'iconic'], ['first-time', 'historic', 'photo'], 40.7075, -74.0113),
    DistrictSeed('tribeca', 'Tribeca', 'downtown', 'Film-festival streets, loft dining, and quiet cobblestone evenings.', ['luxury', 'foodie', 'local'], ['foodies', 'luxury', 'couples'], 40.7163, -74.0086),
    DistrictSeed('harlem', 'Harlem', 'downtown', 'Jazz heritage, soul food institutions, and Apollo legend.', ['culture', 'foodie', 'historic'], ['culture', 'foodie', 'local'], 40.8116, -73.9465),
    DistrictSeed('williamsburg', 'Williamsburg', 'arts', 'Brooklyn creative scene — waterfront parks, markets, and nightlife.', ['foodie', 'nightlife', 'local'], ['foodies', 'nightlife', 'local'], 40.7081, -73.9571),
    DistrictSeed('dumbo', 'DUMBO', 'downtown', 'Brooklyn Bridge views, cobblestones, and photo-perfect waterfront.', ['photo', 'walkable', 'iconic'], ['photo', 'couples', 'first-time'], 40.7033, -73.9896),
    DistrictSeed('brooklyn-heights', 'Brooklyn Heights', 'suburban', 'Promenade sunsets and brownstone calm above the East River.', ['walkable', 'romantic', 'local'], ['couples', 'walkable', 'local'], 40.6960, -73.9936),
    DistrictSeed('park-slope', 'Park Slope', 'suburban', 'Prospect Park access, family dining, and brownstone Brooklyn life.', ['family', 'local', 'walkable'], ['families', 'local', 'foodie'], 40.6710, -73.9814),
    DistrictSeed('long-island-city', 'Long Island City', 'downtown', 'Skyline views, MoMA PS1, and quick Manhattan subway hops.', ['photo', 'culture', 'walkable'], ['photo', 'culture', 'value'], 40.7447, -73.9485),
    DistrictSeed('astoria', 'Astoria', 'suburban', 'Greek tavernas, beer gardens, and Queens neighborhood authenticity.', ['foodie', 'local', 'nightlife'], ['foodies', 'local', 'nightlife'], 40.7720, -73.9301),
    DistrictSeed('yankee-stadium', 'Yankee Stadium Area', 'other', 'Bronx baseball culture, stadium energy, and Arthur Avenue nearby.', ['entertainment', 'local', 'historic'], ['families', 'sports', 'local'], 40.8296, -73.9262),
    DistrictSeed('ferry-district', 'Ferry District', 'other', 'Staten Island Ferry, harbor views, and a borough apart from Manhattan rush.', ['waterfront', 'photo', 'local'], ['first-time', 'photo', 'budget'], 40.6437, -74.0737),
  ];
  return PackSpec(
    cityId: 'nyc',
    dartFolder: 'nyc',
    classPrefix: 'Nyc',
    displayName: 'New York City',
    hubLabel: 'New York, NY',
    hubLat: hubLat,
    hubLng: hubLng,
    iapSuffix: 'nyc',
    stateId: 'new-york',
    isNycPremium: true,
    tagline: 'Five boroughs of walkable culture, Broadway nights, and subway-smart clusters — a New York insider concierge, not a generic travel app.',
    heroPhoto: 'xMMA_mtJ8xM',
    districts: districts,
    moodRoutes: _nycMoodRoutes(),
    restaurantStyles: _nycRestaurants(),
    secretKinds: _nycSecrets(),
    flagships: _nycFlagships(),
    supportedCategories: [
      'hotel', 'dining', 'nightlife', 'culture', 'adventure', 'luxury', 'foodie',
      'romantic', 'family', 'walkable', 'broadway', 'museum', 'park', 'rooftop',
      'historic', 'shopping', 'walking', 'photo', 'subway', 'market',
    ],
  );
}

List<(String, List<String>)> _nycMoodRoutes() => [
  ('First Time NYC', ['first-time', 'iconic', 'walkable', 'bucket-list']),
  ('Ultimate 3-Day NYC', ['efficient', 'cluster', 'subway', 'iconic']),
  ('Ultimate 5-Day NYC', ['exploration', 'boroughs', 'culture', 'foodie']),
  ('Romantic New York', ['romantic', 'couples', 'rooftop', 'evening']),
  ('Luxury New York', ['luxury', 'fine-dining', 'views', 'couples']),
  ('Foodie New York', ['foodie', 'market', 'local', 'walkable']),
  ('Hidden NYC', ['hidden', 'speakeasy', 'local', 'off-path']),
  ('Broadway Weekend', ['broadway', 'entertainment', 'weekend', 'evening']),
  ('Family NYC', ['family', 'park', 'museum', 'walkable']),
  ('Christmas in NYC', ['seasonal', 'holiday', 'iconic', 'romantic']),
  ('Rainy Day NYC', ['rainy-day', 'museum', 'indoor', 'subway']),
  ('Local New Yorker Route', ['local', 'subway', 'neighborhood', 'efficient']),
];

List<(String, List<String>)> _nycRestaurants() => [
  ('Classic NY slice shop', ['pizza', 'foodie', 'local', 'iconic']),
  ('Bagel & schmear counter', ['bagel', 'foodie', 'morning', 'local']),
  ('Chinatown dim sum hall', ['foodie', 'local', 'walkable', 'value']),
  ('Upscale tasting menu', ['luxury', 'foodie', 'evening', 'couples']),
  ('Deli sandwich institution', ['foodie', 'local', 'historic', 'iconic']),
  ('Rooftop cocktail bar', ['rooftop', 'nightlife', 'views', 'evening']),
  ('Speakeasy hidden entrance', ['speakeasy', 'hidden', 'nightlife', 'local']),
  ('Food hall crawl stop', ['market', 'foodie', 'walkable', 'local']),
  ('Italian red-sauce classic', ['foodie', 'historic', 'local', 'family']),
  ('Modern farm-to-table', ['foodie', 'local', 'walkable', 'date-night']),
  ('Halal cart legend', ['foodie', 'local', 'budget', 'late-night']),
  ('Jewish appetizing store', ['foodie', 'local', 'morning', 'historic']),
  ('Greek diner institution', ['foodie', 'local', 'budget', 'comfort']),
  ('Latin bodega comfort', ['foodie', 'local', 'budget', 'walkable']),
  ('Michelin omakase counter', ['luxury', 'foodie', 'hidden', 'evening']),
  ('Coal-oven Brooklyn pizza', ['pizza', 'foodie', 'local', 'iconic']),
  ('Broadway pre-show prix fixe', ['broadway', 'foodie', 'evening', 'efficient']),
  ('Smorgasburg-style vendor', ['market', 'foodie', 'weekend', 'local']),
];

List<(String, String)> _nycSecrets() => [
  ('Times Square strategy', 'Enter from 7th Ave side streets — avoid crossroads crush and keep sightlines open'),
  ('Subway express tip', 'Take express where lines overlap — skip local stops that double your cross-town time'),
  ('Observation deck timing', 'Book last slot before sunset — golden light without midday queue heat'),
  ('Hidden rooftop access', 'Hotel lobby elevators after 4 PM — quieter bars with skyline views locals use'),
  ('Central Park entrance', 'Use 72nd Street transverse — faster path to Bethesda without Columbus Circle crowds'),
  ('Broadway ticket strategy', 'TKTS same-day matinee line opens early — rush seats beat tourist markups'),
  ('Secret food location', 'Basement counters on side streets — no signage, long local lines only'),
  ('Tourist trap pivot', 'Walk one avenue east or west — same cuisine, half the wait and better value'),
  ('Cross-town bus shortcut', 'M34 SBS when subway requires two transfers — often faster crosstown'),
  ('Museum free hour', 'Pay-what-you-wish evenings — arrive 30 minutes before window closes'),
  ('Ferry golden hour', 'Staten Island Ferry outbound at sunset — free harbor loop without tour boat fees'),
  ('High Line sunrise', 'Gansevoort entrance at opening — empty walkway before Chelsea Market rush'),
  ('Brooklyn Bridge photo angle', 'Washington Street DUMBO — arrive before 8 AM for empty cobblestone frame'),
  ('Rain day subway hub', 'Grand Central food hall cluster — stay underground between museums and shows'),
  ('Borough day efficiency', 'Cluster Brooklyn Heights + DUMBO + bridge — one subway ride, zero backtracking'),
  ('Holiday window walk', 'Fifth Ave after 9 PM weekdays — full displays without shoulder-to-shoulder crush'),
];

List<Flagship> _nycFlagships() => [
  Flagship('place-statue-of-liberty', 'statue-of-liberty', 'Statue of Liberty & Ellis Island', 'adventure', 'xMMA_mtJ8xM', 'Financial District', 40.6892, -74.0445, 'Harbor icon and immigration history — ferry timing is everything.', ['iconic', 'historic', 'bucket-list', 'photo']),
  Flagship('place-empire-state', 'empire-state', 'Empire State Building', 'adventure', 'qQFzQyt2ur0', 'Midtown', 40.7484, -73.9857, 'Art Deco skyline views — concierge deck timing beats midday queues.', ['iconic', 'views', 'bucket-list', 'evening']),
  Flagship('place-central-park', 'central-park', 'Central Park', 'nature', 'V8YLE7LEjOY', 'Upper West Side', 40.7829, -73.9654, '843 acres of urban escape — enter smart, not at Columbus Circle.', ['park', 'walkable', 'family', 'local']),
  Flagship('place-met-museum', 'met-museum', 'The Metropolitan Museum of Art', 'adventure', 'JZYQ_P94T-Q', 'Upper East Side', 40.7794, -73.9632, 'World-class collections — rainy-day anchor with pay-what-you-wish windows.', ['museum', 'culture', 'rainy-day', 'iconic']),
  Flagship('place-times-square', 'times-square', 'Times Square', 'adventure', 'sWK9wki5zHU', 'Times Square', 40.7580, -73.9855, 'Neon heart of Manhattan — strategy beats wandering into tourist traps.', ['iconic', 'entertainment', 'first-time', 'evening']),
  Flagship('place-brooklyn-bridge', 'brooklyn-bridge', 'Brooklyn Bridge Walk', 'adventure', 'X_LNSoZ7xeM', 'DUMBO', 40.7061, -73.9969, 'Sunrise skyline crossing — Manhattan to DUMBO without backtracking.', ['iconic', 'walkable', 'photo', 'morning']),
  Flagship('place-one-world-observatory', 'one-world-observatory', 'One World Observatory', 'adventure', 'xEaAoizNFV8', 'Financial District', 40.7130, -74.0132, 'Downtown views and 9/11 Memorial proximity — cluster with FiDi walks.', ['views', 'historic', 'iconic', 'bucket-list']),
  Flagship('place-broadway-district', 'broadway-district', 'Broadway Theater District', 'adventure', 'RE1uPSyVuls', 'Times Square', 40.7590, -73.9845, 'Show-night energy — TKTS, rush seats, and pre-show dining clusters.', ['broadway', 'entertainment', 'evening', 'iconic']),
  Flagship('place-high-line', 'high-line', 'The High Line', 'nature', 'AK2vwEobto4', 'Chelsea', 40.7480, -74.0048, 'Elevated park walk — sunrise to Chelsea Market without street congestion.', ['park', 'walkable', 'photo', 'local']),
  Flagship('place-staten-island-ferry', 'staten-island-ferry', 'Staten Island Ferry', 'adventure', 'M4RVCkMpb1I', 'Ferry District', 40.6437, -74.0737, 'Free harbor cruise — Statue views without tour boat prices.', ['waterfront', 'budget', 'photo', 'iconic']),
];

void _patchNycWiring(Directory root) {
  _patchFile('lib/services/city_pack_registry.dart', (c) {
    c = _ensureImport(c, "import 'package:luxora_ai/data/nyc/nyc_content.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/data/nyc/nyc_hub.dart';");
    c = _ensureImport(c, "import 'package:luxora_ai/data/nyc/nyc_ticket_deals.dart';");
    if (!c.contains('_registerNewYorkState')) {
      c = c.replaceFirst(
        '_registerNevadaState();',
        '_registerNevadaState();\n    _registerNewYorkState();',
      );
    }
    if (!c.contains('_mergeNycFromDartCatalog')) {
      c = c.replaceFirst(
        '_mergeVegasFromDartCatalog();',
        '_mergeVegasFromDartCatalog();\n    _mergeNycFromDartCatalog();',
      );
    }
    if (!c.contains('void _registerNewYorkState')) {
      c = c.replaceFirst(
        RegExp(r'\n\}\s*$'),
        _nycRegistryMethods(),
      );
    }
    return c;
  });

  _patchFile('lib/data/iap_product_catalog.dart', (c) {
    if (!c.contains("'nyc'")) {
      c = c.replaceFirst(
        "'vegas'};",
        "'vegas', 'nyc'};",
      );
      c = c.replaceFirst(
        "'vegas': '\$_prefix.city.vegas',",
        "'vegas': '\$_prefix.city.vegas',\n    'nyc': '\$_prefix.city.nyc',",
      );
    }
    return c;
  });

  _patchFile('lib/data/city_content_catalog.dart', (c) {
    c = _ensureImport(c, "import 'package:luxora_ai/data/nyc/nyc_content.dart';");
    return _insertCityBranch(c, 'NycContent', 'NycContent');
  });

  _patchFile('lib/services/places_repository.dart', (c) {
    c = _ensureImport(c, "import 'package:luxora_ai/data/nyc/nyc_content.dart';");
    if (!c.contains('NycContent.places')) {
      c = c.replaceFirst(
        'for (final p in VegasContent.places) {',
        'for (final p in NycContent.places) {\n      _byId[p.id] = p;\n      _bySlug[p.slug] = p;\n    }\n    for (final p in VegasContent.places) {',
      );
    }
    return c;
  });

  for (final path in [
    'lib/services/hotel_intelligence_service.dart',
    'lib/services/stay_dining_catalog_service.dart',
  ]) {
    _patchFile(path, (c) {
      c = _ensureImport(c, "import 'package:luxora_ai/data/nyc/nyc_hotels_catalog.dart';");
      if (!c.contains('NycHotelsCatalog')) {
        c = c.replaceFirst(
          'final vegas = VegasHotelsCatalog.all.where((h) => ids.contains(h.id));',
          'final nyc = NycHotelsCatalog.all.where((h) => ids.contains(h.id));\n    final vegas = VegasHotelsCatalog.all.where((h) => ids.contains(h.id));',
        );
        c = c.replaceFirst(
          'return [...orlando, ...miami, ...keys, ...stAug, ...naplesHotels, ...destin, ...vegas, ...tampaBay]',
          'return [...orlando, ...miami, ...keys, ...stAug, ...naplesHotels, ...destin, ...nyc, ...vegas, ...tampaBay]',
        );
      }
      if (path.contains('hotel_intelligence') && !c.contains('NycHotelsCatalog.byId')) {
        c = c.replaceFirst(
          'VegasHotelsCatalog.byId(id) ??',
          'NycHotelsCatalog.byId(id) ??\n      VegasHotelsCatalog.byId(id) ??',
        );
      }
      return c;
    });
  }

  _patchFile('lib/data/ticket_deals_resolver.dart', (c) {
    c = _ensureImport(c, "import 'package:luxora_ai/data/nyc/nyc_ticket_deals.dart';");
    if (!c.contains("'nyc' => nycTicketDealsCatalog")) {
      c = c.replaceFirst(
        "'vegas' => vegasTicketDealsCatalog,",
        "'nyc' => nycTicketDealsCatalog,\n      'vegas' => vegasTicketDealsCatalog,",
      );
    }
    c = c.replaceFirst(
      "for (final cityId in ['orlando', 'miami', 'florida-keys', 'tampa-bay', 'st-augustine', 'naples', 'destin-30a', 'vegas'])",
      "for (final cityId in ['orlando', 'miami', 'florida-keys', 'tampa-bay', 'st-augustine', 'naples', 'destin-30a', 'nyc', 'vegas'])",
    );
    if (!c.contains('nycTicketDealsCatalog')) {
      c = c.replaceFirst(
        'for (final d in vegasTicketDealsCatalog) {',
        'for (final d in nycTicketDealsCatalog) {\n      if (d.id == id) return d;\n    }\n    for (final d in vegasTicketDealsCatalog) {',
      );
    }
    return c;
  });

  _patchFile('lib/screens/map/map_screen.dart', (c) {
    c = _ensureImport(c, "import 'package:luxora_ai/widgets/nyc/nyc_concierge_cards.dart';");
    if (!c.contains("'nyc'")) {
      c = c.replaceFirst(
        "if (CityPackRegistry.instance.active.cityId == 'vegas') ...[",
        _mapPanelBlock('nyc', 'NycMoodRoutesPanel') +
            "if (CityPackRegistry.instance.active.cityId == 'vegas') ...[",
      );
    }
    return c;
  });

  _patchFile('lib/widgets/attraction_detail_sheet.dart', (c) {
    c = _ensureImport(c, "import 'package:luxora_ai/services/nyc_concierge_service.dart';");
    if (!c.contains('NycBeachIntelligenceService')) {
      c = c.replaceFirst(
        'VegasBeachIntelligenceService.forPlace(place.id) ??',
        'NycBeachIntelligenceService.forPlace(place.id) ??\n                    VegasBeachIntelligenceService.forPlace(place.id) ??',
      );
    }
    return c;
  });

  _patchFile('pubspec.yaml', (c) {
    if (!c.contains('city_pack_nyc.json')) {
      c = c.replaceFirst(
        'assets/city_packs/city_pack_vegas.json',
        'assets/city_packs/city_pack_nyc.json\n    - assets/city_packs/city_pack_vegas.json',
      );
    }
    return c;
  });

  _patchFile('lib/data/local_secrets_registry.dart', (c) {
    if (!c.contains('localSecretNycTimesSquareStrategy')) {
      c = c.replaceFirst(
        "'fremont-street': 'localSecretVegasFremontTiming',",
        "'fremont-street': 'localSecretVegasFremontTiming',\n    'times-square': 'localSecretNycTimesSquareStrategy',\n    'empire-state': 'localSecretNycObservationDeck',\n    'central-park': 'localSecretNycCentralParkEntrance',\n    'brooklyn-bridge': 'localSecretNycBrooklynBridgePhoto',",
      );
      c = c.replaceFirst(
        "'place-the-venetian': 'localSecretVegasVenetianWalk',",
        "'place-the-venetian': 'localSecretVegasVenetianWalk',\n    'place-times-square': 'localSecretNycTimesSquareStrategy',\n    'place-empire-state': 'localSecretNycObservationDeck',\n    'place-central-park': 'localSecretNycCentralParkEntrance',\n    'place-broadway-district': 'localSecretNycBroadwayTickets',\n    'place-brooklyn-bridge': 'localSecretNycBrooklynBridgePhoto',\n    'place-staten-island-ferry': 'localSecretNycFerryGoldenHour',",
      );
    }
    return c;
  });

  _patchFile('lib/widgets/attraction_detail_sheet.dart', (c) {
    if (!c.contains('localSecretNycTimesSquareStrategy')) {
      c = c.replaceFirst(
        "'localSecretVegasVenetianWalk' => l.localSecretVegasVenetianWalk,",
        "'localSecretVegasVenetianWalk' => l.localSecretVegasVenetianWalk,\n    'localSecretNycTimesSquareStrategy' => l.localSecretNycTimesSquareStrategy,\n    'localSecretNycObservationDeck' => l.localSecretNycObservationDeck,\n    'localSecretNycCentralParkEntrance' => l.localSecretNycCentralParkEntrance,\n    'localSecretNycBroadwayTickets' => l.localSecretNycBroadwayTickets,\n    'localSecretNycBrooklynBridgePhoto' => l.localSecretNycBrooklynBridgePhoto,\n    'localSecretNycFerryGoldenHour' => l.localSecretNycFerryGoldenHour,",
      );
    }
    return c;
  });
}

String _nycRegistryMethods() => '''

  void _registerNewYorkState() {
    registerStatePack(
      const StatePack(
        stateId: 'new-york',
        stateName: 'New York',
        heroImageUrl: 'xMMA_mtJ8xM',
        destinationCount: 1,
        cityIds: ['nyc'],
      ),
    );
  }

  void _mergeNycFromDartCatalog() {
    final existing = _cities['nyc'];
    final nycPlaces = NycContent.places;
    final nycHotels = NycContent.hotels;
    final nyc = CityPack(
      cityId: 'nyc',
      cityName: 'New York City',
      stateId: 'new-york',
      description: existing?.description ??
          'Five boroughs of walkable culture, Broadway nights, and subway-smart clusters — '
          'New York insider concierge for crowds, weather, and efficient routing.',
      heroImageUrl: existing?.heroImageUrl ?? 'xMMA_mtJ8xM',
      mapCenterLat: NycHub.latitude,
      mapCenterLng: NycHub.longitude,
      hubLabel: NycHub.label,
      supportedCategories: existing?.supportedCategories ??
          [
            'hotel',
            'dining',
            'nightlife',
            'culture',
            'adventure',
            'luxury',
            'foodie',
            'romantic',
            'family',
            'walkable',
            'broadway',
            'museum',
            'park',
            'rooftop',
            'historic',
            'shopping',
            'walking',
            'photo',
            'subway',
            'market',
          ],
      featuredExperienceIds: nycPlaces
          .where((p) => p.id.contains('-exp-'))
          .map((p) => p.id)
          .toList(),
      featuredHotelIds: nycHotels.map((h) => h.placeId).toList(),
      featuredRestaurantIds: nycPlaces
          .where((p) => p.category.name == 'dining')
          .map((p) => p.id)
          .toList(),
      featuredTicketDealIds:
          nycTicketDealsCatalog.map((d) => d.id).toList(),
      featuredHotelIntelIds: nycHotels.map((h) => h.id).toList(),
      districts: NycContent.districts,
      experiences: const [],
      feedItemPlaceIds: NycContent.feedItemPlaceIds,
      gemPlaceIds: NycContent.gemPlaceIds,
      itineraryMomentPlaceIds: NycContent.itineraryMomentPlaceIds,
      osmAssetPath: existing?.osmAssetPath,
      defaultRadiusMiles: 15,
      maxRadiusMiles: 40,
    );
    _cities['nyc'] = nyc;
  }
''';

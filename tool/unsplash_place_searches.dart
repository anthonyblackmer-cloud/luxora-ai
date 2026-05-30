// Shared Unsplash search queries — used by sync tool and documented for future AI matching.

/// Place catalog id → Unsplash search query (landscape).
const unsplashPlaceSearchQueries = <String, String>{
  'place-winter-park-rooftop': 'rooftop sunset luxury restaurant Orlando',
  'place-disney-night': 'Disney theme park night lights magic Orlando',
  'place-wellness-spa': 'luxury spa wellness citrus ritual Florida',
  'place-keys-sail': 'sailing catamaran turquoise ocean Florida keys',
  'place-springs-circuit': 'crystal springs Florida nature aerial emerald',
  'place-gulf-beach-clearing': 'Florida gulf beach sunset storm clearing',
  'place-wekiwa-springs': 'crystal clear spring Florida nature secret',
  'place-winter-park-courtyard': 'hidden courtyard wine bar candlelit outdoor',
  'place-mangrove-paddle': 'kayak mangrove sunset Florida nature',
  'place-mount-dora-porch': 'Mount Dora Florida lake sunset small town',
  'cover-romantic-sunset': 'couple sunset luxury travel romantic beach Florida',
  'cover-family-springs':
      'Florida family kayaking springs outdoors kids adventure sunshine',
  'cover-luxury-ocean': 'luxury resort pool ocean Miami beach Florida',
  'place-magic-kingdom': 'Disney castle theme park night Orlando',
  'place-universal-studios': 'Universal Studios Orlando roller coaster',
  'place-epcot': 'EPCOT fireworks world showcase night',
  'place-disney-springs': 'Disney Springs waterfront dining night',
  'place-lake-eola': 'Lake Eola park Orlando Florida sunset',
  'place-kennedy-space-center': 'Kennedy Space Center rocket launch Florida',
  'place-kelly-park-rock-springs': 'tubing crystal spring Florida clear water',
  'place-blue-spring-state-park': 'Blue Spring Florida manatee clear water',
  'place-clearwater-beach': 'Clearwater beach Florida sunset pier',
  'place-hollywood-studios': 'Disney Hollywood Studios Star Wars Orlando night',
  'place-animal-kingdom': 'Disney Animal Kingdom Pandora bioluminescent',
  'place-typhoon-lagoon': 'water park wave pool Florida tropical',
  'place-blizzard-beach': 'water slide ski theme park Florida',
  'place-volcano-bay': 'volcano water park tropical resort',
  'place-epic-universe': 'theme park futuristic Orlando night lights',
  'place-aquatica-orlando': 'water park slides tropical Florida',
  'place-busch-gardens-tampa': 'roller coaster safari Tampa Florida',
  'place-everglades-national-park': 'Everglades airboat alligator Florida',
  'place-st-augustine-historic': 'St Augustine historic street Florida',
  'place-south-beach': 'South Beach Miami Art Deco ocean',
  'place-vizcaya-museum': 'Vizcaya mansion garden Miami luxury',
  'place-silver-springs': 'glass bottom boat spring Florida clear water',
  'place-wild-florida': 'Florida airboat alligator nature',
  'place-orlando-science-center': 'science museum planetarium interior',
};

/// Mood / category tags → suggested search (future auto-matching).
const unsplashMoodSearchHints = <String, String>{
  'rooftop sunset': 'rooftop sunset luxury restaurant Orlando',
  'hidden spring': 'crystal springs Florida nature aerial secret',
  'romantic escape': 'couple sunset luxury travel aesthetic Florida',
  'family magic': 'Florida family theme park evening magic adventure',
  'family bonding': 'Florida family outdoors springs kayaking kids',
  'wellness': 'luxury spa wellness Florida retreat',
  'night magic': 'theme park night lights neon Orlando',
};

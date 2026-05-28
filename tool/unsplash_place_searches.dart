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
  'place-mount-dora-porch': 'lake porch rocking chair sunset Florida small town',
  'cover-romantic-sunset': 'couple sunset luxury travel romantic beach Florida',
  'cover-family-springs':
      'Florida family kayaking springs outdoors kids adventure sunshine',
  'cover-luxury-ocean': 'luxury resort pool ocean Miami beach Florida',
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

// Shared Unsplash search queries — used by sync tool and documented for future AI matching.

/// Place catalog id → Unsplash search query (landscape).
const unsplashPlaceSearchQueries = <String, String>{
  'dining-luma-on-park': 'Winter Park restaurant Park Avenue dining Florida',
  'dining-prato': 'Italian restaurant outdoor dining Winter Park Florida',
  'place-merritt-island-nwr': 'Merritt Island wildlife refuge Florida nature',
  'place-lakeside-inn-mount-dora': 'Mount Dora Florida lake historic inn porch',
  'place-spa-senses-grand-floridian': 'Disney Grand Floridian luxury spa massage',
  'place-spa-ritz-grande-lakes': 'Ritz Carlton Orlando spa pool luxury',
  'place-spa-jw-bonnet-creek': 'JW Marriott spa treatment room luxury Florida',
  'place-spa-waldorf-orlando': 'Waldorf Astoria spa luxury Orlando',
  'place-spa-four-seasons-orlando': 'Four Seasons spa treatment luxury resort',
  'place-woodhouse-winter-park': 'day spa massage relaxation luxury interior',
  'place-amore-domani-spa': 'organic spa facial massage calm room',
  'place-salt-room-orlando': 'salt therapy halotherapy wellness room',
  'place-kadol-yoga-winter-park': 'yoga studio morning light wellness',
  'place-heavenly-spa-westin-bonnet': 'hotel spa massage relaxation luxury',
  'place-wekiwa-springs': 'crystal clear spring Florida nature secret',
  'place-cocoa-beach-pier': 'Cocoa Beach pier Atlantic sunset Florida',
  'cover-romantic-sunset': 'couple sunset luxury travel romantic beach Florida',
  'cover-family-springs':
      'Florida family kayaking springs outdoors kids adventure sunshine',
  'cover-luxury-ocean': 'luxury resort pool ocean Miami beach Florida',
  'place-magic-kingdom': 'Disney castle theme park night Orlando',
  'place-universal-studios': 'Universal Studios Orlando roller coaster',
  'place-epcot': 'EPCOT fireworks world showcase night',
  'place-disney-springs': 'Disney Springs waterfront dining night',
  'place-lake-eola': 'Lake Eola park Orlando Florida sunset swan boats',
  'place-icon-park': 'ICON Park Orlando observation wheel International Drive',
  'place-fun-spot-orlando': 'Fun Spot America Orlando roller coaster lights',
  'place-fun-spot-kissimmee': 'Fun Spot America Kissimmee SkyCoaster Florida',
  'dining-knife-and-spoon': 'luxury steakhouse fine dining Orlando Ritz',
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

/// Orlando flagship stays — venue-specific hero searches (place id = [LuxPlace.id]).
const unsplashOrlandoHotelQueries = <String, String>{
  'hotel-grand-floridian': 'luxury Victorian resort pool palm trees Florida',
  'hotel-four-seasons-orlando': 'luxury resort pool palm trees Orlando Florida',
  'hotel-waldorf-astoria-orlando': 'luxury golf resort pool Bonnet Creek Florida',
  'hotel-ritz-carlton-grande-lakes': 'luxury lakefront resort spa pool Florida',
  'hotel-loews-portofino-bay': 'Mediterranean resort harbor pool palm Florida',
  'hotel-gaylord-palms': 'glass atrium hotel palm trees indoor garden Florida',
  'hotel-animal-kingdom-lodge': 'safari lodge resort savanna sunset Africa hotel',
  'hotel-hyatt-regency-grand-cypress': 'lagoon resort pool golf Florida palm trees',
  'hotel-almanac-winter-park': 'boutique hotel courtyard art gallery Florida',
  'hotel-lake-nona-wave': 'modern luxury hotel pool architecture night lights',
  'hotel-idrive-clarion': 'Orlando hotel swimming pool palm trees resort',
};

/// Miami flagship stays — venue-specific hero searches.
const unsplashMiamiHotelQueries = <String, String>{
  'hotel-fontainebleau-miami': 'Fontainebleau Miami Beach hotel pool iconic',
  'hotel-1-hotel-south-beach': 'eco luxury hotel rooftop pool ocean Miami',
  'hotel-faena-miami-beach': 'luxury hotel lobby art deco Miami Beach',
  'hotel-w-south-beach': 'modern hotel pool lounge Miami Beach',
  'hotel-four-seasons-surf-club': 'luxury beach resort pool palm Miami',
  'hotel-betsy-south-beach': 'oceanfront boutique hotel balcony Miami Beach',
};

/// All hotel sync targets (Orlando + Miami curated stays).
Map<String, String> get unsplashHotelAllQueries => {
      ...unsplashOrlandoHotelQueries,
      ...unsplashMiamiHotelQueries,
    };

/// Florida Keys flagship places — venue-specific hero searches.
const unsplashFloridaKeysPlaceQueries = <String, String>{
  'place-keys-pennekamp': 'John Pennekamp coral reef snorkel Key Largo',
  'place-keys-molasses-reef': 'Molasses Reef diving Florida keys turquoise',
  'place-keys-bahia-honda': 'Bahia Honda State Park beach Florida keys',
  'place-keys-seven-mile-bridge': 'Seven Mile Bridge Florida keys overseas highway',
  'place-keys-robbies-marina': 'Islamorada marina tarpon dock Florida keys',
  'place-keys-theater-of-the-sea': 'Islamorada marine aquarium lagoon Florida keys',
  'place-keys-mallory-square': 'Mallory Square Key West sunset celebration',
  'place-keys-duval-street': 'Key West street palm trees Florida nightlife',
  'place-keys-fort-zachary': 'Fort Zachary Taylor beach Key West',
  'place-keys-dry-tortugas': 'Dry Tortugas Fort Jefferson Florida aerial',
  'place-keys-hemingway-home': 'Key West historic tropical house garden',
  'place-keys-southernmost': 'Southernmost Point buoy Key West',
  'place-keys-hogfish-bar': 'Florida keys waterfront seafood dock restaurant',
  'place-keys-latitudes': 'Sunset Key private island dinner Florida',
  'place-keys-louies-backyard': 'Key West oceanfront dining sunset Florida',
  'place-keys-key-largo-fishing': 'Key Largo sportfishing charter marina',
  'place-keys-marathon-turtle-hospital': 'sea turtle rescue Florida keys',
  'place-keys-big-pine-key-deer': 'Key deer Big Pine Key Florida nature',
  'place-keys-sombrero-beach': 'Sombrero Beach Marathon Florida keys',
  'place-keys-key-west-harbor': 'Key West historic seaport boats sunset',
};

/// Rotating photo pool for bulk-generated Keys dining, hotels, and experiences.
/// Order matches [FloridaKeysContent] `_photos` slots.
const unsplashKeysPhotoPoolQueries = <String, String>{
  'pool-keys-tropical': 'Florida keys turquoise ocean reef aerial',
  'pool-keys-beach': 'Florida keys white sand beach palm trees',
  'pool-keys-bridge': 'Overseas Highway bridge Florida keys sunset',
  'pool-keys-marina': 'Islamorada marina boats dock Florida keys',
  'pool-keys-dining': 'waterfront seafood restaurant Florida keys sunset',
  'pool-keys-island': 'remote tropical island fort ocean Florida',
  'pool-keys-nature': 'mangrove kayak wildlife Florida keys',
  'pool-keys-sunset': 'Key West sunset celebration waterfront',
  'pool-keys-street': 'Key West architecture street palm Florida',
  'pool-keys-water': 'snorkeling clear water Florida keys reef',
};

/// Ordered pool keys — keep in sync with `_photos` in florida_keys_content.dart.
const unsplashKeysPhotoPoolOrder = [
  'pool-keys-tropical',
  'pool-keys-beach',
  'pool-keys-bridge',
  'pool-keys-marina',
  'pool-keys-dining',
  'pool-keys-island',
  'pool-keys-nature',
  'pool-keys-sunset',
  'pool-keys-street',
  'pool-keys-water',
];

/// All Keys sync targets (flagship + pool).
Map<String, String> get unsplashFloridaKeysAllQueries => {
      ...unsplashFloridaKeysPlaceQueries,
      ...unsplashKeysPhotoPoolQueries,
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

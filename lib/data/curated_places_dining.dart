import 'package:luxora_ai/models/lux_place.dart';

/// Expanded curated dining — higher-end, notable, and "gem" Orlando-area
/// restaurants beyond the original flagship set.
///
/// Coordinates are neighborhood/venue-accurate but approximate; verify (or
/// replace this whole file) when the live POI import lands. Menus are layered
/// separately in lib/data/restaurant_menus.dart and can be filled in over time.
abstract final class _Photo {
  static const fineDining = 'xEaAoizNFV8';
  static const dining = 'JZYQ_P94T-Q';
  static const rooftop = 'p0vZplFhKYI';
  static const cozy = 'RibghBxKlKc';
}

const curatedPlacesDining = <LuxPlace>[
  // ═══ Fine dining / special occasion ═══
  LuxPlace(
    id: 'dining-normans',
    slug: 'normans-ritz-carlton-grande-lakes',
    title: "Norman's",
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.fineDining,
    location: '4012 Central Florida Pkwy, Orlando, FL',
    latitude: 28.4015,
    longitude: -81.4378,
    description:
        'Chef Norman Van Aken’s New World cuisine at the Ritz-Carlton — a refined tasting-menu landmark.',
    moodTags: ['luxury', 'romantic', 'foodie'],
    sortOrder: 130,
  ),
  LuxPlace(
    id: 'dining-knife-and-spoon',
    slug: 'knife-and-spoon-grande-lakes',
    title: 'Knife & Spoon',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.fineDining,
    location: '4012 Central Florida Pkwy, Orlando, FL',
    latitude: 28.4018,
    longitude: -81.4382,
    description:
        'John Tesar’s steak-and-seafood room at the Ritz-Carlton — dry-aged beef and raw-bar towers.',
    moodTags: ['luxury', 'romantic', 'foodie'],
    sortOrder: 131,
  ),
  LuxPlace(
    id: 'dining-christners',
    slug: 'christners-prime-steak-lobster',
    title: "Christner's Prime Steak & Lobster",
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.fineDining,
    location: '729 Lee Rd, Orlando, FL',
    latitude: 28.6020,
    longitude: -81.3955,
    description:
        'Family-owned classic steakhouse — white-tablecloth service and Orlando’s old-guard special-occasion pick.',
    moodTags: ['luxury', 'foodie', 'romantic'],
    sortOrder: 132,
  ),
  LuxPlace(
    id: 'dining-capital-grille-millenia',
    slug: 'capital-grille-mall-at-millenia',
    title: 'The Capital Grille',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.fineDining,
    location: '4200 Conroy Rd, Orlando, FL',
    latitude: 28.4855,
    longitude: -81.4358,
    description:
        'Polished steakhouse at the Mall at Millenia — dry-aged steaks and a deep wine list.',
    moodTags: ['luxury', 'foodie'],
    sortOrder: 133,
  ),
  LuxPlace(
    id: 'dining-eddie-v-sand-lake',
    slug: 'eddie-v-prime-seafood-sand-lake',
    title: "Eddie V's Prime Seafood",
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.fineDining,
    location: '7488 W Sand Lake Rd, Orlando, FL',
    latitude: 28.4498,
    longitude: -81.4905,
    description:
        'Restaurant Row seafood and steaks with nightly live jazz in the V Lounge.',
    moodTags: ['luxury', 'romantic', 'foodie'],
    sortOrder: 134,
  ),
  LuxPlace(
    id: 'dining-christinis',
    slug: 'christinis-ristorante-italiano',
    title: 'Christini’s Ristorante Italiano',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.fineDining,
    location: '7600 Dr Phillips Blvd, Orlando, FL',
    latitude: 28.4530,
    longitude: -81.4900,
    description:
        'Long-running upscale Italian — tableside service, strolling music, and old-world romance.',
    moodTags: ['luxury', 'romantic', 'foodie'],
    sortOrder: 135,
  ),

  // ═══ Disney / resort signature dining ═══
  LuxPlace(
    id: 'dining-california-grill',
    slug: 'california-grill-contemporary',
    title: 'California Grill',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.rooftop,
    location: "Disney's Contemporary Resort, Lake Buena Vista, FL",
    latitude: 28.4150,
    longitude: -81.5742,
    description:
        '15th-floor rooftop dining over Magic Kingdom — time your table to the fireworks.',
    moodTags: ['luxury', 'romantic', 'foodie', 'sunset'],
    sortOrder: 136,
  ),
  LuxPlace(
    id: 'dining-narcoossees',
    slug: 'narcoossees-grand-floridian',
    title: "Narcoossee's",
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.rooftop,
    location: '4401 Floridian Way, Lake Buena Vista, FL',
    latitude: 28.4098,
    longitude: -81.5882,
    description:
        'Lakefront seafood at the Grand Floridian — waterside fireworks views from the veranda.',
    moodTags: ['luxury', 'romantic', 'foodie'],
    sortOrder: 137,
  ),
  LuxPlace(
    id: 'dining-homecomin',
    slug: 'chef-art-smith-homecomin',
    title: "Chef Art Smith's Homecomin'",
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.dining,
    location: '1602 E Buena Vista Dr, Disney Springs, FL',
    latitude: 28.3706,
    longitude: -81.5182,
    description:
        'Farm-to-fork Southern comfort at Disney Springs — fried chicken, biscuits, and moonshine cocktails.',
    moodTags: ['foodie', 'family', 'trending'],
    sortOrder: 138,
  ),
  LuxPlace(
    id: 'dining-jaleo',
    slug: 'jaleo-jose-andres-disney-springs',
    title: 'Jaleo by José Andrés',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.dining,
    location: '1482 Buena Vista Dr, Disney Springs, FL',
    latitude: 28.3701,
    longitude: -81.5147,
    description:
        'José Andrés’ Spanish tapas and paella at Disney Springs — vibrant, shareable, and lively.',
    moodTags: ['foodie', 'trending', 'luxury'],
    sortOrder: 139,
  ),

  // ═══ Local gems & neighborhood favorites ═══
  LuxPlace(
    id: 'dining-luma-on-park',
    slug: 'luma-on-park-winter-park',
    title: 'Luma on Park',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.cozy,
    location: '290 S Park Ave, Winter Park, FL',
    latitude: 28.5945,
    longitude: -81.3510,
    description:
        'Modern American on Park Avenue — seasonal menu and a serious wine program in the heart of Winter Park.',
    moodTags: ['foodie', 'romantic', 'trending'],
    sortOrder: 140,
  ),
  LuxPlace(
    id: 'dining-osprey-tavern',
    slug: 'the-osprey-tavern-baldwin-park',
    title: 'The Osprey Tavern',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.cozy,
    location: '4899 New Broad St, Orlando, FL',
    latitude: 28.5663,
    longitude: -81.3360,
    description:
        'Buzzy Baldwin Park gastro-tavern — wood-fired plates, craft cocktails, and a handsome bar.',
    moodTags: ['foodie', 'trending', 'hidden'],
    sortOrder: 141,
  ),
  LuxPlace(
    id: 'dining-soco-thornton-park',
    slug: 'soco-thornton-park',
    title: 'SOCO',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.cozy,
    location: '629 E Central Blvd, Orlando, FL',
    latitude: 28.5410,
    longitude: -81.3680,
    description:
        'Elevated Southern comfort in Thornton Park — shrimp and grits, fried green tomatoes, patio energy.',
    moodTags: ['foodie', 'romantic', 'hidden'],
    sortOrder: 142,
  ),
  LuxPlace(
    id: 'dining-dovecote',
    slug: 'dovecote-brasserie-downtown',
    title: 'DOVECOTE',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.cozy,
    location: '390 N Orange Ave, Orlando, FL',
    latitude: 28.5462,
    longitude: -81.3795,
    description:
        'Downtown French brasserie — steak frites, raw bar, and an airy all-day room.',
    moodTags: ['foodie', 'romantic', 'trending'],
    sortOrder: 143,
  ),
  LuxPlace(
    id: 'dining-reyes-mezcaleria',
    slug: 'reyes-mezcaleria',
    title: 'Reyes Mezcalería',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.dining,
    location: '821 N Orange Ave, Orlando, FL',
    latitude: 28.5530,
    longitude: -81.3790,
    description:
        'Modern Mexican and mezcal in the Ivanhoe Village — masa-forward cooking and great cocktails.',
    moodTags: ['foodie', 'trending', 'hidden'],
    sortOrder: 144,
  ),
  LuxPlace(
    id: 'dining-the-boheme',
    slug: 'the-boheme-grand-bohemian',
    title: 'The Boheme',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.fineDining,
    location: '325 S Orange Ave, Orlando, FL',
    latitude: 28.5392,
    longitude: -81.3782,
    description:
        'Art-filled fine dining inside the Grand Bohemian Hotel — known for its Sunday jazz brunch.',
    moodTags: ['luxury', 'romantic', 'foodie'],
    sortOrder: 145,
  ),
  LuxPlace(
    id: 'dining-maxines-on-shine',
    slug: 'maxines-on-shine',
    title: "Maxine's on Shine",
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.cozy,
    location: '337 N Shine Ave, Orlando, FL',
    latitude: 28.5430,
    longitude: -81.3625,
    description:
        'Quirky, beloved neighborhood bistro near Lake Eola — comfort plates and a regulars’ welcome.',
    moodTags: ['foodie', 'hidden', 'romantic'],
    sortOrder: 146,
  ),
  LuxPlace(
    id: 'dining-pig-floyds',
    slug: 'pig-floyds-urban-barbakoa',
    title: "Pig Floyd's Urban Barbakoa",
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.dining,
    location: '1326 N Mills Ave, Orlando, FL',
    latitude: 28.5628,
    longitude: -81.3667,
    description:
        'Global barbecue mashup in Mills 50 — smoked brisket, tacos, and bold cross-cultural plates.',
    moodTags: ['foodie', 'hidden', 'trending'],
    sortOrder: 147,
  ),
  LuxPlace(
    id: 'dining-domu',
    slug: 'domu-east-end-market',
    title: 'DOMU',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.dining,
    location: '3201 Corrine Dr, Orlando, FL',
    latitude: 28.5660,
    longitude: -81.3500,
    description:
        'Cult ramen at Audubon Park’s East End Market — rich bowls and a constant happy line.',
    moodTags: ['foodie', 'hidden', 'trending'],
    sortOrder: 148,
  ),
  LuxPlace(
    id: 'dining-kadence',
    slug: 'kadence-omakase',
    title: 'Kadence',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.fineDining,
    location: '1809 E Winter Park Rd, Orlando, FL',
    latitude: 28.5705,
    longitude: -81.3470,
    description:
        'Tiny Audubon Park omakase counter — a handful of seats and one of the city’s hardest reservations.',
    moodTags: ['luxury', 'foodie', 'hidden'],
    sortOrder: 149,
  ),
  LuxPlace(
    id: 'dining-bosphorous',
    slug: 'bosphorous-turkish-cuisine-winter-park',
    title: 'Bosphorous Turkish Cuisine',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.dining,
    location: '108 S Park Ave, Winter Park, FL',
    latitude: 28.5985,
    longitude: -81.3510,
    description:
        'Park Avenue Turkish favorite — table-stretching lavash bread, kebabs, and mezze.',
    moodTags: ['foodie', 'family', 'trending'],
    sortOrder: 150,
  ),
  LuxPlace(
    id: 'dining-black-bean-deli',
    slug: 'black-bean-deli-winter-park',
    title: 'Black Bean Deli',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.dining,
    location: '1835 E Colonial Dr, Orlando, FL',
    latitude: 28.5530,
    longitude: -81.3470,
    description:
        'No-frills Cuban gem — pressed sandwiches, croquetas, and the city’s go-to medianoche.',
    moodTags: ['foodie', 'hidden', 'family'],
    sortOrder: 151,
  ),
];

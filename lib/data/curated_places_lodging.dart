import 'package:luxora_ai/models/lux_place.dart';

/// Curated hotels and restaurants — first-class catalog entries.
///
/// Hotels can be set as a trip "home base" so route optimization starts there
/// instead of the generic Orlando hub. Restaurants surface as discoverable,
/// savable, routable stops alongside attractions.
///
/// Unsplash ids reuse the curated placeholder set until synced via
/// `tool/sync_unsplash_curated.dart`.
abstract final class _Photo {
  static const luxuryStay = 'xEaAoizNFV8';
  static const resort = 'z78FxiNCA5w';
  static const dining = 'JZYQ_P94T-Q';
  static const courtyard = 'RibghBxKlKc';
  static const rooftop = 'p0vZplFhKYI';
}

const curatedPlacesLodging = <LuxPlace>[
  // ═══ Flagship hotels / resorts (home-base candidates) ═══
  LuxPlace(
    id: 'hotel-grand-floridian',
    slug: 'disneys-grand-floridian-resort-spa',
    title: "Disney's Grand Floridian Resort & Spa",
    category: LuxPlaceCategory.hotel,
    unsplashPhotoId: _Photo.luxuryStay,
    location: '4401 Floridian Way, Lake Buena Vista, FL',
    latitude: 28.4108,
    longitude: -81.5866,
    description:
        'Victorian-era flagship on the monorail loop — Magic Kingdom views and white-glove service.',
    moodTags: ['luxury', 'family', 'romantic', 'iconic'],
    sortOrder: 100,
  ),
  LuxPlace(
    id: 'hotel-four-seasons-orlando',
    slug: 'four-seasons-resort-orlando',
    title: 'Four Seasons Resort Orlando',
    category: LuxPlaceCategory.hotel,
    unsplashPhotoId: _Photo.luxuryStay,
    location: '10100 Dream Tree Blvd, Lake Buena Vista, FL',
    latitude: 28.3919,
    longitude: -81.5566,
    description:
        'Golden Oak luxury with a rooftop steakhouse and the best family pool complex near Disney.',
    moodTags: ['luxury', 'family', 'wellness', 'romantic'],
    sortOrder: 101,
  ),
  LuxPlace(
    id: 'hotel-waldorf-astoria-orlando',
    slug: 'waldorf-astoria-orlando',
    title: 'Waldorf Astoria Orlando',
    category: LuxPlaceCategory.hotel,
    unsplashPhotoId: _Photo.luxuryStay,
    location: '14200 Bonnet Creek Resort Ln, Orlando, FL',
    latitude: 28.3556,
    longitude: -81.5310,
    description:
        'Bonnet Creek elegance — championship golf, a serene spa, and a quieter base near the parks.',
    moodTags: ['luxury', 'wellness', 'romantic'],
    sortOrder: 102,
  ),
  LuxPlace(
    id: 'hotel-ritz-carlton-grande-lakes',
    slug: 'ritz-carlton-orlando-grande-lakes',
    title: 'The Ritz-Carlton Orlando, Grande Lakes',
    category: LuxPlaceCategory.hotel,
    unsplashPhotoId: _Photo.luxuryStay,
    location: '4012 Central Florida Pkwy, Orlando, FL',
    latitude: 28.4012,
    longitude: -81.4376,
    description:
        'Lakefront resort with a 40,000 sq ft spa and a lazy river — refined calm off I-Drive.',
    moodTags: ['luxury', 'wellness', 'relaxing'],
    sortOrder: 103,
  ),
  LuxPlace(
    id: 'hotel-loews-portofino-bay',
    slug: 'loews-portofino-bay-hotel',
    title: "Loews Portofino Bay Hotel",
    category: LuxPlaceCategory.hotel,
    unsplashPhotoId: _Photo.resort,
    location: '5601 Universal Blvd, Orlando, FL',
    latitude: 28.4727,
    longitude: -81.4699,
    description:
        'Italian-riviera theming at Universal — Express Unlimited perks and water-taxi to the parks.',
    moodTags: ['family', 'luxury', 'trending'],
    sortOrder: 104,
  ),
  LuxPlace(
    id: 'hotel-gaylord-palms',
    slug: 'gaylord-palms-resort-kissimmee',
    title: 'Gaylord Palms Resort & Convention Center',
    category: LuxPlaceCategory.hotel,
    unsplashPhotoId: _Photo.resort,
    location: '6000 W Osceola Pkwy, Kissimmee, FL',
    latitude: 28.3392,
    longitude: -81.5350,
    description:
        'Glass-atrium gardens and a sprawling water park — a destination resort south of Disney.',
    moodTags: ['family', 'relaxing'],
    sortOrder: 105,
  ),
  LuxPlace(
    id: 'hotel-animal-kingdom-lodge',
    slug: 'disneys-animal-kingdom-lodge',
    title: "Disney's Animal Kingdom Lodge",
    category: LuxPlaceCategory.hotel,
    unsplashPhotoId: _Photo.resort,
    location: '2901 Osceola Pkwy, Lake Buena Vista, FL',
    latitude: 28.3553,
    longitude: -81.6020,
    description:
        'Savanna-view rooms with roaming wildlife — African-inspired dining and a true safari hush.',
    moodTags: ['family', 'nature', 'romantic'],
    sortOrder: 106,
  ),
  LuxPlace(
    id: 'hotel-hyatt-regency-grand-cypress',
    slug: 'hyatt-regency-grand-cypress',
    title: 'Hyatt Regency Grand Cypress',
    category: LuxPlaceCategory.hotel,
    unsplashPhotoId: _Photo.resort,
    location: '1 Grand Cypress Blvd, Orlando, FL',
    latitude: 28.3829,
    longitude: -81.5170,
    description:
        'Half-acre pool with grottoes and a private lake — relaxed resort base minutes from Disney.',
    moodTags: ['family', 'relaxing', 'wellness'],
    sortOrder: 107,
  ),
  LuxPlace(
    id: 'hotel-almanac-winter-park',
    slug: 'the-alfond-inn-winter-park',
    title: 'The Alfond Inn',
    category: LuxPlaceCategory.hotel,
    unsplashPhotoId: _Photo.courtyard,
    location: '300 E New England Ave, Winter Park, FL',
    latitude: 28.5998,
    longitude: -81.3485,
    description:
        'Boutique art hotel on Winter Park\'s cultural corridor — walkable Park Avenue dining and gallery calm.',
    moodTags: ['romantic', 'luxury', 'hidden', 'culture'],
    sortOrder: 108,
  ),
  LuxPlace(
    id: 'hotel-lake-nona-wave',
    slug: 'the-wave-hotel-lake-nona',
    title: 'The Wave Hotel at Lake Nona',
    category: LuxPlaceCategory.hotel,
    unsplashPhotoId: _Photo.rooftop,
    location: '6500 Southpoint Blvd, Orlando, FL',
    latitude: 28.3645,
    longitude: -81.2488,
    description:
        'Sculptural modern luxury in Lake Nona — rooftop pool, art-forward design, and a quieter Orlando pace.',
    moodTags: ['luxury', 'wellness', 'romantic', 'trending'],
    sortOrder: 109,
  ),
  LuxPlace(
    id: 'hotel-idrive-clarion',
    slug: 'clarion-hotel-international-drive',
    title: 'Clarion Hotel International Drive',
    category: LuxPlaceCategory.hotel,
    unsplashPhotoId: _Photo.dining,
    location: '8444 International Dr, Orlando, FL',
    latitude: 28.4412,
    longitude: -81.4705,
    description:
        'Value base on I-Drive — walk to dining and a short drive to Universal without resort pricing.',
    moodTags: ['family', 'foodie'],
    sortOrder: 110,
  ),

  // ═══ Notable restaurants ═══
  LuxPlace(
    id: 'dining-victoria-and-alberts',
    slug: 'victoria-and-alberts',
    title: "Victoria & Albert's",
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.dining,
    location: '4401 Floridian Way, Lake Buena Vista, FL',
    latitude: 28.4106,
    longitude: -81.5870,
    description:
        "Florida's AAA Five-Diamond tasting menu at the Grand Floridian — reserve months ahead, dress code applies.",
    moodTags: ['luxury', 'romantic', 'foodie'],
    sortOrder: 120,
  ),
  LuxPlace(
    id: 'dining-the-boathouse',
    slug: 'the-boathouse-disney-springs',
    title: 'The BOATHOUSE',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.rooftop,
    location: '1620 E Buena Vista Dr, Disney Springs, FL',
    latitude: 28.3705,
    longitude: -81.5191,
    description:
        'Waterfront steak and seafood at Disney Springs — Amphicar rides and dock views with dinner.',
    moodTags: ['foodie', 'family', 'romantic', 'trending'],
    sortOrder: 121,
  ),
  LuxPlace(
    id: 'dining-morimoto-asia',
    slug: 'morimoto-asia-disney-springs',
    title: 'Morimoto Asia',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.dining,
    location: '1600 E Buena Vista Dr, Disney Springs, FL',
    latitude: 28.3711,
    longitude: -81.5170,
    description:
        "Iron Chef Morimoto's pan-Asian showpiece — soaring dining hall, dim sum, and Peking duck.",
    moodTags: ['foodie', 'luxury', 'trending'],
    sortOrder: 122,
  ),
  LuxPlace(
    id: 'dining-capa-four-seasons',
    slug: 'capa-four-seasons-orlando',
    title: 'Capa',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.rooftop,
    location: '10100 Dream Tree Blvd, Lake Buena Vista, FL',
    latitude: 28.3921,
    longitude: -81.5562,
    description:
        'Rooftop Spanish steakhouse at the Four Seasons — Disney fireworks views from the terrace.',
    moodTags: ['luxury', 'romantic', 'foodie', 'sunset'],
    sortOrder: 123,
  ),
  LuxPlace(
    id: 'dining-toothsome-chocolate',
    slug: 'toothsome-chocolate-emporium',
    title: 'Toothsome Chocolate Emporium',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.dining,
    location: '6000 Universal Blvd, Orlando, FL',
    latitude: 28.4748,
    longitude: -81.4684,
    description:
        'Steampunk milkshakes and brunch at Universal CityWalk — playful, photo-forward, family fun.',
    moodTags: ['family', 'foodie', 'trending'],
    sortOrder: 124,
  ),
  LuxPlace(
    id: 'dining-the-ravenous-pig',
    slug: 'the-ravenous-pig-winter-park',
    title: 'The Ravenous Pig',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.courtyard,
    location: '565 W Fairbanks Ave, Winter Park, FL',
    latitude: 28.5896,
    longitude: -81.3540,
    description:
        'Winter Park gastropub pioneer — house charcuterie, craft brews, and a local-loved patio.',
    moodTags: ['foodie', 'romantic', 'hidden'],
    sortOrder: 125,
  ),
  LuxPlace(
    id: 'dining-prato',
    slug: 'prato-winter-park',
    title: 'Prato',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.courtyard,
    location: '124 N Park Ave, Winter Park, FL',
    latitude: 28.5990,
    longitude: -81.3510,
    description:
        'Park Avenue Italian — wood-fired pizza and house pasta in a buzzy, design-forward room.',
    moodTags: ['foodie', 'romantic', 'trending'],
    sortOrder: 126,
  ),
  LuxPlace(
    id: 'dining-hawkers-mills-50',
    slug: 'hawkers-asian-street-food-mills-50',
    title: 'Hawkers Asian Street Food',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.dining,
    location: '1103 N Mills Ave, Orlando, FL',
    latitude: 28.5599,
    longitude: -81.3667,
    description:
        'Small-plates street food in the Mills 50 district — roti canai, bao, and shareable energy.',
    moodTags: ['foodie', 'hidden', 'trending'],
    sortOrder: 127,
  ),
  LuxPlace(
    id: 'dining-se7en-bites',
    slug: 'se7en-bites-milk-district',
    title: 'Se7en Bites',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.courtyard,
    location: '617 Primrose Dr, Orlando, FL',
    latitude: 28.5470,
    longitude: -81.3490,
    description:
        'Southern-scratch bakery in the Milk District — biscuits, pie, and a cult brunch line.',
    moodTags: ['foodie', 'hidden', 'family'],
    sortOrder: 128,
  ),
  LuxPlace(
    id: 'dining-black-rooster-taqueria',
    slug: 'black-rooster-taqueria',
    title: 'Black Rooster Taqueria',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: _Photo.dining,
    location: '1323 N Mills Ave, Orlando, FL',
    latitude: 28.5625,
    longitude: -81.3668,
    description:
        'Scratch-made tacos and margaritas in Mills 50 — tiny, local, and consistently excellent.',
    moodTags: ['foodie', 'hidden'],
    sortOrder: 129,
  ),
];

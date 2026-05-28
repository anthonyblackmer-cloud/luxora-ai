import 'package:luxora_ai/data/curated_places_attractions.dart';
import 'package:luxora_ai/data/curated_places_major_attractions.dart';
import 'package:luxora_ai/models/lux_place.dart';

export 'package:luxora_ai/data/curated_places_attractions.dart'
    show curatedPlacesAttractions;
export 'package:luxora_ai/data/curated_places_major_attractions.dart'
    show curatedPlacesMajorAttractions;

/// Core demo places (original MVP set) — mood covers + flagship gems.
const _curatedPlacesCore = <LuxPlace>[
  LuxPlace(
    id: 'place-winter-park-rooftop',
    slug: 'winter-park-rooftop',
    title: 'Winter Park rooftop golden hour',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: 'JZYQ_P94T-Q',
    location: 'Winter Park, FL',
    latitude: 28.5980,
    longitude: -81.3508,
    description: 'Editorial rooftop dining — skyline blush at first toast.',
    moodTags: ['romantic', 'foodie', 'trending', 'sunset'],
    aspectRole: LuxImageRole.hero,
  ),
  LuxPlace(
    id: 'place-disney-night',
    slug: 'disney-after-dark',
    title: 'After-dark park sparkle',
    category: LuxPlaceCategory.family,
    unsplashPhotoId: 'X_LNSoZ7xeM',
    location: 'Lake Buena Vista, FL',
    latitude: 28.3852,
    longitude: -81.5639,
    description: 'Night magic — fewer crowds, more wonder.',
    moodTags: ['family', 'trending', 'adventure'],
  ),
  LuxPlace(
    id: 'place-wellness-spa',
    slug: 'citrus-wellness-spa',
    title: 'Citrus ritual spa',
    category: LuxPlaceCategory.wellness,
    unsplashPhotoId: 'eQ2ElhooTjc',
    location: 'Winter Park, FL',
    latitude: 28.5965,
    longitude: -81.3520,
    description: 'Hydrotherapy and soft launch calm — wellness editorial.',
    moodTags: ['wellness', 'relaxing', 'new-opening'],
  ),
  LuxPlace(
    id: 'place-keys-sail',
    slug: 'keys-island-sail',
    title: 'Keys turquoise sail',
    category: LuxPlaceCategory.adventure,
    unsplashPhotoId: 'AK2vwEobto4',
    location: 'Key West trail, FL',
    latitude: 24.5551,
    longitude: -81.8067,
    description: 'Island-hop catamaran — wind, salt, chapter-by-chapter water.',
    moodTags: ['adventure', 'creator', 'trending'],
  ),
  LuxPlace(
    id: 'place-springs-circuit',
    slug: 'summer-springs-circuit',
    title: 'Spring cooldown circuit',
    category: LuxPlaceCategory.springs,
    unsplashPhotoId: 'sWK9wki5zHU',
    location: 'Central Florida',
    latitude: 28.8026,
    longitude: -81.3301,
    description: 'Emerald springs and shaded lunch — beat the humidity.',
    moodTags: ['nature', 'seasonal', 'springs'],
  ),
  LuxPlace(
    id: 'place-gulf-beach-clearing',
    slug: 'gulf-beach-storm-clearing',
    title: 'Gulf coast light break',
    category: LuxPlaceCategory.beach,
    unsplashPhotoId: 'xMMA_mtJ8xM',
    location: 'Clearwater area, FL',
    latitude: 27.9778,
    longitude: -82.8315,
    description: 'Storm clearing — best beach window editorial.',
    moodTags: ['beach', 'live', 'sunset'],
  ),
  LuxPlace(
    id: 'place-wekiwa-springs',
    slug: 'wekiwa-springs-dawn',
    title: 'Wekiwa crystal float',
    category: LuxPlaceCategory.springs,
    unsplashPhotoId: 'RE1uPSyVuls',
    location: 'Apopka, FL',
    latitude: 28.7570,
    longitude: -81.4980,
    description: 'Quiet spring water — locals’ east bank secret.',
    moodTags: ['hidden', 'nature', 'springs', 'gem'],
  ),
  LuxPlace(
    id: 'place-winter-park-courtyard',
    slug: 'park-avenue-courtyard',
    title: 'Park Avenue courtyard',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: 'RibghBxKlKc',
    location: 'Winter Park, FL',
    latitude: 28.5978,
    longitude: -81.3492,
    description: 'Hidden courtyard wine — candlelit, no street signage.',
    moodTags: ['hidden', 'romantic', 'gem', 'foodie'],
  ),
  LuxPlace(
    id: 'place-mangrove-paddle',
    slug: 'merritt-island-paddle',
    title: 'Mangrove dusk paddle',
    category: LuxPlaceCategory.nature,
    unsplashPhotoId: 'pXe2PzLwVgA',
    location: 'Titusville, FL',
    latitude: 28.6127,
    longitude: -80.8078,
    description: 'Mangrove channels — herons and bioluminescent hush.',
    moodTags: ['hidden', 'nature', 'gem', 'adventure'],
  ),
  LuxPlace(
    id: 'place-mount-dora-porch',
    slug: 'mount-dora-porch',
    title: 'Mount Dora lake porch',
    category: LuxPlaceCategory.romantic,
    unsplashPhotoId: 'M4RVCkMpb1I',
    location: 'Mount Dora, FL',
    latitude: 28.8025,
    longitude: -81.6445,
    description: 'Small-town rocking chairs — no theme-park hum.',
    moodTags: ['hidden', 'relaxing', 'gem'],
  ),
  LuxPlace(
    id: 'cover-romantic-sunset',
    slug: 'trip-cover-romantic',
    title: 'Romantic golden escape',
    category: LuxPlaceCategory.romantic,
    unsplashPhotoId: 'p0vZplFhKYI',
    location: 'Florida coast',
    latitude: 27.3364,
    longitude: -82.5307,
    description: 'Mood cover — sunset-ready romance.',
    moodTags: ['romantic', 'sunset', 'trip-cover'],
    aspectRole: LuxImageRole.card,
  ),
  LuxPlace(
    id: 'cover-family-springs',
    slug: 'trip-cover-family',
    title: 'Family wonder springs',
    category: LuxPlaceCategory.family,
    unsplashPhotoId: 'z78FxiNCA5w',
    location: 'Central Florida',
    latitude: 28.7117,
    longitude: -81.4798,
    description: 'Mood cover — family bonding and cool water.',
    moodTags: ['family', 'springs', 'trip-cover'],
    aspectRole: LuxImageRole.card,
  ),
  LuxPlace(
    id: 'cover-luxury-ocean',
    slug: 'trip-cover-luxury',
    title: 'Oceanfront luxury',
    category: LuxPlaceCategory.beach,
    unsplashPhotoId: 'xEaAoizNFV8',
    location: 'Miami Beach, FL',
    latitude: 25.7907,
    longitude: -80.1300,
    description: 'Mood cover — premium salt air escape.',
    moodTags: ['luxury', 'relaxing', 'trip-cover'],
    aspectRole: LuxImageRole.card,
  ),
];

List<LuxPlace> _mergeCatalogSlices(List<LuxPlace> base, List<LuxPlace> extra) {
  final ids = base.map((p) => p.id).toSet();
  return [
    ...base,
    ...extra.where((p) => !ids.contains(p.id)),
  ];
}

/// Full catalog: core + attractions + major destinations (deduped by id).
final curatedPlacesCatalog = _mergeCatalogSlices(
  _mergeCatalogSlices(_curatedPlacesCore, curatedPlacesAttractions),
  curatedPlacesMajorAttractions,
);

const kFeedItemPlaceIds = <String, String>{
  'feed-rooftop-viral': 'place-winter-park-rooftop',
  'feed-disney-after-dark': 'place-disney-night',
  'feed-new-wellness': 'place-wellness-spa',
  'feed-creator-keys': 'place-keys-sail',
  'feed-summer-springs': 'place-springs-circuit',
  'feed-live-storm': 'place-gulf-beach-clearing',
  'feed-universal-hype': 'place-universal-studios',
  'feed-kennedy-launch': 'place-kennedy-space-center',
  'feed-lake-eola-sunset': 'place-lake-eola',
  'feed-clearwater-weekend': 'place-clearwater-beach',
  'feed-kelly-park-tube': 'place-kelly-park-rock-springs',
  'feed-disney-springs-date': 'place-disney-springs',
};

const kGemPlaceIds = <String, String>{
  'gem-wekiwa-dawn': 'place-wekiwa-springs',
  'gem-winter-park-alley': 'place-winter-park-courtyard',
  'gem-merritt-island': 'place-mangrove-paddle',
  'gem-mount-dora': 'place-mount-dora-porch',
  'gem-kelly-park-tube': 'place-kelly-park-rock-springs',
  'gem-blue-spring-manatee': 'place-blue-spring-state-park',
  'gem-sanford-riverwalk': 'place-sanford-riverwalk',
  'gem-enchanted-forest': 'place-enchanted-forest',
};

const kItineraryMomentPlaceIds = <String, String>{
  '1': 'place-wellness-spa',
  '2': 'place-wekiwa-springs',
  '3': 'place-winter-park-rooftop',
};

const kSavedTripCoverPlaceIds = <String, String>{
  'orlando-golden': 'cover-romantic-sunset',
  'florida-family': 'cover-family-springs',
};

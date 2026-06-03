import 'package:luxora_ai/data/curated_places_attractions.dart';
import 'package:luxora_ai/data/curated_places_dining.dart';
import 'package:luxora_ai/data/curated_places_lodging.dart';
import 'package:luxora_ai/data/curated_places_major_attractions.dart';
import 'package:luxora_ai/data/curated_places_wellness.dart';
import 'package:luxora_ai/models/lux_place.dart';

export 'package:luxora_ai/data/curated_places_attractions.dart'
    show curatedPlacesAttractions;
export 'package:luxora_ai/data/curated_places_dining.dart'
    show curatedPlacesDining;
export 'package:luxora_ai/data/curated_places_lodging.dart'
    show curatedPlacesLodging;
export 'package:luxora_ai/data/curated_places_major_attractions.dart'
    show curatedPlacesMajorAttractions;
export 'package:luxora_ai/data/curated_places_wellness.dart'
    show curatedPlacesWellness;

/// Core demo places — real editorial gem + trip mood covers (not businesses).
const _curatedPlacesCore = <LuxPlace>[
  LuxPlace(
    id: 'place-wekiwa-springs',
    slug: 'wekiwa-springs-dawn',
    title: 'Wekiwa crystal float',
    category: LuxPlaceCategory.springs,
    unsplashPhotoId: '7AttAj3khKI',
    location: 'Apopka, FL',
    latitude: 28.7570,
    longitude: -81.4980,
    description: 'Quiet spring water — locals’ east bank secret.',
    moodTags: ['hidden', 'nature', 'springs', 'gem'],
  ),
  LuxPlace(
    id: 'cover-romantic-sunset',
    slug: 'trip-cover-romantic',
    title: 'Romantic golden escape',
    category: LuxPlaceCategory.romantic,
    unsplashPhotoId: '5HifIYdqtXE',
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
    unsplashPhotoId: 'qQFzQyt2ur0',
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

/// Full catalog: core + attractions + major destinations + lodging + dining
/// + wellness (deduped by id).
final curatedPlacesCatalog = _mergeCatalogSlices(
  _mergeCatalogSlices(
    _mergeCatalogSlices(
      _mergeCatalogSlices(
        _mergeCatalogSlices(_curatedPlacesCore, curatedPlacesAttractions),
        curatedPlacesMajorAttractions,
      ),
      curatedPlacesLodging,
    ),
    curatedPlacesDining,
  ),
  curatedPlacesWellness,
);

const kFeedItemPlaceIds = <String, String>{
  'feed-rooftop-viral': 'dining-luma-on-park',
  'feed-disney-after-dark': 'place-magic-kingdom',
  'feed-epcot-luminous': 'place-epcot',
  'feed-fantasmic-studios': 'place-hollywood-studios',
  'feed-new-wellness': 'place-woodhouse-winter-park',
  'feed-creator-keys': 'place-cocoa-beach-pier',
  'feed-summer-springs': 'place-kelly-park-rock-springs',
  'feed-live-storm': 'place-clearwater-beach',
  'feed-universal-hype': 'place-universal-studios',
  'feed-kennedy-launch': 'place-kennedy-space-center',
  'feed-lake-eola-sunset': 'place-lake-eola',
  'feed-clearwater-weekend': 'place-clearwater-beach',
  'feed-kelly-park-tube': 'place-kelly-park-rock-springs',
  'feed-disney-springs-date': 'place-disney-springs',
};

const kGemPlaceIds = <String, String>{
  'gem-wekiwa-dawn': 'place-wekiwa-springs',
  'gem-winter-park-alley': 'dining-prato',
  'gem-merritt-island': 'place-merritt-island-nwr',
  'gem-mount-dora': 'place-lakeside-inn-mount-dora',
  'gem-kelly-park-tube': 'place-kelly-park-rock-springs',
  'gem-blue-spring-manatee': 'place-blue-spring-state-park',
  'gem-sanford-riverwalk': 'place-sanford-riverwalk',
  'gem-enchanted-forest': 'place-enchanted-forest',
};

const kItineraryMomentPlaceIds = <String, String>{
  '1': 'place-woodhouse-winter-park',
  '2': 'place-wekiwa-springs',
  '3': 'dining-luma-on-park',
};

const kSavedTripCoverPlaceIds = <String, String>{
  'orlando-golden': 'cover-romantic-sunset',
  'florida-family': 'cover-family-springs',
};

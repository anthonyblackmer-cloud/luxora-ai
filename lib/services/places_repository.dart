import 'package:luxora_ai/data/city_content_catalog.dart';
import 'package:luxora_ai/data/curated_places_catalog.dart';
import 'package:luxora_ai/data/feed_items.dart';
import 'package:luxora_ai/data/miami/miami_content.dart';
import 'package:luxora_ai/models/discover_radius.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/places_asset_repository.dart';
import 'package:luxora_ai/services/places_remote_repository.dart';
import 'package:luxora_ai/util/place_distance.dart';
/// Resolves curated place media. Local catalog + optional Supabase overlay.
class PlacesRepository {
  PlacesRepository._();
  static final PlacesRepository instance = PlacesRepository._();

  final Map<String, LuxPlace> _byId = {};
  final Map<String, LuxPlace> _bySlug = {};
  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) {
      return;
    }
    _initialized = true;
    _loadLocal();
    _mergePackExperiences();
    final osmPath = CityPackRegistry.instance.active.osmAssetPath;
    if (osmPath != null && osmPath.isNotEmpty) {
      final osm = await PlacesAssetRepository.loadOsmPlaces(assetPath: osmPath);
      if (osm.isNotEmpty) {
        final packId = CityPackRegistry.instance.active.cityId;
        _mergePlaces(
          osm.map((p) => _tagCityPack(p, packId)).toList(),
          overwrite: false,
        );
      }
    }
    final remote = await PlacesRemoteRepository.tryFetchPlaces();
    if (remote != null && remote.isNotEmpty) {
      _mergePlaces(remote);
    }
  }

  void _loadLocal() {
    _byId.clear();
    _bySlug.clear();
    for (final p in curatedPlacesCatalog) {
      final tagged = p.cityPackId == null
          ? LuxPlace(
              id: p.id,
              slug: p.slug,
              title: p.title,
              category: p.category,
              unsplashPhotoId: p.unsplashPhotoId,
              location: p.location,
              latitude: p.latitude,
              longitude: p.longitude,
              description: p.description,
              storagePath: p.storagePath,
              moodTags: p.moodTags,
              aspectRole: p.aspectRole,
              sortOrder: p.sortOrder,
              isActive: p.isActive,
              website: p.website,
              source: p.source,
              sponsorship: p.sponsorship,
              cityPackId: 'orlando',
            )
          : p;
      _byId[tagged.id] = tagged;
      _bySlug[tagged.slug] = tagged;
    }
    for (final p in MiamiContent.places) {
      _byId[p.id] = p;
      _bySlug[p.slug] = p;
    }
  }

  void _mergePackExperiences() {
    for (final pack in CityPackRegistry.instance.allCities) {
      for (final exp in pack.experiences) {
        final place = exp.toLuxPlace();
        _byId[place.id] = place;
        _bySlug[place.slug] = place;
      }
    }
  }

  LuxPlace _tagCityPack(LuxPlace place, String packId) {
    if (place.cityPackId != null) return place;
    return LuxPlace(
      id: place.id,
      slug: place.slug,
      title: place.title,
      category: place.category,
      unsplashPhotoId: place.unsplashPhotoId,
      location: place.location,
      latitude: place.latitude,
      longitude: place.longitude,
      description: place.description,
      storagePath: place.storagePath,
      moodTags: place.moodTags,
      aspectRole: place.aspectRole,
      sortOrder: place.sortOrder,
      isActive: place.isActive,
      website: place.website,
      source: place.source,
      sponsorship: place.sponsorship,
      cityPackId: packId,
    );
  }

  void _mergePlaces(List<LuxPlace> incoming, {bool overwrite = true}) {
    for (final p in incoming) {
      if (!overwrite && _byId.containsKey(p.id)) continue;
      _byId[p.id] = p;
      _bySlug[p.slug] = p;
    }
  }

  List<LuxPlace> get activePlaces =>
      _byId.values.where((p) => p.isActive).toList();

  LuxPlace? byId(String? id) {
    if (id == null || id.isEmpty) {
      return null;
    }
    return _byId[id];
  }

  LuxPlace? bySlug(String slug) => _bySlug[slug];

  /// Destinations with map pins (excludes mood-only trip cover assets).
  List<LuxPlace> get mappablePlaces => activePlaces
      .where((p) => !p.moodTags.contains('trip-cover'))
      .toList();

  List<LuxPlace> byMoodTag(String tag) {
    final lower = tag.toLowerCase();
    return activePlaces
        .where((p) => p.moodTags.any((t) => t.toLowerCase() == lower))
        .toList();
  }

  bool isDiscoverable(LuxPlace place, DiscoverRadius radius) {
    if (place.moodTags.contains('trip-cover')) {
      return false;
    }
    if (!CityPackRegistry.instance.placeBelongsToActivePack(place.cityPackId)) {
      return false;
    }
    if (radius.isUnlimited) {
      return true;
    }
    return PlaceDistance.milesFromHub(place) <= radius.miles;
  }

  List<LuxPlace> placesWithinRadius(DiscoverRadius radius) {
    return mappablePlaces.where((p) => isDiscoverable(p, radius)).toList()
      ..sort(
        (a, b) =>
            PlaceDistance.milesFromHub(a).compareTo(PlaceDistance.milesFromHub(b)),
      );
  }

  /// Places to plot as map pins. Keeps all curated/editorial places within the
  /// radius but caps bulk OSM pins to the nearest [osmCap] so the map stays
  /// readable and performant even with thousands of imported venues.
  List<LuxPlace> mapPlacesWithinRadius(DiscoverRadius radius, {int osmCap = 50}) {
    final all = placesWithinRadius(radius); // distance-sorted
    final result = <LuxPlace>[];
    var osmCount = 0;
    for (final p in all) {
      if (p.source == LuxPlaceSource.osm) {
        if (osmCount >= osmCap) continue;
        osmCount++;
      }
      result.add(p);
    }
    return result;
  }

  List<LuxPlace> gemsWithinRadius(DiscoverRadius radius) {
    final ids = CityPackRegistry.instance.gemPlaceIds.values.toSet();
    return placesWithinRadius(radius).where((p) => ids.contains(p.id)).toList();
  }

  List<FeedItem> feedWithinRadius(DiscoverRadius radius) {
    final feedMap = CityPackRegistry.instance.feedItemPlaceIds;
    return CityContentCatalog.discoveryFeedForActive().where((item) {
      final placeId = feedMap[item.id];
      if (placeId == null) {
        return true;
      }
      final place = byId(placeId);
      if (place == null) {
        return true;
      }
      return isDiscoverable(place, radius);
    }).toList();
  }

  int countWithinRadius(DiscoverRadius radius) =>
      placesWithinRadius(radius).length;

  /// Text search over the curated catalog (title, city, tags, category).
  List<LuxPlace> searchPlaces(
    String query, {
    DiscoverRadius? radius,
    int limit = 30,
  }) {
    final trimmed = query.trim().toLowerCase();
    if (trimmed.isEmpty) {
      return [];
    }

    final tokens = trimmed
        .split(RegExp(r'\s+'))
        .where((t) => t.length >= 2)
        .toList();
    if (tokens.isEmpty) {
      return [];
    }

    final pool = radius == null
        ? mappablePlaces
        : placesWithinRadius(radius);

    final scored = <({LuxPlace place, int score})>[];
    for (final place in pool) {
      final haystack = _searchableText(place);
      if (!tokens.every(haystack.contains)) {
        continue;
      }
      scored.add((place: place, score: _matchScore(place, trimmed, tokens)));
    }

    scored.sort((a, b) {
      final byScore = b.score.compareTo(a.score);
      if (byScore != 0) {
        return byScore;
      }
      return PlaceDistance.milesFromHub(a.place)
          .compareTo(PlaceDistance.milesFromHub(b.place));
    });

    return scored.take(limit).map((e) => e.place).toList();
  }

  String _searchableText(LuxPlace place) {
    return [
      place.title,
      place.location,
      place.description,
      place.slug.replaceAll('-', ' '),
      place.categoryLabel,
      ...place.moodTags,
    ].join(' ').toLowerCase();
  }

  int _matchScore(LuxPlace place, String fullQuery, List<String> tokens) {
    final title = place.title.toLowerCase();
    var score = 0;
    if (title == fullQuery) {
      score += 100;
    } else if (title.startsWith(fullQuery)) {
      score += 60;
    } else if (title.contains(fullQuery)) {
      score += 40;
    }
    if (place.location.toLowerCase().contains(fullQuery)) {
      score += 20;
    }
    if (place.moodTags.any((t) => t.toLowerCase().contains(fullQuery))) {
      score += 15;
    }
    score += tokens.length * 5;
    if (place.moodTags.contains('iconic')) {
      score += 3;
    }
    return score;
  }
}

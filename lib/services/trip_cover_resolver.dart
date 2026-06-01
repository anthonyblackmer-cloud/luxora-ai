import 'package:luxora_ai/data/curated_places_catalog.dart';
import 'package:luxora_ai/data/saved_trips.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/places_repository.dart';

/// Picks a mood cover for Trips — Phase 2: AI-generated from profile + style memory.
class TripCoverResolver {
  TripCoverResolver._();
  static final TripCoverResolver instance = TripCoverResolver._();

  final _places = PlacesRepository.instance;

  LuxPlace? forSavedTrip(SavedTripSummary trip) {
    final mapped = kSavedTripCoverPlaceIds[trip.id];
    if (mapped != null) {
      return _places.byId(mapped);
    }
    return _fromMoodTags(trip.moodTags);
  }

  LuxPlace? forProfile(TripProfile profile) {
    if (profile.moods.contains(TripMood.familyBonding)) {
      return _places.byId('cover-family-springs');
    }
    if (profile.moods.contains(TripMood.romantic) ||
        profile.tripFeel.toLowerCase().contains('romantic')) {
      return _places.byId('cover-romantic-sunset');
    }
    if (profile.moods.contains(TripMood.luxurious) ||
        profile.luxuryLevel == LuxuryLevel.ultraLuxury) {
      return _places.byId('cover-luxury-ocean');
    }
    if (profile.moods.contains(TripMood.nature) ||
        profile.moods.contains(TripMood.wellness)) {
      return _places.byId('place-wekiwa-springs');
    }
    return _places.byId('cover-romantic-sunset');
  }

  LuxPlace? _fromMoodTags(List<String> tags) {
    final lower = tags.map((t) => t.toLowerCase()).toList();
    if (lower.any((t) => t.contains('family'))) {
      return _places.byId('cover-family-springs');
    }
    if (lower.any((t) => t.contains('romantic') || t.contains('sunset'))) {
      return _places.byId('cover-romantic-sunset');
    }
    if (lower.any((t) => t.contains('springs'))) {
      return _places.byId('place-kelly-park-rock-springs');
    }
    return _places.byId('cover-luxury-ocean');
  }
}

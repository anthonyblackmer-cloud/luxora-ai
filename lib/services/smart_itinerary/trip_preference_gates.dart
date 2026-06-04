import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/smart_itinerary/experience_duration_catalog.dart';

/// Opt-in gates from onboarding checkboxes — interest dials alone must not
/// override explicit "I didn't select this" choices.
abstract final class TripPreferenceGates {
  static bool wantsThemeParks(TripProfile profile) =>
      profile.experiencePreferences.contains(ExperiencePreference.themeParks) ||
      profile.experiencePreferences.contains(ExperiencePreference.waterParks) ||
      profile.tripStyles.contains(TripStyle.themeParks) ||
      profile.occasion == TripOccasion.disneyAdventure ||
      profile.occasion == TripOccasion.universalAdventure;

  static bool wantsWaterParks(TripProfile profile) =>
      profile.experiencePreferences.contains(ExperiencePreference.waterParks) ||
      wantsThemeParks(profile);

  /// Explicit onboarding opt-in only — trip styles and poolside dials must not
  /// schedule spa stops when the traveler skipped "Spas".
  static bool wantsSpaWellness(TripProfile profile) =>
      profile.experiencePreferences.contains(ExperiencePreference.spas);

  static bool isWellnessOrSpaPlace(LuxPlace place) =>
      place.category == LuxPlaceCategory.wellness ||
      place.moodTags.any((t) {
        final lower = t.toLowerCase();
        return lower == 'spa' || lower == 'wellness';
      });

  static bool allowsWellnessPlace(TripProfile profile, LuxPlace place) {
    if (!isWellnessOrSpaPlace(place)) return true;
    return wantsSpaWellness(profile);
  }

  static bool wantsFamilyAttractions(TripProfile profile) =>
      profile.travelerType == TravelerType.family ||
      profile.kids > 0 ||
      profile.childrenTypes.isNotEmpty ||
      profile.occasion == TripOccasion.familyWithKids;

  static bool isFriendsOrAdultSocialTrip(TripProfile profile) =>
      profile.travelerType == TravelerType.friends ||
      (profile.travelerType == TravelerType.solo && profile.kids == 0);

  static bool isKidFocusedFamilyVenue(String placeId) =>
      const {
        'place-ripleys-orlando',
        'place-sealife-orlando',
        'place-madame-tussauds-orlando',
        'place-crayola-experience',
        'place-wonderworks-orlando',
        'place-legoland-florida',
      }.contains(placeId);

  static bool allowsPlace(TripProfile profile, String placeId) {
    if (ExperienceDurationCatalog.isMajorThemePark(placeId) &&
        !wantsThemeParks(profile)) {
      return false;
    }
    if (ExperienceDurationCatalog.isWaterPark(placeId) &&
        !wantsWaterParks(profile)) {
      return false;
    }
    if (isKidFocusedFamilyVenue(placeId) &&
        isFriendsOrAdultSocialTrip(profile) &&
        !wantsFamilyAttractions(profile)) {
      return false;
    }
    return true;
  }

  static bool allowsWellnessMorning(TripProfile profile) =>
      wantsSpaWellness(profile);
}

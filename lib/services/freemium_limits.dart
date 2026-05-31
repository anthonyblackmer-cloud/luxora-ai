/// Preview caps for free-tier discovery — execution stays behind city unlock.
abstract final class FreemiumLimits {
  static const freeConciergeMessages = 3;
  static const previewHotels = 5;
  static const previewRestaurants = 5;
  static const previewAttractions = 5;
  static const previewHiddenGems = 5;
  static const previewLocalSecrets = 2;
  static const previewExperiences = 5;
  static const freeDayIndex = 0;
}

enum FreemiumUnlockTrigger {
  dayTwoPlus,
  conciergeLimit,
  hotelsPreview,
  restaurantsPreview,
  attractionsPreview,
  hiddenGemsPreview,
  localSecretsPreview,
  experiencesPreview,
  hotelMatchmaker,
  fullItinerary,
}

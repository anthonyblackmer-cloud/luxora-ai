import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/trip_occasion_interpreter.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';

/// Which occasion chips appear on onboarding and how they stay in sync with IAP.
abstract final class TripOccasionCatalog {
  static const coreOccasions = [
    TripOccasion.general,
    TripOccasion.coupleAnniversary,
    TripOccasion.coupleHoneymoon,
    TripOccasion.coupleDateNight,
    TripOccasion.coupleProposal,
    TripOccasion.familyWithKids,
  ];

  static const themeParkOccasions = [
    TripOccasion.disneyAdventure,
    TripOccasion.universalAdventure,
  ];

  static bool themeParksUnlocked() =>
      CityPackEntitlementStore.instance
          .isAddonUnlocked(OrlandoAddonCatalog.themeParks);

  static bool showsThemeParkOccasions(TripProfile profile) =>
      profile.cityId == OrlandoAddonCatalog.parentCityId && themeParksUnlocked();

  static List<TripOccasion> visibleOccasions(TripProfile profile) {
    final out = List<TripOccasion>.from(coreOccasions);
    if (showsThemeParkOccasions(profile)) {
      out.addAll(themeParkOccasions);
    }
    return out;
  }

  static TripOccasion normalizeOccasion(
    TripOccasion occasion, {
    required TripProfile profile,
  }) {
    if (!occasion.isThemePark) return occasion;
    return showsThemeParkOccasions(profile)
        ? occasion
        : TripOccasion.general;
  }

  /// After the Disney & Universal pack unlocks, reveal park occasions on the
  /// active Orlando profile when the traveler has not picked a specific reason.
  static Future<void> applyThemeParksUnlockToActiveProfile({
    TripOccasion preferred = TripOccasion.disneyAdventure,
  }) async {
    final current = TripProfileStore.instance.profile.value;
    if (current == null ||
        current.cityId != OrlandoAddonCatalog.parentCityId ||
        !themeParksUnlocked()) {
      return;
    }

    if (current.occasion.isThemePark) return;

    if (current.occasion != TripOccasion.general) return;

    final next = TripOccasionInterpreter.apply(
      current.copyWith(occasion: preferred),
    );
    await TripProfileStore.instance.save(next);
  }
}

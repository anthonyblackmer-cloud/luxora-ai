import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/paywall/paywall_city_offer.dart';
import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_profile.dart';

/// Resolves persona-specific paywall copy from the saved trip profile.
abstract final class PaywallPersonalization {
  static PaywallPersona personaFor(TripProfile? profile) {
    if (profile == null) return PaywallPersona.general;

    if (profile.occasion.isCouple ||
        profile.moods.contains(TripMood.romantic)) {
      return PaywallPersona.couples;
    }
    if (profile.occasion.isFamily ||
        profile.kids > 0 ||
        profile.moods.contains(TripMood.familyBonding)) {
      return PaywallPersona.family;
    }
    if (profile.luxuryLevel == LuxuryLevel.ultraLuxury ||
        profile.moods.contains(TripMood.luxurious)) {
      return PaywallPersona.luxury;
    }
    if (profile.adventureInterest >= 60 ||
        profile.moods.contains(TripMood.adventurous) ||
        profile.moods.contains(TripMood.nature)) {
      return PaywallPersona.adventure;
    }
    if (profile.foodieInterest >= 60 ||
        profile.moods.contains(TripMood.foodie)) {
      return PaywallPersona.foodie;
    }
    return PaywallPersona.general;
  }

  static String headline(
    AppLocalizations l,
    PaywallPersona persona,
    String cityName, {
    String? cityId,
  }) {
    if (cityId == 'miami' && persona == PaywallPersona.general) {
      return l.paywallHeadlineMiamiDefault;
    }
    return switch (persona) {
        PaywallPersona.couples => l.paywallHeadlineCouples(cityName),
        PaywallPersona.family => l.paywallHeadlineFamily(cityName),
        PaywallPersona.luxury => l.paywallHeadlineLuxury(cityName),
        PaywallPersona.adventure => l.paywallHeadlineAdventure(cityName),
        PaywallPersona.foodie => l.paywallHeadlineFoodie(cityName),
        PaywallPersona.general => l.paywallHeroHeadline,
      };
  }
}

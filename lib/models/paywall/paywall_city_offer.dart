/// City-specific paywall offer — pricing, imagery, and vacation context.
class PaywallCityOffer {
  const PaywallCityOffer({
    required this.cityId,
    required this.cityName,
    required this.regionLabel,
    required this.heroUnsplashId,
    required this.priceUsd,
    required this.vacationCostMinUsd,
    required this.vacationCostMaxUsd,
    this.couplesHeroUnsplashId,
    this.familyHeroUnsplashId,
    this.luxuryHeroUnsplashId,
    this.adventureHeroUnsplashId,
    this.foodieHeroUnsplashId,
  });

  final String cityId;
  final String cityName;
  final String regionLabel;
  final String heroUnsplashId;
  final double priceUsd;
  final int vacationCostMinUsd;
  final int vacationCostMaxUsd;

  /// Persona-specific hero overrides (fallback to [heroUnsplashId]).
  final String? couplesHeroUnsplashId;
  final String? familyHeroUnsplashId;
  final String? luxuryHeroUnsplashId;
  final String? adventureHeroUnsplashId;
  final String? foodieHeroUnsplashId;

  String heroForPersona(PaywallPersona persona) => switch (persona) {
        PaywallPersona.couples =>
          couplesHeroUnsplashId ?? heroUnsplashId,
        PaywallPersona.family =>
          familyHeroUnsplashId ?? heroUnsplashId,
        PaywallPersona.luxury =>
          luxuryHeroUnsplashId ?? heroUnsplashId,
        PaywallPersona.adventure =>
          adventureHeroUnsplashId ?? heroUnsplashId,
        PaywallPersona.foodie =>
          foodieHeroUnsplashId ?? heroUnsplashId,
        PaywallPersona.general => heroUnsplashId,
      };

  String get formattedPrice => '\$${priceUsd.toStringAsFixed(2)}';
}

/// Trip-profile-driven paywall tone — swaps hero and headline copy.
enum PaywallPersona {
  general,
  couples,
  family,
  luxury,
  adventure,
  foodie,
}

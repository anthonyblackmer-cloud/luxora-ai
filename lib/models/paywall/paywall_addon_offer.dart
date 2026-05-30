/// Orlando theme-park add-on — sold separately from the base city unlock.
class PaywallAddonOffer {
  const PaywallAddonOffer({
    required this.addonId,
    required this.parentCityId,
    required this.packName,
    required this.subtitle,
    required this.heroUnsplashId,
    required this.priceUsd,
    this.districtId,
  });

  final String addonId;
  final String parentCityId;
  final String packName;
  final String subtitle;
  final String heroUnsplashId;
  final double priceUsd;

  /// Maps to [DistrictPack.districtId] when present.
  final String? districtId;

  String get formattedPrice => '\$${priceUsd.toStringAsFixed(2)}';
}

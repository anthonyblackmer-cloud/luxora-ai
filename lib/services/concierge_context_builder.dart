import 'package:luxora_ai/data/paywall_catalog.dart';
import 'package:luxora_ai/data/ticket_deals_resolver.dart';
import 'package:luxora_ai/models/concierge/concierge_trip_context.dart';
import 'package:luxora_ai/models/discover_radius.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/concierge_trip_save_sync.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/places_repository.dart';

/// Assembles trip + catalog context for the live concierge backend.
abstract final class ConciergeContextBuilder {
  static const _maxPlaces = 18;

  static ConciergeTripContext build({
    TripProfile? profile,
    List<String> stylePrefs = const [],
    required String localeCode,
  }) {
    final p = profile ?? const TripProfile();
    final cityId = p.cityId.isNotEmpty
        ? p.cityId
        : CityPackRegistry.instance.active.cityId;
    final offer = PaywallCatalog.isSupported(cityId)
        ? PaywallCatalog.offerFor(cityId)
        : PaywallCatalog.offerFor(CityPackRegistry.instance.active.cityId);

    final radius = DiscoverRadiusController.instance.radius;
    final repo = PlacesRepository.instance;

    final gems = repo.gemsWithinRadius(radius);
    final pool = gems.isNotEmpty
        ? gems
        : repo.placesWithinRadius(
            radius == DiscoverRadius.allFlorida
                ? DiscoverRadius.miles100
                : radius,
          );

    final places = pool.take(_maxPlaces).map((place) {
      return ConciergePlaceHint(
        id: place.id,
        title: place.title,
        category: place.category.name,
        location: place.location,
        moodTags: place.moodTags.take(4).toList(),
      );
    }).toList();

    final ticketDeals = TicketDealsResolver.allDealsForActive()
      ..sort((a, b) => b.savingsUsd.compareTo(a.savingsUsd));
    final dealHints = ticketDeals.take(10).map((deal) {
      return ConciergeTicketDealHint(
        id: deal.id,
        title: deal.title,
        discountPriceUsd: deal.discountPriceUsd,
        savingsUsd: deal.savingsUsd,
        sourceName: deal.sourceName,
        placeId: deal.placeId,
      );
    }).toList();

    final savedTripHints = ConciergeTripSaveSync.savedTripsForContext(
      cityId: offer.cityId,
    ).map((trip) {
      return ConciergeSavedTripHint(
        title: trip['title']!,
        dateRange: trip['dateRange']!,
        status: trip['status']!,
      );
    }).toList();

    return ConciergeTripContext(
      cityId: offer.cityId,
      cityName: offer.cityName,
      region: offer.regionLabel,
      locale: localeCode,
      tripFeel: p.tripFeel,
      moods: p.moods.map((m) => m.name).toList(),
      stylePrefs: stylePrefs,
      budgetUsd: p.budgetUsd,
      adults: p.adults,
      kids: p.kids,
      occasion: p.occasion.name,
      places: places,
      ticketDeals: dealHints,
      savedTrips: savedTripHints,
    );
  }
}

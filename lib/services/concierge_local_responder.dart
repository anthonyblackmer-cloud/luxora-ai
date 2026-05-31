import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/concierge_itinerary_sync.dart';
import 'package:luxora_ai/services/concierge_ticket_sync.dart';
import 'package:luxora_ai/services/concierge_trip_save_sync.dart';

/// On-device concierge when live OpenAI is unavailable.
class ConciergeLocalRespondResult {
  const ConciergeLocalRespondResult({
    required this.reply,
    this.sync,
  });

  final String reply;
  final ConciergeItinerarySyncResult? sync;
}

abstract final class ConciergeLocalResponder {
  static Future<ConciergeLocalRespondResult> respond({
    required AppLocalizations l,
    required String userMessage,
    TripProfile? profile,
    String localeName = 'en',
  }) async {
    final trimmed = userMessage.trim();
    if (trimmed.isEmpty) {
      return ConciergeLocalRespondResult(
        reply: l.conciergeLocalNoIntent,
      );
    }

    if (ConciergeTripSaveSync.wantsSaveTrip(trimmed)) {
      final save = await ConciergeTripSaveSync.saveCurrentTrip(
        profile: profile,
        localeName: localeName,
        l: l,
      );
      return ConciergeLocalRespondResult(reply: save.chatMessage);
    }

    if (ConciergeTripSaveSync.wantsListSavedTrips(trimmed)) {
      final summary = await ConciergeTripSaveSync.listSavedTripsSummary(
        l: l,
        cityId: profile?.cityId,
      );
      return ConciergeLocalRespondResult(reply: summary);
    }

    if (ConciergeTripSaveSync.shouldRebuildItinerary(trimmed)) {
      final sync = await ConciergeItinerarySync.applyAfterChat(
        userMessage: trimmed,
        profile: profile,
      );
      if (sync != null) {
        final cityLabel = CityPackRegistry.instance.active.cityName;
        return ConciergeLocalRespondResult(
          reply: l.conciergeLocalPlanBuilt(cityLabel, sync.flow.stopCount),
          sync: sync,
        );
      }
    }

    if (ConciergeTicketSync.wantsTicketHelp(trimmed)) {
      final cityId = profile?.cityId.isNotEmpty == true
          ? profile!.cityId
          : CityPackRegistry.instance.active.cityId;
      final deals = await ConciergeTicketSync.enrichActivePlanWithDeals(
        userMessage: trimmed,
        cityId: cityId,
        profile: profile,
      );
      if (deals.isNotEmpty) {
        return ConciergeLocalRespondResult(
          reply: l.conciergeTicketsFoundIntro,
        );
      }
    }

    return ConciergeLocalRespondResult(
      reply: l.conciergeLocalNoIntent,
    );
  }
}

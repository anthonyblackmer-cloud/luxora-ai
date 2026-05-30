import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:luxora_ai/l10n/app_localizations_en.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/concierge_itinerary_sync.dart';
import 'package:luxora_ai/services/concierge_trip_save_sync.dart';
import 'package:luxora_ai/services/saved_trips_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initializeDateFormatting('en');
  });

  setUp(() {
    SharedPreferences.setMockInitialValues({
      'luxora_saved_trips_seeded_v1': true,
      'luxora_saved_trips_v1': '[]',
    });
  });

  test('wantsSaveTrip detects save language', () {
    expect(ConciergeTripSaveSync.wantsSaveTrip('Please save my trip'), isTrue);
    expect(
      ConciergeTripSaveSync.wantsSaveTrip('Plan a romantic dinner'),
      isFalse,
    );
  });

  test('wantsListSavedTrips detects list language', () {
    expect(
      ConciergeTripSaveSync.wantsListSavedTrips('Show my saved trips'),
      isTrue,
    );
    expect(
      ConciergeTripSaveSync.wantsListSavedTrips('Find ticket deals'),
      isFalse,
    );
  });

  test('shouldSkipItineraryRebuild for save-only messages', () {
    expect(
      ConciergeTripSaveSync.shouldSkipItineraryRebuild('Save my trip'),
      isTrue,
    );
    expect(
      ConciergeTripSaveSync.shouldRebuildItinerary('Save my trip'),
      isFalse,
    );
    expect(
      ConciergeTripSaveSync.shouldRebuildItinerary(
        'Save my trip and plan a spa day',
      ),
      isTrue,
    );
    expect(
      ConciergeItinerarySync.applyAfterChat(userMessage: 'Save my trip'),
      completion(isNull),
    );
  });

  test('saveCurrentTrip persists to SavedTripsStore', () async {
    const profile = TripProfile(
      cityId: 'orlando',
      destination: 'Orlando',
      startDate: '2026-06-01',
      endDate: '2026-06-05',
    );

    await ConciergeTripSaveSync.saveCurrentTrip(
      profile: profile,
      localeName: 'en',
      l: AppLocalizationsEn(),
    );

    await SavedTripsStore.instance.load();
    expect(
      SavedTripsStore.instance.trips.value.any(
        (t) => t.title.contains('Orlando'),
      ),
      isTrue,
    );
  });
}

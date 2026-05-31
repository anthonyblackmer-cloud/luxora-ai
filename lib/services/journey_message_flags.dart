import 'package:shared_preferences/shared_preferences.dart';

/// One-shot UX flags for Luxora journey messaging after onboarding.
abstract final class JourneyMessageFlags {
  static const _itineraryReadyKey = 'luxora_show_itinerary_ready';

  static Future<void> markItineraryReadyPending() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_itineraryReadyKey, true);
  }

  static Future<bool> consumeItineraryReadyPending() async {
    final prefs = await SharedPreferences.getInstance();
    final pending = prefs.getBool(_itineraryReadyKey) ?? false;
    if (pending) {
      await prefs.remove(_itineraryReadyKey);
    }
    return pending;
  }
}

import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/saved_trips_store.dart';
import 'package:luxora_ai/services/trip_profile_storage.dart';

/// Detects travelers who already completed onboarding and prepares a fresh
/// [TripProfile] for a new trip build (preferences kept, trip fields reset).
class ReturningTravelerBootstrap {
  const ReturningTravelerBootstrap({
    required this.profileForNewTrip,
    required this.travelerName,
  });

  final TripProfile profileForNewTrip;
  final String travelerName;
}

abstract final class ReturningTravelerService {
  static const cityStepIndex = 3;

  static Future<ReturningTravelerBootstrap?> detect() async {
    await SavedTripsStore.instance.load();
    final saved = await TripProfileStorage().load();
    if (!_isReturning(saved)) return null;

    final prior = saved ?? const TripProfile();
    return ReturningTravelerBootstrap(
      profileForNewTrip: profileForNewTrip(prior),
      travelerName: prior.travelerName.trim(),
    );
  }

  static bool _isReturning(TripProfile? saved) {
    if (saved != null && saved.travelerName.trim().isNotEmpty) return true;
    return SavedTripsStore.instance.trips.value.any((t) => t.userCreated);
  }

  /// Keeps taste/preferences from the last build; clears dates and naming so
  /// onboarding can focus on the new destination and schedule.
  static TripProfile profileForNewTrip(TripProfile prior) {
    return prior.copyWith(
      startDate: '',
      endDate: '',
      tripName: '',
      tripFeel: '',
      useAutoTripName: true,
      moods: const [],
      occasion: TripOccasion.general,
    );
  }
}

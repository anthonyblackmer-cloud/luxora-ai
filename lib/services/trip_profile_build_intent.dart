import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/util/trip_duration.dart';
import 'package:luxora_ai/util/trip_occasion_catalog.dart';

/// Turns onboarding answers into a planning cue for the multi-day builder.
abstract final class TripProfileBuildIntent {
  static const int defaultDaysWithoutDates = 3;

  static String planningMessage(TripProfile profile) {
    final days = tripDaysFromProfile(profile);
    final dayCount = days > 0 ? days : defaultDaysWithoutDates;
    final destination = profile.destination.trim().isEmpty
        ? _cityLabel(profile.cityId)
        : profile.destination.trim();

    final buffer = StringBuffer('Plan our $dayCount-day ');

    switch (profile.occasion) {
      case TripOccasion.disneyAdventure:
        buffer.write('Disney and Universal excursion in $destination');
      case TripOccasion.universalAdventure:
        buffer.write('Universal Studios adventure in $destination');
      case TripOccasion.familyWithKids:
        if (profile.cityId == OrlandoAddonCatalog.parentCityId &&
            TripOccasionCatalog.themeParksUnlocked()) {
          buffer.write('family Disney and Universal trip in $destination');
        } else {
          buffer.write('family-friendly $destination getaway');
        }
      case TripOccasion.coupleAnniversary:
      case TripOccasion.coupleHoneymoon:
      case TripOccasion.coupleProposal:
        buffer.write('romantic luxury escape in $destination');
      case TripOccasion.coupleDateNight:
        buffer.write('date-night style $destination trip');
      case TripOccasion.general:
        buffer.write('$destination getaway');
    }

    final extras = <String>[];
    if (profile.foodieInterest >= 55) extras.add('great dining');
    if (profile.poolsideInterest >= 55) extras.add('poolside downtime');
    if (profile.adventureInterest >= 55) extras.add('outdoor adventure');
    if (profile.cultureInterest >= 55) extras.add('culture and sightseeing');
    if (profile.nightlifeInterest >= 55) extras.add('nightlife');
    if (extras.isNotEmpty) {
      buffer.write(' with ${extras.join(', ')}');
    }

    final feel = profile.tripFeel.trim();
    if (feel.isNotEmpty) {
      buffer.write('. $feel');
    }

    return buffer.toString();
  }

  static String _cityLabel(String cityId) => switch (cityId) {
        'miami' => 'Miami',
        'florida-keys' => 'Florida Keys',
        _ => 'Orlando',
      };
}

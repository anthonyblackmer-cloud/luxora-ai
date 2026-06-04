import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';

import 'package:luxora_ai/models/trip_occasion.dart';

import 'package:luxora_ai/models/trip_preferences.dart';

import 'package:luxora_ai/models/trip_profile.dart';

import 'package:luxora_ai/util/trip_duration.dart';

import 'package:luxora_ai/services/smart_itinerary/trip_preference_gates.dart';
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



    final wantsThemeParks =
        TripPreferenceGates.wantsThemeParks(profile);



    switch (profile.occasion) {

      case TripOccasion.disneyAdventure:

        buffer.write('Disney and Universal excursion in $destination');

      case TripOccasion.universalAdventure:

        buffer.write('Universal Studios adventure in $destination');

      case TripOccasion.familyWithKids:

        if (profile.cityId == OrlandoAddonCatalog.parentCityId &&

            (TripOccasionCatalog.themeParksUnlocked() || wantsThemeParks)) {

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

        if (wantsThemeParks &&

            profile.cityId == OrlandoAddonCatalog.parentCityId) {

          buffer.write('Disney and Universal theme park trip in $destination');

        } else {

          buffer.write('$destination getaway');

        }

    }



    final extras = <String>[];

    if (profile.experiencePreferences.contains(ExperiencePreference.liveShows)) {
      extras.add('iconic night shows and fireworks');
    }

    if (profile.experiencePreferences.contains(ExperiencePreference.waterParks)) {
      extras.add('water park reset days');
    }

    if (profile.experiencePreferences.contains(ExperiencePreference.themeParks)) {
      extras.add('must-do park moments — parades, fireworks, and castle shows');
    }

    if (profile.foodieInterest >= 55) extras.add('great dining');

    if (TripPreferenceGates.wantsSpaWellness(profile)) {
      extras.add('poolside downtime');
    } else if (profile.tripStyles.contains(TripStyle.relaxation)) {
      extras.add('relaxed pacing');
    }

    if (profile.adventureInterest >= 55) extras.add('outdoor adventure');

    if (profile.cultureInterest >= 55) extras.add('culture and sightseeing');

    if (profile.nightlifeInterest >= 55) extras.add('nightlife');



    for (final style in profile.tripStyles) {

      final label = _tripStylePhrase(style);

      if (label != null && !extras.contains(label)) {

        extras.add(label);

      }

    }



    if (profile.vacationGoals.contains(VacationGoal.hiddenGems)) {

      extras.add('hidden gems');

    }

    if (profile.vacationGoals.contains(VacationGoal.bestFood)) {

      extras.add('best restaurants');

    }

    if (profile.cuisinePreferences.isNotEmpty) {

      extras.add(

        '${profile.cuisinePreferences.take(3).map((c) => c.name).join(', ')} cuisine',

      );

    }



    if (extras.isNotEmpty) {

      buffer.write(' with ${extras.join(', ')}');

    }



    buffer.write(

      '. Pace: ${profile.pace.name}. Primary vibe: ${profile.desiredTripEmotion.name}',

    );



    final feel = profile.tripFeel.trim();

    if (feel.isNotEmpty) {

      buffer.write('. $feel');

    }



    return buffer.toString();

  }



  static String? _tripStylePhrase(TripStyle style) => switch (style) {

        TripStyle.luxury => 'luxury experiences',

        TripStyle.relaxation => 'relaxation',

        TripStyle.adventure => 'adventure',

        TripStyle.themeParks => 'theme parks',

        TripStyle.foodie => 'foodie experiences',

        TripStyle.nightlife => 'nightlife',

        TripStyle.romance => 'romance',

        TripStyle.beaches => 'beach time',

        TripStyle.wellness => 'wellness',

        TripStyle.hiddenGems => 'hidden gems',

        TripStyle.localExperiences => 'local experiences',

        _ => null,

      };



  static String _cityLabel(String cityId) => switch (cityId) {

        'miami' => 'Miami',

        'florida-keys' => 'Florida Keys',

        _ => 'Orlando',

      };

}



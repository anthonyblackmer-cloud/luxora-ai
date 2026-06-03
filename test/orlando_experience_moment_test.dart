import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/orlando_experience_moment_service.dart';
import 'package:luxora_ai/services/trip_profile_build_intent.dart';

void main() {
  test('Magic Kingdom evening line mentions Happily Ever After', () {
    final line = OrlandoExperienceMomentService.lineForSegment(
      placeId: 'place-magic-kingdom',
      phase: DayPhase.evening,
      routeDescription: 'Generic park day',
    );
    expect(line.toLowerCase(), contains('happily ever after'));
  });

  test('setup highlights include fireworks when live shows selected', () {
    const profile = TripProfile(
      experiencePreferences: [ExperiencePreference.liveShows],
    );
    final highlights = OrlandoExperienceMomentService.setupHighlights(profile);
    expect(
      highlights.any((h) => h.toLowerCase().contains('fireworks')),
      isTrue,
    );
  });

  test('planning message mentions night shows for live show preference', () {
    const profile = TripProfile(
      cityId: 'orlando',
      destination: 'Orlando',
      experiencePreferences: [ExperiencePreference.liveShows],
      startDate: '2026-06-01',
      endDate: '2026-06-04',
    );
    final message = TripProfileBuildIntent.planningMessage(profile);
    expect(message.toLowerCase(), contains('fireworks'));
  });
}

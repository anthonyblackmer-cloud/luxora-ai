import 'package:luxora_ai/models/trip_profile.dart';

/// Saved trip collections — rich status for a living dashboard.
class SavedTripSummary {
  const SavedTripSummary({
    required this.id,
    required this.title,
    required this.dateRange,
    required this.experienceCount,
    required this.moodTags,
    required this.timelineStatus,
    this.cityId = 'orlando',
    this.routeOptimized = false,
    this.weatherWindow,
    this.nextExperience,
    this.sunsetWindow,
    this.timelineSnapshot,
    this.liveWeatherNote,
    this.userCreated = false,
  });

  final String id;
  final String title;
  final String dateRange;
  final int experienceCount;
  final List<String> moodTags;
  final String timelineStatus;
  final String cityId;
  final bool routeOptimized;
  final String? weatherWindow;
  final String? nextExperience;
  final String? sunsetWindow;
  final String? timelineSnapshot;
  final String? liveWeatherNote;

  /// True when this trip was generated from a user onboarding flow (vs. a
  /// seeded showcase trip).
  final bool userCreated;

  String get statusLine {
    final parts = <String>[
      if (experienceCount > 0) '$experienceCount experiences',
      if (routeOptimized) 'Route optimized',
      ...moodTags.take(2),
      ?weatherWindow,
    ];
    return parts.isEmpty ? timelineStatus : parts.join(' · ');
  }

  /// True when this trip belongs to the currently active city pack.
  bool matchesActiveCity(String activeCityId) => cityId == activeCityId;

  /// Builds a fresh trip card from a completed onboarding [TripProfile].
  factory SavedTripSummary.fromProfile(
    TripProfile profile, {
    required String id,
  }) {
    final destination =
        profile.destination.trim().isEmpty ? 'Florida' : profile.destination.trim();
    final dates = [profile.startDate.trim(), profile.endDate.trim()]
        .where((d) => d.isNotEmpty)
        .join(' – ');
    return SavedTripSummary(
      id: id,
      title: '$destination Escape',
      dateRange: dates.isEmpty ? 'Dates flexible' : dates,
      experienceCount: 0,
      moodTags: profile.moods.map(_moodLabel).toList(),
      timelineStatus: 'Building itinerary',
      cityId: profile.cityId,
      userCreated: true,
    );
  }

  static String _moodLabel(TripMood mood) => switch (mood) {
        TripMood.romantic => 'Romantic',
        TripMood.relaxing => 'Relaxing',
        TripMood.adventurous => 'Adventurous',
        TripMood.luxurious => 'Luxurious',
        TripMood.familyBonding => 'Family bonding',
        TripMood.social => 'Social',
        TripMood.nature => 'Nature',
        TripMood.wellness => 'Wellness',
        TripMood.foodie => 'Foodie',
      };

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'dateRange': dateRange,
        'experienceCount': experienceCount,
        'moodTags': moodTags,
        'timelineStatus': timelineStatus,
        'cityId': cityId,
        'routeOptimized': routeOptimized,
        'weatherWindow': weatherWindow,
        'nextExperience': nextExperience,
        'sunsetWindow': sunsetWindow,
        'timelineSnapshot': timelineSnapshot,
        'liveWeatherNote': liveWeatherNote,
        'userCreated': userCreated,
      };

  factory SavedTripSummary.fromJson(Map<String, dynamic> json) {
    return SavedTripSummary(
      id: json['id'] as String,
      title: json['title'] as String? ?? 'Trip',
      dateRange: json['dateRange'] as String? ?? '',
      experienceCount: json['experienceCount'] as int? ?? 0,
      moodTags: (json['moodTags'] as List<dynamic>? ?? const [])
          .map((e) => e.toString())
          .toList(),
      timelineStatus: json['timelineStatus'] as String? ?? '',
      cityId: json['cityId'] as String? ?? 'orlando',
      routeOptimized: json['routeOptimized'] as bool? ?? false,
      weatherWindow: json['weatherWindow'] as String?,
      nextExperience: json['nextExperience'] as String?,
      sunsetWindow: json['sunsetWindow'] as String?,
      timelineSnapshot: json['timelineSnapshot'] as String?,
      liveWeatherNote: json['liveWeatherNote'] as String?,
      userCreated: json['userCreated'] as bool? ?? false,
    );
  }
}

const savedTripSummaries = [
  SavedTripSummary(
    id: 'orlando-golden',
    title: 'Orlando Golden Escape',
    dateRange: 'Mar 14 – Mar 18',
    experienceCount: 8,
    moodTags: ['Romantic', 'Sunset-ready'],
    timelineStatus: 'Timeline ready',
    cityId: 'orlando',
    routeOptimized: true,
    weatherWindow: 'Clear evenings Thu–Sat',
    nextExperience: 'Rooftop sunset dinner — Winter Park',
    sunsetWindow: 'Best light ~6:38–7:12 PM Thu',
    timelineSnapshot: 'Spa morning → hidden spring → golden-hour dinner',
    liveWeatherNote: 'Live: clear skies, light breeze — rooftop ideal tonight',
  ),
  SavedTripSummary(
    id: 'florida-family',
    title: 'Florida Family Wonder',
    dateRange: 'Apr 2 – Apr 9',
    experienceCount: 11,
    moodTags: ['Family bonding', 'Springs'],
    timelineStatus: 'Building itinerary',
    cityId: 'orlando',
    routeOptimized: false,
    weatherWindow: 'Afternoon showers likely Tue',
    nextExperience: 'Crystal spring float — Apopka (early slot)',
    sunsetWindow: 'Flexible — indoor backup if showers',
    timelineSnapshot: 'Park rhythm day → spring dip → easy bistro night',
    liveWeatherNote: 'Live: 40% showers Tue 2–5 PM — springs best before noon',
  ),
];

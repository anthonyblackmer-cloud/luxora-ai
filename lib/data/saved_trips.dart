import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/util/trip_date_format.dart';

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
    this.startDate = '',
    this.endDate = '',
    this.routeOptimized = false,
    this.weatherWindow,
    this.nextExperience,
    this.sunsetWindow,
    this.timelineSnapshot,
    this.liveWeatherNote,
    this.userCreated = false,
    this.updatedAtMs = 0,
  });

  final String id;
  final String title;
  final String dateRange;
  final int experienceCount;
  final List<String> moodTags;
  final String timelineStatus;
  final String cityId;

  /// ISO `yyyy-MM-dd` — used for editing and dedupe.
  final String startDate;
  final String endDate;

  final bool routeOptimized;
  final String? weatherWindow;
  final String? nextExperience;
  final String? sunsetWindow;
  final String? timelineSnapshot;
  final String? liveWeatherNote;

  /// True when this trip was generated from a user onboarding flow (vs. a
  /// seeded showcase trip).
  final bool userCreated;

  /// Milliseconds since epoch — used for cloud merge conflict resolution.
  final int updatedAtMs;

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

  /// Stable key for preventing duplicate cards (same trip, new timestamp id).
  String get dedupeKey => userCreated
      ? '$cityId|$title|$startDate|$endDate'
      : id;

  /// Stable storage id for a trip built from onboarding [TripProfile].
  static String idForProfile(TripProfile profile) {
    String slug(String raw) =>
        raw.trim().toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '-');
    final dest = slug(
      profile.destination.trim().isEmpty ? 'florida' : profile.destination,
    );
    final start = slug(profile.startDate);
    final end = slug(profile.endDate);
    return 'trip-${profile.cityId}-$dest-$start-$end';
  }

  SavedTripSummary copyWith({
    String? id,
    String? title,
    String? dateRange,
    int? experienceCount,
    List<String>? moodTags,
    String? timelineStatus,
    String? cityId,
    String? startDate,
    String? endDate,
    bool? routeOptimized,
    String? weatherWindow,
    String? nextExperience,
    String? sunsetWindow,
    String? timelineSnapshot,
    String? liveWeatherNote,
    bool? userCreated,
    int? updatedAtMs,
  }) {
    return SavedTripSummary(
      id: id ?? this.id,
      title: title ?? this.title,
      dateRange: dateRange ?? this.dateRange,
      experienceCount: experienceCount ?? this.experienceCount,
      moodTags: moodTags ?? this.moodTags,
      timelineStatus: timelineStatus ?? this.timelineStatus,
      cityId: cityId ?? this.cityId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      routeOptimized: routeOptimized ?? this.routeOptimized,
      weatherWindow: weatherWindow ?? this.weatherWindow,
      nextExperience: nextExperience ?? this.nextExperience,
      sunsetWindow: sunsetWindow ?? this.sunsetWindow,
      timelineSnapshot: timelineSnapshot ?? this.timelineSnapshot,
      liveWeatherNote: liveWeatherNote ?? this.liveWeatherNote,
      userCreated: userCreated ?? this.userCreated,
      updatedAtMs: updatedAtMs ?? this.updatedAtMs,
    );
  }

  /// Builds a fresh trip card from a completed onboarding [TripProfile].
  factory SavedTripSummary.fromProfile(
    TripProfile profile, {
    String? id,
    String localeName = 'en',
    required String flexibleDateLabel,
  }) {
    final destination =
        profile.destination.trim().isEmpty ? 'Florida' : profile.destination.trim();
    final start = profile.startDate.trim();
    final end = profile.endDate.trim();
    final dateRange = TripDateFormat.displayRange(
      startIso: start,
      endIso: end,
      localeName: localeName,
      flexibleLabel: flexibleDateLabel,
    );
    return SavedTripSummary(
      id: id ?? idForProfile(profile),
      title: '$destination Escape',
      dateRange: dateRange,
      startDate: start,
      endDate: end,
      experienceCount: 0,
      moodTags: profile.moods.map(_moodLabel).toList(),
      timelineStatus: 'Building itinerary',
      cityId: profile.cityId,
      userCreated: true,
      updatedAtMs: DateTime.now().millisecondsSinceEpoch,
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
        'startDate': startDate,
        'endDate': endDate,
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
        'updatedAtMs': updatedAtMs,
      };

  factory SavedTripSummary.fromJson(Map<String, dynamic> json) {
    return SavedTripSummary(
      id: json['id'] as String,
      title: json['title'] as String? ?? 'Trip',
      dateRange: json['dateRange'] as String? ?? '',
      startDate: json['startDate'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
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
      updatedAtMs: json['updatedAtMs'] as int? ?? 0,
    );
  }
}

const savedTripSummaries = [
  SavedTripSummary(
    id: 'orlando-golden',
    title: 'Orlando Golden Escape',
    dateRange: 'Mar 14 – Mar 18',
    startDate: '2026-03-14',
    endDate: '2026-03-18',
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
    startDate: '2026-04-02',
    endDate: '2026-04-09',
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

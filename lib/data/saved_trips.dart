/// Saved trip collections — rich status for a living dashboard.
class SavedTripSummary {
  const SavedTripSummary({
    required this.id,
    required this.title,
    required this.dateRange,
    required this.experienceCount,
    required this.moodTags,
    required this.timelineStatus,
    this.routeOptimized = false,
    this.weatherWindow,
    this.nextExperience,
    this.sunsetWindow,
    this.timelineSnapshot,
    this.liveWeatherNote,
  });

  final String id;
  final String title;
  final String dateRange;
  final int experienceCount;
  final List<String> moodTags;
  final String timelineStatus;
  final bool routeOptimized;
  final String? weatherWindow;
  final String? nextExperience;
  final String? sunsetWindow;
  final String? timelineSnapshot;
  final String? liveWeatherNote;

  String get statusLine {
    final parts = <String>[
      '$experienceCount experiences',
      if (routeOptimized) 'Route optimized',
      ...moodTags.take(2),
      ?weatherWindow,
    ];
    return parts.join(' · ');
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
    routeOptimized: false,
    weatherWindow: 'Afternoon showers likely Tue',
    nextExperience: 'Crystal spring float — Apopka (early slot)',
    sunsetWindow: 'Flexible — indoor backup if showers',
    timelineSnapshot: 'Park rhythm day → spring dip → easy bistro night',
    liveWeatherNote: 'Live: 40% showers Tue 2–5 PM — springs best before noon',
  ),
];

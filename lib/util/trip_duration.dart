import 'package:luxora_ai/models/trip_profile.dart';

/// Inclusive calendar-day count from onboarding ISO dates (`yyyy-MM-dd`).
int tripDaysFromProfile(TripProfile profile) {
  final start = _parseIsoDate(profile.startDate);
  final end = _parseIsoDate(profile.endDate);
  if (start == null || end == null) return 0;
  if (!end.isAfter(start) && !end.isAtSameMomentAs(start)) return 0;
  return end.difference(start).inDays + 1;
}

DateTime? _parseIsoDate(String raw) {
  final trimmed = raw.trim();
  if (trimmed.isEmpty) return null;
  return DateTime.tryParse(trimmed);
}

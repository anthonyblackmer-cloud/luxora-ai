import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/smart_itinerary/experience_duration_catalog.dart';

/// Typical local operating windows for itinerary scheduling (editorial defaults).
class VenueHoursWindow {
  const VenueHoursWindow({
    required this.openHour,
    required this.openMinute,
    required this.closeHour,
    required this.closeMinute,
  });

  final int openHour;
  final int openMinute;
  final int closeHour;
  final int closeMinute;
}

/// Maps places and categories to realistic visit windows so Luxora never
/// schedules Ripley's at 1 AM.
abstract final class VenueHoursCatalog {
  static const _defaultDaytime = VenueHoursWindow(
    openHour: 9,
    openMinute: 0,
    closeHour: 21,
    closeMinute: 0,
  );

  static const _indoorAttraction = VenueHoursWindow(
    openHour: 10,
    openMinute: 0,
    closeHour: 21,
    closeMinute: 0,
  );

  static const _themePark = VenueHoursWindow(
    openHour: 9,
    openMinute: 0,
    closeHour: 22,
    closeMinute: 0,
  );

  static const _dining = VenueHoursWindow(
    openHour: 11,
    openMinute: 0,
    closeHour: 22,
    closeMinute: 30,
  );

  static const _nightlife = VenueHoursWindow(
    openHour: 17,
    openMinute: 0,
    closeHour: 2,
    closeMinute: 0,
  );

  static const _springsNature = VenueHoursWindow(
    openHour: 8,
    openMinute: 0,
    closeHour: 18,
    closeMinute: 0,
  );

  static const _indoorAttractionIds = {
    'place-ripleys-orlando',
    'place-sealife-orlando',
    'place-madame-tussauds-orlando',
    'place-crayola-experience',
    'place-wonderworks-orlando',
    'place-florida-aquarium',
    'place-florida-aquarium-tampa-bay',
  };

  static VenueHoursWindow forPlace(LuxPlace place) {
    if (_indoorAttractionIds.contains(place.id)) {
      return _indoorAttraction;
    }
    if (ExperienceDurationCatalog.isMajorThemePark(place.id)) {
      return _themePark;
    }
    return switch (place.category) {
      LuxPlaceCategory.dining || LuxPlaceCategory.romantic => _dining,
      LuxPlaceCategory.nightlife => _nightlife,
      LuxPlaceCategory.springs ||
      LuxPlaceCategory.nature ||
      LuxPlaceCategory.beach =>
        _springsNature,
      LuxPlaceCategory.family || LuxPlaceCategory.adventure => _indoorAttraction,
      LuxPlaceCategory.wellness => VenueHoursWindow(
        openHour: 9,
        openMinute: 0,
        closeHour: 20,
        closeMinute: 0,
      ),
      _ => _defaultDaytime,
    };
  }

  static DateTime openAt(VenueHoursWindow window, DateTime dayAnchor) =>
      DateTime(
        dayAnchor.year,
        dayAnchor.month,
        dayAnchor.day,
        window.openHour,
        window.openMinute,
      );

  static DateTime closeAt(VenueHoursWindow window, DateTime dayAnchor) {
    var close = DateTime(
      dayAnchor.year,
      dayAnchor.month,
      dayAnchor.day,
      window.closeHour,
      window.closeMinute,
    );
    if (window.closeHour < window.openHour) {
      close = close.add(const Duration(days: 1));
    }
    return close;
  }

  static bool isOpenDuring({
    required LuxPlace place,
    required DateTime start,
    required DateTime end,
  }) {
    final dayAnchor = DateTime(start.year, start.month, start.day);
    final window = forPlace(place);
    final open = openAt(window, dayAnchor);
    final close = closeAt(window, dayAnchor);
    return !start.isBefore(open) && !end.isAfter(close);
  }
}

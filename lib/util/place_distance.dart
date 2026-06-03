import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';

const _distance = Distance();

/// Great-circle distance helpers from the active city pack hub.
abstract final class PlaceDistance {
  /// Active city pack map center (replaces hard-coded Orlando).
  static LatLng get hubCenter => CityPackRegistry.instance.hubCenter;

  /// Legacy alias — same as [hubCenter].
  static LatLng get orlandoCenter => hubCenter;

  static double milesFromHub(LuxPlace place) {
    return milesBetween(
      hubCenter,
      LatLng(place.latitude, place.longitude),
    );
  }

  /// Legacy alias.
  static double milesFromOrlandoHub(LuxPlace place) => milesFromHub(place);

  static double milesBetween(LatLng from, LatLng to) {
    return _distance.as(LengthUnit.Mile, from, to);
  }

  static String milesLabel(double miles) {
    if (miles < 1) {
      return '<1 mi';
    }
    if (miles < 10) {
      return '${miles.toStringAsFixed(1)} mi';
    }
    return '${miles.round()} mi';
  }

  static String driveTimeFromHubLabel(LuxPlace place) {
    return driveTimeLabel(milesFromHub(place));
  }

  /// Legacy alias.
  static String driveTimeFromOrlandoLabel(LuxPlace place) =>
      driveTimeFromHubLabel(place);

  static String driveTimeLabel(double miles) {
    final minutes = driveMinutesForMiles(miles);
    if (minutes < 5) {
      return '<5 min';
    }
    if (minutes < 60) {
      return '$minutes min';
    }
    final hours = minutes ~/ 60;
    final rem = minutes % 60;
    return rem == 0 ? '${hours}h' : '${hours}h ${rem}m';
  }

  /// Rough drive minutes at ~45 mph (minimum 5 for sequencing).
  static int driveMinutesBetween(LatLng from, LatLng to) =>
      driveMinutesForMiles(milesBetween(from, to));

  static int driveMinutesForMiles(double miles) {
    const avgMph = 45.0;
    return (miles / avgMph * 60).ceil().clamp(5, 120);
  }
}

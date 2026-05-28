import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/data/orlando_hub.dart';
import 'package:luxora_ai/models/lux_place.dart';

const _distance = Distance();

/// Great-circle distance helpers from the Orlando hub.
abstract final class PlaceDistance {
  static LatLng get orlandoCenter =>
      const LatLng(OrlandoHub.latitude, OrlandoHub.longitude);

  static double milesFromOrlandoHub(LuxPlace place) {
    return milesBetween(
      orlandoCenter,
      LatLng(place.latitude, place.longitude),
    );
  }

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
}

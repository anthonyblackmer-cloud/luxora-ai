import 'package:luxora_ai/data/orlando/orlando_experience_moments.dart';
import 'package:luxora_ai/models/experience_moment.dart';

/// City-pack experience moment catalogs — one editorial list per destination.
abstract final class ExperienceMomentsRegistry {
  static List<ExperienceMoment> forCity(String cityId) {
    return switch (cityId) {
      'orlando' => OrlandoExperienceMomentsCatalog.all,
      _ => const [],
    };
  }

  static List<ExperienceMoment> forPlace(String cityId, String placeId) {
    return forCity(cityId)
        .where((moment) => moment.placeId == placeId)
        .toList(growable: false);
  }
}

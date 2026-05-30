import 'package:luxora_ai/data/feed_items.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/data/miami/miami_content.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';

/// Active city pack editorial catalogs — keeps Orlando/Miami feed & gems separate.
abstract final class CityContentCatalog {
  static List<FeedItem> discoveryFeedForActive() {
    final cityId = CityPackRegistry.instance.active.cityId;
    if (cityId == MiamiContent.cityId) {
      return MiamiContent.feedItems;
    }
    return discoveryFeed;
  }

  static List<HiddenGem> hiddenGemsForActive() {
    final cityId = CityPackRegistry.instance.active.cityId;
    if (cityId == MiamiContent.cityId) {
      return MiamiContent.gems;
    }
    return hiddenGemsCatalog;
  }
}

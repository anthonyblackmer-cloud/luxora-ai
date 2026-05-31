import 'package:luxora_ai/data/destin_30a/destin_30a_content.dart';
import 'package:luxora_ai/data/feed_items.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/data/florida_keys/florida_keys_content.dart';
import 'package:luxora_ai/data/miami/miami_content.dart';
import 'package:luxora_ai/data/naples/naples_content.dart';
import 'package:luxora_ai/data/nyc/nyc_content.dart';
import 'package:luxora_ai/data/st_augustine/st_augustine_content.dart';import 'package:luxora_ai/data/tampa_bay/tampa_bay_content.dart';
import 'package:luxora_ai/data/vegas/vegas_content.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/orlando_addon_service.dart';

/// Active city pack editorial catalogs — keeps Orlando/Miami feed & gems separate.
abstract final class CityContentCatalog {
  static List<FeedItem> discoveryFeedForActive() {
    final cityId = CityPackRegistry.instance.active.cityId;
    if (cityId == StAugustineContent.cityId) {
      return StAugustineContent.feedItems;
    }
    if (cityId == NaplesContent.cityId) {
      return NaplesContent.feedItems;
    }
    if (cityId == Destin30aContent.cityId) {
      return Destin30aContent.feedItems;
    }
    if (cityId == VegasContent.cityId) {
      return VegasContent.feedItems;
    }
    if (cityId == NycContent.cityId) {
      return NycContent.feedItems;
    }
    if (cityId == TampaBayContent.cityId) {
      return TampaBayContent.feedItems;
    }    if (cityId == MiamiContent.cityId) {
      return MiamiContent.feedItems;
    }
    if (cityId == FloridaKeysContent.cityId) {
      return FloridaKeysContent.feedItems;
    }
    return discoveryFeed
        .where((item) => OrlandoAddonService.isFeedItemAccessible(item.id))
        .toList();
  }

  static List<HiddenGem> hiddenGemsForActive() =>
      [...curatedGemsForActive(), ...curatedLocalSecretsForActive()];

  /// Hidden gems only — excludes editorial local-secret entries.
  static List<HiddenGem> curatedGemsForActive() {
    final cityId = CityPackRegistry.instance.active.cityId;
    if (cityId == TampaBayContent.cityId) {
      return TampaBayContent.gems;
    }
    if (cityId == VegasContent.cityId) {
      return VegasContent.gems;
    }
    if (cityId == MiamiContent.cityId) {
      return MiamiContent.gems;
    }
    if (cityId == FloridaKeysContent.cityId) {
      return FloridaKeysContent.gems;
    }
    return hiddenGemsCatalog;
  }

  static List<HiddenGem> curatedLocalSecretsForActive() {
    final cityId = CityPackRegistry.instance.active.cityId;
    if (cityId == TampaBayContent.cityId) {
      return TampaBayContent.localSecrets;
    }
    if (cityId == VegasContent.cityId) {
      return VegasContent.localSecrets;
    }
    return const [];
  }
}

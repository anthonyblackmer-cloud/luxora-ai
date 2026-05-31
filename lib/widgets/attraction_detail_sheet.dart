import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/data/local_secrets_registry.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/attraction_detail.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/attraction_detail_repository.dart';
import 'package:luxora_ai/services/home_base_store.dart';
import 'package:luxora_ai/services/map_launcher.dart';
import 'package:luxora_ai/services/florida_keys_concierge_service.dart';
import 'package:luxora_ai/services/miami_concierge_service.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/saved_places_storage.dart';
import 'package:luxora_ai/util/place_distance.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/florida_keys/keys_concierge_cards.dart';
import 'package:luxora_ai/widgets/miami/miami_concierge_cards.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';
import 'package:luxora_ai/widgets/travel_stop_intel_card.dart';
import 'package:luxora_ai/util/destination_share_content.dart';
import 'package:luxora_ai/util/share_precache_urls.dart';
import 'package:luxora_ai/widgets/visual_share_icon_button.dart';
import 'package:luxora_ai/widgets/settings/luxora_premium_sheet_shell.dart';

Future<void> showAttractionDetailSheet(
  BuildContext context, {
  required LuxPlace place,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) => FractionallySizedBox(
      heightFactor: 0.94,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 920),
          child: _AttractionDetailSheet(place: place),
        ),
      ),
    ),
  );
}

class _AttractionDetailSheet extends StatelessWidget {
  const _AttractionDetailSheet({required this.place});

  final LuxPlace place;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final detail = AttractionDetailRepository.instance.forPlace(place);
    final nearby = detail.nearbyGemPlaceIds
        .map(PlacesRepository.instance.byId)
        .whereType<LuxPlace>()
        .take(3)
        .toList();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFF0C0A09),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 8, 2),
            child: Row(
              children: [
                const SizedBox(width: 76),
                Expanded(
                  child: Center(
                    child: Container(
                      width: 42,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                VisualShareIconButton(
                  subject: catalogText(context, detail.title),
                  fileName: 'luxora_destination.png',
                  shareWidth: 420,
                  loadNetworkAssets: true,
                  precacheNetworkUrls: sharePrecacheUrlsForPlace(
                    latitude: place.latitude,
                    longitude: place.longitude,
                  ),
                  color: LuxColors.gold,
                  background: LuxColors.gold.withValues(alpha: 0.12),
                  cardBuilder: (ctx) => buildDestinationShareCard(
                    ctx,
                    place: place,
                    detail: detail,
                  ),
                ),
                const SizedBox(width: 4),
                _SaveButton(place: place),
                const SizedBox(width: 4),
                LuxSheetCloseButton(
                  color: LuxColors.cream,
                  background: Colors.white.withValues(alpha: 0.06),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 22),
              children: [
                LuxPlaceImage(
                  place: place,
                  presentation: LuxImagePresentation.detailHero,
                  borderRadius: BorderRadius.circular(18),
                  bottomCaption: catalogText(context, place.location),
                ),
                const SizedBox(height: 18),
                Text(
                  catalogText(context, detail.title),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  catalogText(context, detail.emotionalHook),
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.45,
                    color: LuxColors.stone300,
                  ),
                ),
                const SizedBox(height: 16),
                _LocationCard(
                  place: place,
                  officialMapUrl: detail.officialMapUrl,
                ),
                const SizedBox(height: 12),
                TravelStopIntelCard(place: place),
                if (MiamiBeachIntelligenceService.forPlace(place.id)
                    case final beachIntel?) ...[
                  const SizedBox(height: 12),
                  MiamiBeachIntelCard(intel: beachIntel),
                ],
                if (KeysWaterIntelligenceService.forPlace(place.id)
                    case final waterIntel?) ...[
                  const SizedBox(height: 12),
                  KeysWaterIntelCard(intel: waterIntel),
                ],
                if (MiamiNightlifeService.forPlace(place.id)
                    case final nightlife?) ...[
                  const SizedBox(height: 12),
                  MiamiNightlifeCard(venue: nightlife),
                ],
                if (place.category == LuxPlaceCategory.hotel) ...[
                  const SizedBox(height: 12),
                  _HomeBaseButton(place: place),
                ],
                const SizedBox(height: 12),
                _SectionCard(
                  title: l.detailWhySpecial,
                  body: catalogText(context, detail.whySpecial),
                ),
                _SectionCard(
                  title: l.detailBestTime,
                  body: catalogText(context, detail.bestTimeToGo),
                ),
                _SectionCard(
                  title: l.detailInsiderTips,
                  body: catalogText(context, detail.insiderTips),
                ),
                if (_localSecret(l, place) case final secret?)
                  _SectionCard(
                    title: l.localSecretTitle,
                    body: secret,
                  ),
                if (detail.menu.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  _MenuCard(items: detail.menu),
                ] else if (place.category == LuxPlaceCategory.dining) ...[
                  const SizedBox(height: 12),
                  _MenuComingSoon(place: place),
                ],
                const SizedBox(height: 12),
                _PracticalDetails(details: detail.practicalDetails),
                const SizedBox(height: 14),
                _VibeChips(tags: detail.vibeMatch),
                const SizedBox(height: 14),
                if (nearby.isNotEmpty) _NearbyGems(places: nearby, l10n: l),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({required this.place});

  final LuxPlace place;

  Future<void> _toggle(BuildContext context) async {
    final l = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final nowSaved = await SavedPlacesStorage.instance.toggle(place.id);
    messenger.showSnackBar(
      SnackBar(
        content: Text(nowSaved ? l.detailSavedSnack : l.detailRemovedSnack),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return ValueListenableBuilder<Set<String>>(
      valueListenable: SavedPlacesStorage.instance.savedIds,
      builder: (context, ids, _) {
        final saved = ids.contains(place.id);
        return Semantics(
          button: true,
          label: saved ? l.detailSaved : l.detailSaveToItinerary,
          child: Material(
            color: saved
                ? LuxColors.gold.withValues(alpha: 0.18)
                : Colors.white.withValues(alpha: 0.06),
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => _toggle(context),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  saved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                  size: 20,
                  color: saved ? LuxColors.gold : LuxColors.cream,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _HomeBaseButton extends StatelessWidget {
  const _HomeBaseButton({required this.place});

  final LuxPlace place;

  Future<void> _toggle(BuildContext context) async {
    final l = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final nowSet = await HomeBaseStore.instance.toggle(place.id);
    messenger.showSnackBar(
      SnackBar(
        content: Text(nowSet ? l.detailHomeBaseSetSnack : l.detailHomeBaseClearedSnack),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return ValueListenableBuilder<String?>(
      valueListenable: HomeBaseStore.instance.placeId,
      builder: (context, homeId, _) {
        final isBase = homeId == place.id;
        return Material(
          color: isBase
              ? LuxColors.gold.withValues(alpha: 0.16)
              : Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(14),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => _toggle(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
              child: Row(
                children: [
                  Icon(
                    isBase ? Icons.home_rounded : Icons.home_outlined,
                    size: 20,
                    color: isBase ? LuxColors.gold : LuxColors.cream,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isBase ? l.detailHomeBaseActive : l.detailSetHomeBase,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: isBase ? LuxColors.gold : LuxColors.cream,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          l.detailHomeBaseHint,
                          style: const TextStyle(
                            fontSize: 12,
                            height: 1.3,
                            color: LuxColors.stone400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isBase)
                    const Icon(
                      Icons.check_circle_rounded,
                      size: 18,
                      color: LuxColors.gold,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LocationCard extends StatelessWidget {
  const _LocationCard({required this.place, this.officialMapUrl});

  final LuxPlace place;
  final String? officialMapUrl;

  Future<void> _openOfficialMap(BuildContext context) async {
    final l = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final ok = await MapLauncher.openUrl(officialMapUrl!);
    if (!ok) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(l.detailMapsError),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _launch(
    BuildContext context, {
    required bool directions,
    required MapsProvider provider,
  }) async {
    final l = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final ok = directions
        ? await MapLauncher.openDirections(
            latitude: place.latitude,
            longitude: place.longitude,
            provider: provider,
          )
        : await MapLauncher.openPlace(
            latitude: place.latitude,
            longitude: place.longitude,
            label: place.title,
            provider: provider,
          );
    if (!ok) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(l.detailMapsError),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _chooseProvider(
    BuildContext context, {
    required bool directions,
  }) async {
    final l = context.l10n;
    final provider = await showModalBottomSheet<MapsProvider>(
      context: context,
      backgroundColor: const Color(0xFF12100F),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Container(
              width: 42,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  l.detailOpenInMaps,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: LuxColors.cream,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.map_rounded, color: LuxColors.gold),
              title: Text(l.detailGoogleMaps),
              onTap: () => Navigator.of(ctx).pop(MapsProvider.google),
            ),
            ListTile(
              leading: const Icon(Icons.map_outlined, color: LuxColors.gold),
              title: Text(l.detailAppleMaps),
              onTap: () => Navigator.of(ctx).pop(MapsProvider.apple),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
    if (provider != null && context.mounted) {
      await _launch(context, directions: directions, provider: provider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final miles = PlaceDistance.milesFromOrlandoHub(place);
    final driveTime = PlaceDistance.driveTimeFromOrlandoLabel(place);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white.withValues(alpha: 0.04),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
            child: _MiniMap(
              place: place,
              onTap: () => _chooseProvider(context, directions: false),
            ),
          ),
          InkWell(
            onTap: () => _chooseProvider(context, directions: false),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  const Icon(
                    Icons.place_rounded,
                    size: 20,
                    color: LuxColors.gold,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l.detailLocation,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.4,
                            color: LuxColors.gold.withValues(alpha: 0.9),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          catalogText(context, place.location),
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.35,
                            color: LuxColors.cream,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    l.detailViewOnMap,
                    style: const TextStyle(
                      fontSize: 12,
                      color: LuxColors.stone400,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.north_east_rounded,
                    size: 14,
                    color: LuxColors.stone400,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
            child: Row(
              children: [
                const Icon(
                  Icons.directions_car_rounded,
                  size: 15,
                  color: LuxColors.stone400,
                ),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    '${PlaceDistance.milesLabel(miles)} · '
                    '${l.detailDriveFromActiveHub(driveTime)}',
                    style: const TextStyle(
                      fontSize: 12.5,
                      color: LuxColors.stone400,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _chooseProvider(context, directions: true),
                    icon: const Icon(Icons.directions_rounded, size: 18),
                    label: Text(l.detailGetDirections),
                  ),
                ),
                if (officialMapUrl != null) ...[
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _openOfficialMap(context),
                      icon: const Icon(Icons.map_rounded, size: 18),
                      label: Text(l.detailParkMap),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniMap extends StatelessWidget {
  const _MiniMap({required this.place, required this.onTap});

  final LuxPlace place;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final center = LatLng(place.latitude, place.longitude);
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          children: [
            FlutterMap(
              options: MapOptions(
                initialCenter: center,
                initialZoom: 14,
                interactionOptions:
                    const InteractionOptions(flags: InteractiveFlag.none),
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.luxora.luxora_ai',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: center,
                      width: 40,
                      height: 40,
                      child: const Icon(
                        Icons.location_on,
                        color: LuxColors.gold,
                        size: 36,
                        shadows: [Shadow(color: Colors.black, blurRadius: 6)],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: 8,
              bottom: 8,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.open_in_full_rounded,
                        size: 12,
                        color: LuxColors.cream,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        context.l10n.detailViewOnMap,
                        style: const TextStyle(
                          fontSize: 11,
                          color: LuxColors.cream,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white.withValues(alpha: 0.04),
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.4,
                color: LuxColors.gold.withValues(alpha: 0.9),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              body,
              style: const TextStyle(
                fontSize: 14,
                height: 1.45,
                color: LuxColors.stone300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  const _MenuCard({required this.items});

  final List<MenuItem> items;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    // Group items by course, preserving first-seen order.
    final courses = <String, List<MenuItem>>{};
    for (final item in items) {
      courses.putIfAbsent(item.course, () => []).add(item);
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white.withValues(alpha: 0.04),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.restaurant_menu_rounded,
                size: 18,
                color: LuxColors.gold,
              ),
              const SizedBox(width: 8),
              Text(
                l.detailMenuTitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.4,
                  color: LuxColors.gold.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
          for (final entry in courses.entries) ...[
            const SizedBox(height: 14),
            Text(
              entry.key,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: LuxColors.cream,
              ),
            ),
            const SizedBox(height: 6),
            for (final item in entry.value)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: LuxColors.cream,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item.description,
                            style: const TextStyle(
                              fontSize: 12.5,
                              height: 1.35,
                              color: LuxColors.stone400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      item.price,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: LuxColors.gold,
                      ),
                    ),
                  ],
                ),
              ),
          ],
          const SizedBox(height: 12),
          Text(
            l.detailMenuDisclaimer,
            style: TextStyle(
              fontSize: 11,
              fontStyle: FontStyle.italic,
              color: LuxColors.stone500,
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuComingSoon extends StatelessWidget {
  const _MenuComingSoon({required this.place});

  final LuxPlace place;

  Future<void> _openMenuSearch(BuildContext context) async {
    final l = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    // Prefer the venue's real website (from the OSM import) over a web search.
    final website = place.website;
    final target = (website != null && website.isNotEmpty)
        ? website
        : 'https://www.google.com/search?q='
            '${Uri.encodeComponent('${place.title} menu ${place.location}')}';
    final ok = await MapLauncher.openUrl(target);
    if (!ok) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(l.detailMapsError),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white.withValues(alpha: 0.04),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.restaurant_menu_rounded,
                size: 18,
                color: LuxColors.gold,
              ),
              const SizedBox(width: 8),
              Text(
                l.detailMenuTitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.4,
                  color: LuxColors.gold.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            l.detailMenuComingSoon,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.4,
              color: LuxColors.stone300,
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => _openMenuSearch(context),
            icon: const Icon(Icons.open_in_new_rounded, size: 18),
            label: Text(l.detailViewMenuOnline),
          ),
        ],
      ),
    );
  }
}

class _PracticalDetails extends StatelessWidget {
  const _PracticalDetails({required this.details});

  final AttractionPracticalDetails details;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: LuxColors.gold.withValues(alpha: 0.08),
        border: Border.all(color: LuxColors.gold.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.detailPractical,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.4,
              color: LuxColors.gold,
            ),
          ),
          const SizedBox(height: 8),
          _detailRow(context.l10n.detailDuration, details.typicalDuration),
          _detailRow(
            context.l10n.detailCostRange,
            catalogText(context, details.costRange),
          ),
          _detailRow(
            context.l10n.detailBestFor,
            details.bestFor.map((v) => catalogText(context, v)).join(', '),
          ),
        ],
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 78,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: LuxColors.stone500,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: LuxColors.stone300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _VibeChips extends StatelessWidget {
  const _VibeChips({required this.tags});

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.detailVibeMatch,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: LuxColors.stone500,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: tags
              .map(
                (t) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                  ),
                  child: Text(
                    catalogText(context, t),
                    style: const TextStyle(
                      fontSize: 12,
                      color: LuxColors.cream,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _NearbyGems extends StatelessWidget {
  const _NearbyGems({required this.places, required this.l10n});

  final List<LuxPlace> places;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.detailNearbyGems,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: LuxColors.stone500,
          ),
        ),
        const SizedBox(height: 8),
        ...places.map(
          (p) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => showAttractionDetailSheet(context, place: p),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white.withValues(alpha: 0.04),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        catalogText(context, p.title),
                        style: const TextStyle(
                          fontSize: 13,
                          color: LuxColors.stone300,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                      color: LuxColors.gold,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String? _localSecret(AppLocalizations l, LuxPlace place) {
  final key = LocalSecretsRegistry.l10nKeyFor(place);
  if (key == null) return null;
  return switch (key) {
    'localSecretWinterParkParkAvenue' => l.localSecretWinterParkParkAvenue,
    'localSecretWorldFoodTrucks' => l.localSecretWorldFoodTrucks,
    'localSecretWekiwaSprings' => l.localSecretWekiwaSprings,
    'localSecretDisneySpringsParking' => l.localSecretDisneySpringsParking,
    'localSecretLakeEolaSunset' => l.localSecretLakeEolaSunset,
    _ => null,
  };
}

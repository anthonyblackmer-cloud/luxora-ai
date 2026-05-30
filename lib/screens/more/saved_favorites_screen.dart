import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/saved_places_storage.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/attraction_detail_sheet.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_secondary_app_bar.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';

class SavedFavoritesScreen extends StatelessWidget {
  const SavedFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: LuxSecondaryAppBar(title: l.savedFavoritesTitle),
      body: ValueListenableBuilder<Set<String>>(
        valueListenable: SavedPlacesStorage.instance.savedIds,
        builder: (context, ids, _) {
          final places = [
            for (final id in ids)
              if (PlacesRepository.instance.byId(id) case final p?) p,
          ]..sort((a, b) => a.title.compareTo(b.title));

          if (places.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  l.savedFavoritesEmpty,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: LuxColors.stone400,
                    height: 1.45,
                  ),
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            itemCount: places.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) {
              final place = places[i];
              return GlassCard(
                padding: EdgeInsets.zero,
                child: InkWell(
                  onTap: () => showAttractionDetailSheet(context, place: place),
                  borderRadius: BorderRadius.circular(16),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 96,
                        height: 96,
                        child: LuxPlaceImage(
                          place: place,
                          presentation: LuxImagePresentation.timelineThumb,
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(16),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                place.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: LuxColors.cream,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                catalogText(context, place.location),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: LuxColors.stone400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Icon(
                          Icons.favorite_rounded,
                          color: LuxColors.gold,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

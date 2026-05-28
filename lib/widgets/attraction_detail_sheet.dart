import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/attraction_detail.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/attraction_detail_repository.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';
import 'package:luxora_ai/widgets/lux_button.dart';

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
            padding: const EdgeInsets.only(top: 10, bottom: 6),
            child: Container(
              width: 42,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
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
                const SizedBox(height: 12),
                _PracticalDetails(details: detail.practicalDetails),
                const SizedBox(height: 14),
                _VibeChips(tags: detail.vibeMatch),
                const SizedBox(height: 14),
                if (nearby.isNotEmpty) _NearbyGems(places: nearby, l10n: l),
                const SizedBox(height: 18),
                LuxButton(
                  label: l.detailReserve,
                  icon: Icons.calendar_month_rounded,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l.detailReserveSoon),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
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

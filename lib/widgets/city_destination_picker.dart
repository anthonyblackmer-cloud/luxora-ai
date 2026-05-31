import 'package:flutter/material.dart';
import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/data/paywall_catalog.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/paywall/paywall_city_offer.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/iap_purchase_service.dart';
import 'package:luxora_ai/services/paywall_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Dropdown of Luxora destinations plus the Orlando theme-park add-on pack.
class CityDestinationPicker extends StatelessWidget {
  const CityDestinationPicker({
    super.key,
    required this.selectedCityId,
    required this.onChanged,
    this.showUnlockStatus = true,
    this.label,
    this.showOrlandoThemeParksAddon = true,
    this.limitedCityIds,
  });

  final String selectedCityId;
  final ValueChanged<String> onChanged;
  final bool showUnlockStatus;
  final String? label;

  /// When set, only these city packs appear (launch IAP listings).
  final Set<String>? limitedCityIds;

  /// Lists [OrlandoAddonCatalog.themeParks] under Orlando when true.
  final bool showOrlandoThemeParksAddon;

  static bool isThemeParksPickerValue(String id) =>
      OrlandoAddonCatalog.isThemeParksAddon(id);

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    final scheme = Theme.of(context).colorScheme;
    final offers = PaywallCatalog.uiSelectableOffers
        .where(
          (o) =>
              limitedCityIds == null || limitedCityIds!.contains(o.cityId),
        )
        .toList();
    final value = offers.any((o) => o.cityId == selectedCityId)
        ? selectedCityId
        : offers.first.cityId;
    final entries = _buildEntries(offers, showOrlandoThemeParksAddon);

    return ListenableBuilder(
      listenable: CityPackEntitlementStore.instance,
      builder: (context, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null) ...[
              Text(
                label!,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: tokens.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
            ],
            DropdownButtonFormField<String>(
              key: ValueKey(entries.map((e) => e.id).join(',')),
              initialValue: value,
              isExpanded: true,
              dropdownColor: tokens.bgSecondary,
              style: TextStyle(color: tokens.textPrimary),
              decoration: InputDecoration(
                filled: true,
                fillColor: scheme.surface.withValues(alpha: 0.72),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: tokens.accent.withValues(alpha: 0.2),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: tokens.accent.withValues(alpha: 0.2),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: tokens.accent.withValues(alpha: 0.54),
                  ),
                ),
              ),
              items: [
                for (final entry in entries)
                  DropdownMenuItem(
                    value: entry.id,
                    child: entry.isThemeParksAddon
                        ? _ThemeParksMenuRow(
                            showUnlockStatus: showUnlockStatus,
                            unlockedLabel: l.cityPickerUnlocked,
                            unlockPriceLabel: l.cityPickerUnlockPrice(
                              IapPurchaseService.instance
                                      .localizedPriceForAddon(
                                    OrlandoAddonCatalog.themeParks,
                                  ) ??
                                  OrlandoAddonCatalog.offer.formattedPrice,
                            ),
                            title: l.paywallAddonThemeParksTitle,
                            subtitle: l.cityPickerThemeParksSubtitle,
                          )
                        : _CityMenuRow(
                            offer: entry.cityOffer!,
                            showUnlockStatus: showUnlockStatus,
                            unlockedLabel: l.cityPickerUnlocked,
                            unlockPriceLabel: l.cityPickerUnlockPrice(
                              PaywallService.storePriceForCity(
                                    entry.cityOffer!.cityId,
                                  ) ??
                                  entry.cityOffer!.formattedPrice,
                            ),
                          ),
                  ),
              ],
              selectedItemBuilder: (context) {
                final selectedOffer = offers.firstWhere(
                  (o) => o.cityId == value,
                  orElse: () => offers.first,
                );
                final label =
                    '${selectedOffer.cityName} · ${selectedOffer.regionLabel}';
                return [
                  for (final _ in entries)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: tokens.textPrimary),
                      ),
                    ),
                ];
              },
              onChanged: (id) {
                if (id != null) onChanged(id);
              },
            ),
          ],
        );
      },
    );
  }

  static List<_PickerEntry> _buildEntries(
    List<PaywallCityOffer> offers,
    bool includeThemeParks,
  ) {
    final entries = <_PickerEntry>[];
    for (final offer in offers) {
      entries.add(_PickerEntry.city(offer));
      if (includeThemeParks &&
          offer.cityId == OrlandoAddonCatalog.parentCityId) {
        entries.add(_PickerEntry.themeParks());
      }
    }
    return entries;
  }
}

class _PickerEntry {
  const _PickerEntry._({
    required this.id,
    this.cityOffer,
    this.isThemeParksAddon = false,
  });

  factory _PickerEntry.city(PaywallCityOffer offer) =>
      _PickerEntry._(id: offer.cityId, cityOffer: offer);

  factory _PickerEntry.themeParks() => _PickerEntry._(
        id: OrlandoAddonCatalog.themeParks,
        isThemeParksAddon: true,
      );

  final String id;
  final PaywallCityOffer? cityOffer;
  final bool isThemeParksAddon;
}

class _CityMenuRow extends StatelessWidget {
  const _CityMenuRow({
    required this.offer,
    required this.showUnlockStatus,
    required this.unlockedLabel,
    required this.unlockPriceLabel,
  });

  final PaywallCityOffer offer;
  final bool showUnlockStatus;
  final String unlockedLabel;
  final String unlockPriceLabel;

  @override
  Widget build(BuildContext context) {
    final unlocked =
        CityPackEntitlementStore.instance.isUnlocked(offer.cityId);
    final tokens = luxThemeTokensOf(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            '${offer.cityName} · ${offer.regionLabel}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (showUnlockStatus) ...[
          const SizedBox(width: 8),
          Text(
            unlocked ? unlockedLabel : unlockPriceLabel,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: unlocked ? LuxColors.feedLive : tokens.accent,
            ),
          ),
        ],
      ],
    );
  }
}

class _ThemeParksMenuRow extends StatelessWidget {
  const _ThemeParksMenuRow({
    required this.showUnlockStatus,
    required this.unlockedLabel,
    required this.unlockPriceLabel,
    required this.title,
    required this.subtitle,
  });

  final bool showUnlockStatus;
  final String unlockedLabel;
  final String unlockPriceLabel;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final unlocked = CityPackEntitlementStore.instance
        .isAddonUnlocked(OrlandoAddonCatalog.themeParks);
    final tokens = luxThemeTokensOf(context);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  color: tokens.textMuted,
                ),
              ),
            ],
          ),
        ),
        if (showUnlockStatus) ...[
          const SizedBox(width: 8),
          Text(
            unlocked ? unlockedLabel : unlockPriceLabel,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: unlocked ? LuxColors.feedLive : tokens.accent,
            ),
          ),
        ],
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:luxora_ai/data/paywall_catalog.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/paywall/paywall_city_offer.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Dropdown of all Luxora destinations — each maps to its own city paywall.
class CityDestinationPicker extends StatelessWidget {
  const CityDestinationPicker({
    super.key,
    required this.selectedCityId,
    required this.onChanged,
    this.showUnlockStatus = true,
    this.label,
  });

  final String selectedCityId;
  final ValueChanged<String> onChanged;
  final bool showUnlockStatus;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    final scheme = Theme.of(context).colorScheme;
    final offers = PaywallCatalog.selectableOffers;
    final value = PaywallCatalog.isSupported(selectedCityId)
        ? selectedCityId
        : offers.first.cityId;

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
            for (final offer in offers)
              DropdownMenuItem(
                value: offer.cityId,
                child: _CityMenuRow(
                  offer: offer,
                  showUnlockStatus: showUnlockStatus,
                  unlockedLabel: l.cityPickerUnlocked,
                  unlockPriceLabel: l.cityPickerUnlockPrice(offer.formattedPrice),
                ),
              ),
          ],
          selectedItemBuilder: (context) => [
            for (final offer in offers)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${offer.cityName} · ${offer.regionLabel}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: tokens.textPrimary),
                ),
              ),
          ],
          onChanged: (id) {
            if (id != null) onChanged(id);
          },
        ),
      ],
    );
  }
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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/lux_theme_l10n.dart';
import 'package:luxora_ai/l10n/map_basemap_skin_l10n.dart';
import 'package:luxora_ai/models/map_basemap_skin.dart';
import 'package:luxora_ai/services/map_tile_config.dart';
import 'package:luxora_ai/settings/luxora_language_catalog.dart';
import 'package:luxora_ai/state/luxora_app_state.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/data/paywall_catalog.dart';
import 'package:luxora_ai/services/paywall_service.dart';
import 'package:luxora_ai/widgets/concierge/concierge_voice_settings_sheet.dart';
import 'package:luxora_ai/widgets/settings/luxora_language_picker_sheet.dart';
import 'package:luxora_ai/widgets/settings/luxora_premium_sheet_shell.dart';

class LuxoraSettingsSheet extends StatelessWidget {
  const LuxoraSettingsSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => FractionallySizedBox(
        heightFactor: 0.88,
        alignment: Alignment.bottomCenter,
        widthFactor: 1,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 920),
            child: const LuxoraSettingsSheet(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final palette = LuxoraPremiumSheetPalette.of(context);
    final appState = LuxoraAppState.of(context);
    final l = AppLocalizations.of(context);
    final subtitleStyle = palette.subtitleStyle(theme.textTheme);
    final activeCityId = CityPackRegistry.instance.active.cityId;
    final conciergeUnlocked = !PaywallService.needsUnlock(activeCityId);

    return LuxoraPremiumSheetShell(
      title: l.settings,
      heightFraction: 1,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.palette_outlined, color: theme.colorScheme.primary),
                const SizedBox(width: 10),
                Text(
                  l.appearance,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              l.settingsThemeIntro,
              style: subtitleStyle,
            ),
            const SizedBox(height: 12),
            InputDecorator(
              decoration: InputDecoration(
                labelText: l.settingsThemeLabel,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<LuxThemePreset>(
                  isExpanded: true,
                  value: appState.themePreset,
                  borderRadius: BorderRadius.circular(12),
                  itemHeight: 64,
                  items: [
                    for (final preset in luxThemePresetOrder)
                      DropdownMenuItem(
                        value: preset,
                        child: _ThemeDropdownRow(
                          palette: paletteFor(preset),
                          label: l.themePresetLabel(preset),
                          mood: l.themePresetMood(preset),
                          compact: false,
                        ),
                      ),
                  ],
                  selectedItemBuilder: (context) => [
                    for (final preset in luxThemePresetOrder)
                      _ThemeDropdownRow(
                        palette: paletteFor(preset),
                        label: l.themePresetLabel(preset),
                        mood: l.themePresetMood(preset),
                        compact: true,
                      ),
                  ],
                  onChanged: (preset) {
                    if (preset != null) {
                      appState.setThemePreset(preset);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l.settingsMapSkinSection,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.6,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l.settingsMapSkinIntro,
              style: subtitleStyle,
            ),
            const SizedBox(height: 12),
            Builder(
              builder: (context) {
                final mapSkins = MapBasemapSkinCatalog.selectable(
                  hasMapboxToken: MapTileConfig.hasMapboxToken,
                );
                final currentSkin = mapSkins.contains(appState.mapBasemapSkin)
                    ? appState.mapBasemapSkin
                    : MapBasemapSkinCatalog.defaultSkin;

                return InputDecorator(
                  decoration: InputDecoration(
                    labelText: l.settingsMapSkinSection,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<MapBasemapSkin>(
                      isExpanded: true,
                      value: currentSkin,
                      borderRadius: BorderRadius.circular(12),
                      itemHeight: 64,
                      items: [
                        for (final skin in mapSkins)
                          DropdownMenuItem(
                            value: skin,
                            child: _MapSkinDropdownRow(
                              label: l.mapSkinLabel(skin),
                              mood: l.mapSkinMood(skin),
                              previewColors: skin.previewColors,
                              compact: false,
                            ),
                          ),
                      ],
                      selectedItemBuilder: (context) => [
                        for (final skin in mapSkins)
                          _MapSkinDropdownRow(
                            label: l.mapSkinLabel(skin),
                            mood: l.mapSkinMood(skin),
                            previewColors: skin.previewColors,
                            compact: true,
                          ),
                      ],
                      onChanged: (skin) {
                        if (skin != null) {
                          appState.setMapBasemapSkin(skin);
                        }
                      },
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            if (kDebugMode) ...[
              palette.sectionDivider(),
              Text(
                'Debug',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.6,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.lock_open_rounded,
                  color: theme.colorScheme.primary,
                ),
                title: const Text(
                  'Preview paywall',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  'Open the unlock screen for ${PaywallCatalog.offerFor(activeCityId).cityName}',
                  style: subtitleStyle,
                ),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () async {
                  await PaywallService.resetEntitlementsForPreview();
                  await PaywallService.openPaywallPreview(
                    context,
                    cityId: activeCityId,
                  );
                  if (context.mounted) Navigator.of(context).pop();
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.attractions_outlined,
                  color: theme.colorScheme.primary,
                ),
                title: const Text(
                  'Preview Orlando paywall',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  'Orlando city pack (includes Disney & Universal)',
                  style: subtitleStyle,
                ),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () async {
                  await PaywallService.resetEntitlementsForPreview();
                  await PaywallService.openPaywallPreview(
                    context,
                    cityId: OrlandoAddonCatalog.parentCityId,
                  );
                  if (context.mounted) Navigator.of(context).pop();
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.restart_alt_rounded,
                  color: theme.colorScheme.error.withValues(alpha: 0.85),
                ),
                title: const Text(
                  'Reset unlocks (debug)',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  'Clear city pack entitlements to test freemium locks',
                  style: subtitleStyle,
                ),
                onTap: () async {
                  await PaywallService.resetEntitlementsForPreview();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Unlocks cleared — freemium locks active'),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 8),
            ],
            palette.sectionDivider(),
            InkWell(
              onTap: () => LuxoraLanguagePickerSheet.show(context),
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.language_outlined,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l.language,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            LuxoraLanguageCatalog.displayName(appState.locale),
                            style: TextStyle(
                              fontSize: 13,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ),
            palette.sectionDivider(),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                context.push('/onboarding');
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_road_rounded,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l.tripsPlanNew,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            l.settingsStartOverSubtitle,
                            style: TextStyle(
                              fontSize: 13,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ),
            palette.sectionDivider(),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                ConciergeVoiceSettingsSheet.show(context);
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.record_voice_over_rounded,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l.conciergeVoiceSettingsTitle,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            l.conciergeVoiceSettingsSubtitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ),
            palette.sectionDivider(),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                PaywallService.openConciergeEntry(context);
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Icon(
                      conciergeUnlocked
                          ? Icons.spatial_audio_off_rounded
                          : Icons.diamond_rounded,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            conciergeUnlocked
                                ? l.navConcierge
                                : l.settingsUnlockConciergeTitle,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            conciergeUnlocked
                                ? l.settingsOpenConciergeSubtitle
                                : l.settingsUnlockConciergeSubtitle,
                            style: TextStyle(
                              fontSize: 13,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ),
            palette.sectionDivider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.public_rounded,
                color: theme.colorScheme.primary.withValues(alpha: 0.85),
              ),
              title: Text(
                l.settings_regions_coming_title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                l.settings_regions_coming_subtitle,
                style: subtitleStyle,
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  l.commonSoon,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.primary,
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

class _ThemeDropdownRow extends StatelessWidget {
  const _ThemeDropdownRow({
    required this.palette,
    required this.label,
    required this.mood,
    required this.compact,
  });

  final LuxThemePalette palette;
  final String label;
  final String mood;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          width: compact ? 44 : 52,
          height: compact ? 32 : 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [palette.bg, palette.bgSecondary, palette.accent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              color: palette.accent.withValues(alpha: 0.35),
            ),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: compact ? 10 : 12,
              height: compact ? 10 : 12,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: palette.accentSecondary,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: compact ? 15 : 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (!compact)
                Text(
                  mood,
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MapSkinDropdownRow extends StatelessWidget {
  const _MapSkinDropdownRow({
    required this.label,
    required this.mood,
    required this.previewColors,
    required this.compact,
  });

  final String label;
  final String mood;
  final (Color land, Color water, Color accent) previewColors;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (land, water, accent) = previewColors;

    return Row(
      children: [
        Container(
          width: compact ? 44 : 52,
          height: compact ? 32 : 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [land, water, accent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: accent.withValues(alpha: 0.45)),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: compact ? 10 : 12,
              height: compact ? 10 : 12,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: accent,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: compact ? 15 : 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (!compact)
                Text(
                  mood,
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

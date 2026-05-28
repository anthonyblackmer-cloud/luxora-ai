import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/settings/luxora_language_catalog.dart';
import 'package:luxora_ai/state/luxora_app_state.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/settings/luxora_language_picker_sheet.dart';
import 'package:luxora_ai/widgets/settings/luxora_premium_sheet_shell.dart';

class LuxoraSettingsSheet extends StatelessWidget {
  const LuxoraSettingsSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => const LuxoraSettingsSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final palette = LuxoraPremiumSheetPalette.of(context);
    final appState = LuxoraAppState.of(context);
    final l = AppLocalizations.of(context);
    final subtitleStyle = palette.subtitleStyle(theme.textTheme);

    return LuxoraPremiumSheetShell(
      title: l.settings,
      heightFraction: 0.72,
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
              'Choose your signature atmosphere',
              style: subtitleStyle,
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                for (final palette in luxThemePalettes)
                  _ThemePreviewCard(
                    palette: palette,
                    selected: appState.themePreset == palette.id,
                    onTap: () => appState.setThemePreset(palette.id),
                  ),
              ],
            ),
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

class _ThemePreviewCard extends StatelessWidget {
  const _ThemePreviewCard({
    required this.palette,
    required this.selected,
    required this.onTap,
  });

  final LuxThemePalette palette;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected
                ? palette.accent.withValues(alpha: 0.9)
                : theme.colorScheme.outline.withValues(alpha: 0.28),
            width: selected ? 1.4 : 1,
          ),
          color: theme.colorScheme.surface.withValues(alpha: 0.45),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: palette.glow.withValues(alpha: 0.45),
                    blurRadius: 18,
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 66,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [palette.bg, palette.bgSecondary, palette.accent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 16,
                  height: 16,
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: palette.accentSecondary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    palette.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    palette.mood,
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            if (selected)
              Icon(
                Icons.check_circle_rounded,
                color: palette.accent,
              ),
          ],
        ),
      ),
    );
  }
}

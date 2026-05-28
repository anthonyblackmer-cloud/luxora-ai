import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/settings/luxora_language_catalog.dart';
import 'package:luxora_ai/state/luxora_app_state.dart';
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
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                appState.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: theme.colorScheme.primary,
              ),
              title: Text(
                l.appearance,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                appState.isDarkMode ? l.dark_mode : l.light_mode,
                style: subtitleStyle,
              ),
              trailing: Switch(
                value: appState.isDarkMode,
                onChanged: appState.setDarkMode,
                activeThumbColor: theme.colorScheme.primary,
                activeTrackColor: theme.colorScheme.primary.withValues(alpha: 0.5),
              ),
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

import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/settings/luxora_language_catalog.dart';
import 'package:luxora_ai/state/luxora_app_state.dart';
import 'package:luxora_ai/widgets/settings/luxora_language_card.dart';
import 'package:luxora_ai/widgets/settings/luxora_premium_sheet_shell.dart';

class LuxoraLanguagePickerSheet extends StatelessWidget {
  const LuxoraLanguagePickerSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => const LuxoraLanguagePickerSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final palette = LuxoraPremiumSheetPalette.of(context);
    final appState = LuxoraAppState.of(context);
    final l = AppLocalizations.of(context);
    final uiLocale = appState.locale;

    return LuxoraPremiumSheetShell(
      title: l.language,
      footer: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
        child: Text(
          l.settings_language_picker_note,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall?.copyWith(
            color: palette.scheme.onSurfaceVariant,
            height: 1.4,
          ),
        ),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
        itemCount: LuxoraLanguageCatalog.supportedCodes.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final code = LuxoraLanguageCatalog.supportedCodes[index];
          final selected = appState.locale == code;
          return LuxoraLanguageCard(
            label: LuxoraLanguageCatalog.primaryLabel(code, uiLocale),
            secondaryLabel: LuxoraLanguageCatalog.secondaryLabel(code, uiLocale),
            flagEmoji: LuxoraLanguageCatalog.flagEmoji(code),
            selected: selected,
            accent: palette.accent,
            cardColor: palette.cardColor,
            borderMuted: palette.borderMuted,
            onTap: () {
              appState.setLocale(code);
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }
}

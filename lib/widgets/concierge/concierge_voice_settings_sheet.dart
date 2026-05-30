import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/concierge/concierge_voice_preset.dart';
import 'package:luxora_ai/services/concierge_voice_service.dart';
import 'package:luxora_ai/services/concierge_voice_settings_store.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/settings/luxora_premium_sheet_shell.dart';

class ConciergeVoiceSettingsSheet extends StatefulWidget {
  const ConciergeVoiceSettingsSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => FractionallySizedBox(
        heightFactor: 0.82,
        alignment: Alignment.bottomCenter,
        widthFactor: 1,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 920),
            child: const ConciergeVoiceSettingsSheet(),
          ),
        ),
      ),
    );
  }

  @override
  State<ConciergeVoiceSettingsSheet> createState() =>
      _ConciergeVoiceSettingsSheetState();
}

class _ConciergeVoiceSettingsSheetState extends State<ConciergeVoiceSettingsSheet> {
  final _settings = ConciergeVoiceSettingsStore.instance;
  bool _previewing = false;

  @override
  void initState() {
    super.initState();
    _settings.load();
  }

  Future<void> _preview(AppLocalizations l) async {
    if (_previewing) return;
    setState(() => _previewing = true);
    try {
      final locale = Localizations.localeOf(context).languageCode;
      final ok = await ConciergeVoiceService.instance.previewVoice(
        sample: l.conciergeVoicePreviewSample,
        languageCode: locale,
      );
      if (!mounted) return;
      if (!ok) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l.conciergeVoicePreviewFailed),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _previewing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final t = luxThemeTokensOf(context);
    return ListenableBuilder(
      listenable: _settings,
      builder: (context, _) {
        final grouped = <String, List<ConciergeVoicePreset>>{};
        for (final preset in ConciergeVoicePresets.all) {
          grouped.putIfAbsent(preset.regionLabel(l), () => []).add(preset);
        }

        return LuxoraPremiumSheetShell(
          title: l.conciergeVoiceSettingsTitle,
          heightFraction: 1,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.conciergeVoiceSettingsSubtitle,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.4,
                    color: t.textMuted,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l.conciergeVoiceRateLabel,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.4,
                    color: t.textMuted.withValues(alpha: 0.9),
                  ),
                ),
                const SizedBox(height: 10),
                SegmentedButton<double>(
                  segments: [
                    ButtonSegment(
                      value: 0.38,
                      label: Text(l.conciergeVoiceRateSlow),
                    ),
                    ButtonSegment(
                      value: 0.46,
                      label: Text(l.conciergeVoiceRateNatural),
                    ),
                    ButtonSegment(
                      value: 0.54,
                      label: Text(l.conciergeVoiceRateFast),
                    ),
                  ],
                  selected: {_settings.speechRate},
                  onSelectionChanged: (values) =>
                      _settings.setSpeechRate(values.first),
                ),
                const SizedBox(height: 20),
                for (final entry in grouped.entries) ...[
                  Text(
                    entry.key,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.4,
                      color: t.textMuted.withValues(alpha: 0.9),
                    ),
                  ),
                  const SizedBox(height: 8),
                  for (final preset in entry.value)
                    _VoicePresetTile(
                      label: preset.label(l),
                      selected: _settings.presetId == preset.id,
                      onTap: () => _settings.setPreset(preset.id),
                    ),
                  const SizedBox(height: 12),
                ],
                OutlinedButton.icon(
                  onPressed: _previewing ? null : () => _preview(l),
                  icon: _previewing
                      ? SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: t.accent,
                          ),
                        )
                      : Icon(Icons.volume_up_rounded, color: t.accent),
                  label: Text(l.conciergeVoicePreview),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: t.accent,
                    side: BorderSide(color: t.accent.withValues(alpha: 0.45)),
                    minimumSize: const Size.fromHeight(48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l.conciergeVoiceDeviceNote,
                  style: TextStyle(
                    fontSize: 11,
                    height: 1.35,
                    color: t.textMuted.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VoicePresetTile extends StatelessWidget {
  const _VoicePresetTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: selected
            ? t.accent.withValues(alpha: 0.12)
            : t.panelFill,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: selected
                    ? t.accent.withValues(alpha: 0.55)
                    : t.borderSubtle,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: selected ? t.textPrimary : t.textMuted,
                    ),
                  ),
                ),
                if (selected)
                  Icon(Icons.check_circle_rounded, color: t.accent, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

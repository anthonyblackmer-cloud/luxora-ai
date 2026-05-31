import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/concierge/concierge_device_voice.dart';
import 'package:luxora_ai/models/concierge/concierge_voice_preset.dart';
import 'package:luxora_ai/services/concierge_voice_service.dart';
import 'package:luxora_ai/services/concierge_voice_settings_store.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/util/device_voice_settings_launcher.dart';
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
  final _voice = ConciergeVoiceService.instance;
  bool _previewing = false;
  String? _previewingKey;
  bool _refreshing = false;
  bool _showAllLanguages = false;
  List<ConciergeDeviceVoice> _deviceVoices = const [];

  @override
  void initState() {
    super.initState();
    _settings.load();
    WidgetsBinding.instance.addPostFrameCallback((_) => _refreshVoices());
  }

  Future<void> _refreshVoices() async {
    if (_refreshing) return;
    setState(() => _refreshing = true);
    try {
      final locale = Localizations.localeOf(context).languageCode;
      final voices = await _voice.refreshDeviceVoices(
        languageCode: locale,
        includeAllLanguages: _showAllLanguages,
      );
      if (mounted) setState(() => _deviceVoices = voices);
    } finally {
      if (mounted) setState(() => _refreshing = false);
    }
  }

  Future<void> _previewCurrent(AppLocalizations l) async {
    await _preview(
      l,
      previewKey: 'current',
      preview: () => _voice.previewVoice(
        sample: l.conciergeVoicePreviewSample,
        languageCode: Localizations.localeOf(context).languageCode,
      ),
    );
  }

  Future<void> _previewPreset(AppLocalizations l, String presetId) async {
    await _preview(
      l,
      previewKey: 'preset:$presetId',
      preview: () => _voice.previewSample(
        sample: l.conciergeVoicePreviewSample,
        languageCode: Localizations.localeOf(context).languageCode,
        presetId: presetId,
      ),
    );
  }

  Future<void> _previewDeviceVoice(
    AppLocalizations l,
    ConciergeDeviceVoice voice,
  ) async {
    await _preview(
      l,
      previewKey: 'device:${voice.storageKey}',
      preview: () => _voice.previewSample(
        sample: l.conciergeVoicePreviewSample,
        languageCode: Localizations.localeOf(context).languageCode,
        deviceVoice: voice,
      ),
    );
  }

  Future<void> _preview(
    AppLocalizations l, {
    required String previewKey,
    required Future<bool> Function() preview,
  }) async {
    if (_previewing) return;
    setState(() {
      _previewing = true;
      _previewingKey = previewKey;
    });
    try {
      final ok = await preview();
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
      if (mounted) {
        setState(() {
          _previewing = false;
          _previewingKey = null;
        });
      }
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
                const SizedBox(height: 14),
                OutlinedButton.icon(
                  onPressed: _previewing && _previewingKey != 'current'
                      ? null
                      : () => _previewCurrent(l),
                  icon: _previewing && _previewingKey == 'current'
                      ? SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: t.accent,
                          ),
                        )
                      : Icon(Icons.volume_up_rounded, color: t.accent),
                  label: Text(l.conciergeVoicePreviewCurrent),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: t.accent,
                    side: BorderSide(color: t.accent.withValues(alpha: 0.45)),
                    minimumSize: const Size.fromHeight(48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                Text(
                  l.conciergeVoicePresetSection,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.4,
                    color: t.textMuted.withValues(alpha: 0.9),
                  ),
                ),
                const SizedBox(height: 8),
                for (final entry in grouped.entries) ...[
                  Text(
                    entry.key,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                      color: t.textMuted.withValues(alpha: 0.75),
                    ),
                  ),
                  const SizedBox(height: 6),
                  for (final preset in entry.value)
                    _VoicePresetTile(
                      label: preset.label(l),
                      selected: !_settings.usesCustomDeviceVoice &&
                          _settings.presetId == preset.id,
                      previewing:
                          _previewing && _previewingKey == 'preset:${preset.id}',
                      onTap: () => _settings.setPreset(preset.id),
                      onPreview: _previewing
                          ? null
                          : () => _previewPreset(l, preset.id),
                    ),
                  const SizedBox(height: 10),
                ],
                const SizedBox(height: 8),
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
                      value: 0.43,
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
                const SizedBox(height: 22),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        l.conciergeVoiceDeviceSection,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.4,
                          color: t.textMuted.withValues(alpha: 0.9),
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: _refreshing ? null : _refreshVoices,
                      icon: _refreshing
                          ? SizedBox(
                              width: 14,
                              height: 14,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: t.accent,
                              ),
                            )
                          : Icon(Icons.refresh_rounded, size: 16, color: t.accent),
                      label: Text(l.conciergeVoiceRefreshList),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  l.conciergeVoiceDeviceSectionHint,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.35,
                    color: t.textMuted,
                  ),
                ),
                const SizedBox(height: 8),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    l.conciergeVoiceShowAllLanguages,
                    style: TextStyle(fontSize: 13, color: t.textPrimary),
                  ),
                  value: _showAllLanguages,
                  onChanged: (v) {
                    setState(() => _showAllLanguages = v);
                    _refreshVoices();
                  },
                ),
                if (_deviceVoices.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      l.conciergeVoiceNoDeviceVoices,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.35,
                        color: t.textMuted,
                      ),
                    ),
                  )
                else
                  for (final voice in _deviceVoices)
                    _VoicePresetTile(
                      label: voice.displayLabel(qualityHint: voice.qualityHint),
                      subtitle: voice.locale,
                      selected: _settings.deviceVoiceKey == voice.storageKey,
                      previewing: _previewing &&
                          _previewingKey == 'device:${voice.storageKey}',
                      onTap: () => _settings.setDeviceVoice(voice.storageKey),
                      onPreview: _previewing
                          ? null
                          : () => _previewDeviceVoice(l, voice),
                    ),
                if (!kIsWeb &&
                    (defaultTargetPlatform == TargetPlatform.iOS ||
                        defaultTargetPlatform == TargetPlatform.android)) ...[
                  const SizedBox(height: 4),
                  TextButton.icon(
                    onPressed: openDeviceVoiceSettings,
                    icon: Icon(Icons.settings_outlined, size: 16, color: t.accent),
                    label: Text(l.conciergeVoiceOpenSettings),
                  ),
                ],
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
    this.subtitle,
    this.onPreview,
    this.previewing = false,
  });

  final String label;
  final String? subtitle;
  final bool selected;
  final VoidCallback onTap;
  final VoidCallback? onPreview;
  final bool previewing;

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);
    final l = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: selected ? t.accent.withValues(alpha: 0.12) : t.panelFill,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(14, 10, 8, 10),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: selected ? t.textPrimary : t.textMuted,
                        ),
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          subtitle!,
                          style: TextStyle(
                            fontSize: 11,
                            color: t.textMuted.withValues(alpha: 0.85),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                IconButton(
                  tooltip: l.conciergeVoicePreview,
                  onPressed: onPreview,
                  icon: previewing
                      ? SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: t.accent,
                          ),
                        )
                      : Icon(
                          Icons.volume_up_rounded,
                          color: onPreview == null
                              ? t.textMuted.withValues(alpha: 0.35)
                              : t.accent,
                          size: 22,
                        ),
                ),
                if (selected)
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: t.accent,
                      size: 20,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

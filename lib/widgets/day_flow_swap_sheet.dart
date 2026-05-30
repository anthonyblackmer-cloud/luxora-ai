import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/concierge_context_builder.dart';
import 'package:luxora_ai/services/concierge_session_memory.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/day_flow_stop_customizer.dart';
import 'package:luxora_ai/services/concierge_voice_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/util/day_flow_labels.dart';

/// Opens a bottom sheet so the traveler can say what they'd rather do instead
/// of a timeline stop — template text + hold-to-speak + AI swap.
Future<void> showDayFlowSwapSheet(
  BuildContext context, {
  required DayFlow flow,
  required int blockIndex,
  required List<LuxPlace> pool,
  required TripProfile? profile,
  required Set<String> savedIds,
  required void Function(DayFlow flow, String? message) onApply,
  required void Function(LuxPlace place) onViewPlace,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: LuxColors.gemSurface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) => _DayFlowSwapSheet(
      flow: flow,
      blockIndex: blockIndex,
      pool: pool,
      profile: profile,
      savedIds: savedIds,
      onApply: onApply,
      onViewPlace: onViewPlace,
    ),
  );
}

class _DayFlowSwapSheet extends StatefulWidget {
  const _DayFlowSwapSheet({
    required this.flow,
    required this.blockIndex,
    required this.pool,
    required this.profile,
    required this.savedIds,
    required this.onApply,
    required this.onViewPlace,
  });

  final DayFlow flow;
  final int blockIndex;
  final List<LuxPlace> pool;
  final TripProfile? profile;
  final Set<String> savedIds;
  final void Function(DayFlow flow, String? message) onApply;
  final void Function(LuxPlace place) onViewPlace;

  @override
  State<_DayFlowSwapSheet> createState() => _DayFlowSwapSheetState();
}

class _DayFlowSwapSheetState extends State<_DayFlowSwapSheet> {
  late final TextEditingController _controller;
  final _voice = ConciergeVoiceService.instance;
  bool _listening = false;
  bool _busy = false;

  DayBlock get _block => widget.flow.blocks[widget.blockIndex];

  @override
  void initState() {
    super.initState();
    final l = context.l10n;
    _controller = TextEditingController(text: l.dayFlowSwapTemplate);
  }

  @override
  void dispose() {
    _controller.dispose();
    if (_listening) _voice.cancelListening();
    super.dispose();
  }

  Future<void> _startVoice() async {
    if (_busy || _listening) return;
    final locale = Localizations.localeOf(context).languageCode;
    HapticFeedback.lightImpact();
    setState(() => _listening = true);
    final started = await _voice.startListening(
      languageCode: locale,
      onPartial: (text) {
        if (!mounted || text.trim().isEmpty) return;
        setState(() {
          final base = context.l10n.dayFlowSwapTemplate;
          _controller.text = '$base $text';
          _controller.selection = TextSelection.collapsed(
            offset: _controller.text.length,
          );
        });
      },
      onSessionEnded: () {
        if (mounted) setState(() => _listening = false);
      },
    );
    if (!started && mounted) {
      setState(() => _listening = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.conciergeVoiceNoSpeech)),
      );
    }
  }

  Future<void> _stopVoice() async {
    if (!_listening) return;
    final heard = await _voice.stopListeningAndTakeResult(
      fallback: _controller.text,
    );
    if (!mounted) return;
    setState(() => _listening = false);
    if (heard != null && heard.trim().isNotEmpty) {
      final base = context.l10n.dayFlowSwapTemplate;
      final lower = heard.toLowerCase();
      final text = lower.startsWith(base.toLowerCase().trim())
          ? heard
          : '$base $heard';
      _controller.text = text;
      _controller.selection = TextSelection.collapsed(
        offset: _controller.text.length,
      );
    }
  }

  Future<void> _apply() async {
    if (_busy) return;
    setState(() => _busy = true);
    final l = context.l10n;
    final locale = Localizations.localeOf(context).languageCode;
    final stylePrefs = await ConciergeSessionMemory().load();
    final aiContext = ConciergeContextBuilder.build(
      profile: widget.profile,
      stylePrefs: stylePrefs,
      localeCode: locale,
    );

    final result = await DayFlowStopCustomizer.swapAsync(
      flow: widget.flow,
      blockIndex: widget.blockIndex,
      userRequest: _controller.text,
      pool: widget.pool,
      aiContext: aiContext,
      savedIds: widget.savedIds,
    );

    if (!mounted) return;
    setState(() => _busy = false);

    if (!result.changed || result.newPlace == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l.dayFlowSwapNoMatch)),
      );
      return;
    }

    final phase = dayFlowPhaseLabel(l, _block.phase);
    final newTitle = catalogText(context, result.newPlace!.title);
    widget.onApply(
      result.flow,
      l.dayFlowSwapSuccess(newTitle, phase),
    );
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final block = _block;
    final inset = MediaQuery.viewInsetsOf(context).bottom;
    final currentTitle = catalogText(context, block.place.title);

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 12, 20, 20 + inset),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: LuxColors.stone500.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l.dayFlowSwapTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: LuxColors.cream,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            l.dayFlowSwapSubtitle(currentTitle),
            style: const TextStyle(
              fontSize: 13,
              height: 1.35,
              color: LuxColors.stone400,
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: _controller,
            minLines: 2,
            maxLines: 4,
            style: const TextStyle(color: LuxColors.cream, fontSize: 15),
            decoration: InputDecoration(
              hintText: l.dayFlowSwapHint,
              hintStyle: TextStyle(
                color: LuxColors.stone500.withValues(alpha: 0.9),
              ),
              filled: true,
              fillColor: LuxColors.bg.withValues(alpha: 0.65),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: LuxColors.gold.withValues(alpha: 0.25),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: LuxColors.gold.withValues(alpha: 0.25),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: LuxColors.gold.withValues(alpha: 0.55),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onLongPress: _startVoice,
                  onLongPressUp: _stopVoice,
                  onLongPressCancel: () => _voice.cancelListening(),
                  child: OutlinedButton.icon(
                    onPressed: _listening ? _stopVoice : _startVoice,
                    icon: Icon(
                      _listening ? Icons.mic_rounded : Icons.mic_none_rounded,
                      size: 18,
                    ),
                    label: Text(
                      _listening ? l.dayFlowSwapListening : l.dayFlowSwapHoldSpeak,
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: LuxColors.gold,
                      side: BorderSide(
                        color: LuxColors.gold.withValues(alpha: 0.45),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton.icon(
                  onPressed: _busy ? null : _apply,
                  icon: _busy
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.auto_awesome_rounded, size: 18),
                  label: Text(l.dayFlowSwapApply),
                  style: FilledButton.styleFrom(
                    backgroundColor: LuxColors.gold,
                    foregroundColor: LuxColors.bg,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              widget.onViewPlace(block.place);
            },
            child: Text(l.dayFlowSwapViewPlace),
          ),
        ],
      ),
    );
  }
}

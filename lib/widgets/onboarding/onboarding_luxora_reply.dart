import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/services/concierge_voice_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/util/traveler_name.dart';

/// Luxora chat-style replies after the traveler shares their name.
class OnboardingLuxoraReply extends StatefulWidget {
  const OnboardingLuxoraReply({
    super.key,
    required this.travelerName,
    required this.l,
  });

  final String travelerName;
  final AppLocalizations l;

  @override
  State<OnboardingLuxoraReply> createState() => _OnboardingLuxoraReplyState();
}

class _OnboardingLuxoraReplyState extends State<OnboardingLuxoraReply> {
  final _voice = ConciergeVoiceService.instance;
  bool _speaking = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_speakReplies());
    });
  }

  @override
  void dispose() {
    unawaited(_voice.stopSpeaking());
    super.dispose();
  }

  Future<void> _speakReplies() async {
    if (kIsWeb || !mounted) return;

    final firstName =
        TravelerNameDisplay.firstName(widget.travelerName) ??
            widget.travelerName.trim();
    if (firstName.isEmpty) return;

    final locale = Localizations.localeOf(context).languageCode;
    final lines = [
      widget.l.onboardLuxoraReplyTitle(firstName),
      widget.l.onboardLuxoraGuideNamed(firstName),
      widget.l.onboardLuxoraItineraryPromise,
    ];

    await _voice.initialize();
    if (!mounted) return;
    setState(() => _speaking = true);
    _speakLineAt(0, lines, locale);
  }

  void _speakLineAt(int index, List<String> lines, String locale) {
    if (!mounted || index >= lines.length) {
      if (mounted) setState(() => _speaking = false);
      return;
    }

    unawaited(
      _voice.speak(
        lines[index],
        languageCode: locale,
        onComplete: () {
          if (!mounted) return;
          _speakLineAt(index + 1, lines, locale);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final firstName =
        TravelerNameDisplay.firstName(widget.travelerName) ??
            widget.travelerName.trim();
    final width = MediaQuery.sizeOf(context).width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.l.onboardLuxoraReplyEyebrow,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            color: LuxColors.gold.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.l.onboardLuxoraReplyTitle(firstName),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        if (_speaking && !kIsWeb) ...[
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.graphic_eq_rounded,
                size: 16,
                color: LuxColors.gold.withValues(alpha: 0.85),
              ),
              const SizedBox(width: 8),
              Text(
                widget.l.conciergeVoiceSpeaking,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: LuxColors.stone400.withValues(alpha: 0.95),
                ),
              ),
            ],
          ),
        ],
        const SizedBox(height: 20),
        _UserBubble(text: firstName, maxWidth: width * 0.78),
        const SizedBox(height: 12),
        _LuxoraBubble(
          text: widget.l.onboardLuxoraGuideNamed(firstName),
          maxWidth: width * 0.85,
        ),
        const SizedBox(height: 12),
        _LuxoraBubble(
          text: widget.l.onboardLuxoraItineraryPromise,
          maxWidth: width * 0.85,
        ),
      ],
    );
  }
}

class _UserBubble extends StatelessWidget {
  const _UserBubble({required this.text, required this.maxWidth});

  final String text;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: LuxColors.gold.withValues(alpha: 0.16),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: LuxColors.cream,
          ),
        ),
      ),
    );
  }
}

class _LuxoraBubble extends StatelessWidget {
  const _LuxoraBubble({required this.text, required this.maxWidth});

  final String text;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            height: 1.45,
            color: LuxColors.stone300.withValues(alpha: 0.98),
          ),
        ),
      ),
    );
  }
}

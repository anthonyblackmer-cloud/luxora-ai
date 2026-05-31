import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/services/concierge_voice_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// First onboarding beat — Luxora introduces herself before name capture.
class OnboardingWelcomeStep extends StatefulWidget {
  const OnboardingWelcomeStep({super.key, required this.l});

  final AppLocalizations l;

  @override
  State<OnboardingWelcomeStep> createState() => _OnboardingWelcomeStepState();
}

class _OnboardingWelcomeStepState extends State<OnboardingWelcomeStep> {
  final _voice = ConciergeVoiceService.instance;
  bool _speaking = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_speakWelcome());
    });
  }

  @override
  void dispose() {
    unawaited(_voice.stopSpeaking());
    super.dispose();
  }

  Future<void> _speakWelcome() async {
    if (kIsWeb || !mounted) return;

    final locale = Localizations.localeOf(context).languageCode;
    final lines = [
      widget.l.onboardWelcomeTitle,
      widget.l.onboardWelcomeTagline,
      ...widget.l.onboardWelcomeBody
          .split('\n')
          .map((line) => line.trim())
          .where((line) => line.isNotEmpty),
    ];

    await _voice.initialize();
    if (!mounted) return;
    setState(() => _speaking = true);
    await _voice.speak(
      ConciergeVoiceService.scriptFromLines(lines),
      languageCode: locale,
      onComplete: () {
        if (mounted) setState(() => _speaking = false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.l.onboardWelcomeEyebrow,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            color: LuxColors.gold.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.l.onboardWelcomeTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 10),
        Text(
          widget.l.onboardWelcomeTagline,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.35,
            color: LuxColors.gold.withValues(alpha: 0.9),
          ),
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
        const SizedBox(height: 16),
        Text(
          widget.l.onboardWelcomeBody,
          style: TextStyle(
            fontSize: 14,
            height: 1.5,
            color: LuxColors.stone300.withValues(alpha: 0.98),
          ),
        ),
      ],
    );
  }
}

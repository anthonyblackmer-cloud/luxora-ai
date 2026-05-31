import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// First onboarding beat — Luxora introduces herself before name capture.
class OnboardingWelcomeStep extends StatelessWidget {
  const OnboardingWelcomeStep({super.key, required this.l});

  final AppLocalizations l;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l.onboardWelcomeEyebrow,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            color: LuxColors.gold.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l.onboardWelcomeTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 10),
        Text(
          l.onboardWelcomeTagline,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.35,
            color: LuxColors.gold.withValues(alpha: 0.9),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          l.onboardWelcomeBody,
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

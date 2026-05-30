import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/unsplash_photo_registry.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/paywall/paywall_reveal.dart';
import 'package:luxora_ai/widgets/unsplash_image.dart';

/// Immersive hero — full-bleed imagery, gradient scrim, cinematic headline.
class PaywallHero extends StatelessWidget {
  const PaywallHero({
    super.key,
    required this.heroPhotoId,
    required this.headline,
    required this.subheadline,
    this.emotionalLine,
  });

  final String heroPhotoId;
  final String headline;
  final String subheadline;
  final String? emotionalLine;

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);
    final l = context.l10n;
    final photo = UnsplashPhotoRegistry.instance.byId(heroPhotoId);
    final height = MediaQuery.sizeOf(context).height * 0.52;

    return SizedBox(
      height: height.clamp(340, 480),
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (photo != null)
            UnsplashImage(
              photo: photo,
              height: height,
              fit: BoxFit.cover,
              showAttributionOverlay: false,
              trackUsageOnDisplay: true,
              scrim: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.15),
                  Colors.black.withValues(alpha: 0.55),
                  t.bg.withValues(alpha: 0.95),
                ],
                stops: const [0.0, 0.55, 1.0],
              ),
            )
          else
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [t.bgSecondary, t.bg],
                ),
              ),
            ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l.paywallHeroEyebrow,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3.2,
                          color: t.accent.withValues(alpha: 0.92),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        headline,
                        style: const TextStyle(
                          fontSize: 34,
                          height: 1.08,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.8,
                          color: LuxColors.cream,
                          shadows: [
                            Shadow(color: Colors.black54, blurRadius: 16),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        subheadline,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.45,
                          fontWeight: FontWeight.w500,
                          color: LuxColors.cream.withValues(alpha: 0.85),
                        ),
                      ),
                      if (emotionalLine != null) ...[
                        const SizedBox(height: 14),
                        PaywallReveal(
                          index: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black.withValues(alpha: 0.35),
                              border: Border.all(
                                color: t.accent.withValues(alpha: 0.28),
                              ),
                            ),
                            child: Text(
                              emotionalLine!,
                              style: TextStyle(
                                fontSize: 13,
                                height: 1.4,
                                fontStyle: FontStyle.italic,
                                color: LuxColors.cream.withValues(alpha: 0.82),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

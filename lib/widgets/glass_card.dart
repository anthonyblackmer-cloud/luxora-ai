import 'package:flutter/material.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.glow = false,
  });

  final Widget child;
  final EdgeInsets padding;
  final bool glow;

  @override
  Widget build(BuildContext context) {
    final tokens = luxThemeTokensOf(context);
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: tokens.cardFill,
          border: Border.all(
            color: tokens.accent.withValues(alpha: tokens.isLight ? 0.12 : 0.16),
          ),
          boxShadow: [
            if (tokens.isLight)
              BoxShadow(
                color: tokens.elevationShadow,
                blurRadius: 18,
                offset: const Offset(0, 6),
                spreadRadius: -4,
              ),
            if (glow)
              BoxShadow(
                color: tokens.glow.withValues(alpha: 0.55),
                blurRadius: 40,
                spreadRadius: -8,
              ),
          ],
        ),
        child: child,
      ),
    );
  }
}

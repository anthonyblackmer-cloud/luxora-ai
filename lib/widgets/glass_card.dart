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
    // DropdownButton, FilterChip, etc. need a Material ancestor; many Luxora
    // routes sit on LuxBackground without a Scaffold.
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: tokens.bgSecondary.withValues(alpha: 0.46),
          border: Border.all(color: tokens.accent.withValues(alpha: 0.16)),
          boxShadow: glow
              ? [
                  BoxShadow(
                    color: tokens.glow.withValues(alpha: 0.55),
                    blurRadius: 40,
                    spreadRadius: -8,
                  ),
                ]
              : null,
        ),
        child: child,
      ),
    );
  }
}

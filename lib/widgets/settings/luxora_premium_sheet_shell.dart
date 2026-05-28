import 'package:flutter/material.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Discipline-style premium bottom sheet shell — Luxora gold / stone palette.
class LuxoraPremiumSheetPalette {
  LuxoraPremiumSheetPalette({
    required this.accent,
    required this.cardColor,
    required this.borderMuted,
    required this.isDark,
    required this.scheme,
  });

  final Color accent;
  final Color cardColor;
  final Color borderMuted;
  final bool isDark;
  final ColorScheme scheme;

  factory LuxoraPremiumSheetPalette.of(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    return LuxoraPremiumSheetPalette(
      accent: scheme.primary,
      cardColor: isDark ? const Color(0xFF1F1B33) : scheme.surface,
      borderMuted: scheme.outline.withValues(alpha: isDark ? 0.22 : 0.35),
      isDark: isDark,
      scheme: scheme,
    );
  }

  TextStyle titleStyle(TextTheme textTheme) {
    return textTheme.headlineMedium?.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          height: 1.25,
          letterSpacing: -0.4,
          color: scheme.onSurface,
        ) ??
        const TextStyle(fontSize: 28, fontWeight: FontWeight.w700);
  }

  TextStyle subtitleStyle(TextTheme textTheme) {
    return textTheme.bodySmall?.copyWith(
          fontSize: 12,
          height: 1.35,
          color: scheme.onSurfaceVariant,
        ) ??
        TextStyle(fontSize: 12, color: scheme.onSurfaceVariant);
  }

  Widget sectionDivider() => Divider(color: borderMuted, height: 28);
}

class LuxoraPremiumSheetShell extends StatelessWidget {
  const LuxoraPremiumSheetShell({
    super.key,
    required this.title,
    required this.child,
    this.heightFraction = 0.92,
    this.footer,
  });

  final String title;
  final Widget child;
  final double heightFraction;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final palette = LuxoraPremiumSheetPalette.of(context);
    final height = MediaQuery.sizeOf(context).height * heightFraction;

    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: palette.isDark
              ? const [
                  Color(0xFF0F0A09),
                  Color(0xFF1C1917),
                  Color(0xFF0F0A09),
                ]
              : [
                  theme.colorScheme.surface,
                  Color.lerp(theme.colorScheme.surface, LuxColors.gold, 0.04)!,
                  theme.colorScheme.surface,
                ],
        ),
        border: Border.all(
          color: palette.borderMuted,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (palette.isDark)
            Positioned(
              top: -60,
              left: MediaQuery.sizeOf(context).width * 0.15,
              child: _GlowOrb(
                color: palette.accent.withValues(alpha: 0.18),
              ),
            ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 8),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: palette.scheme.onSurfaceVariant.withValues(alpha: 0.35),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: palette.titleStyle(theme.textTheme),
                  ),
                ),
                Expanded(child: child),
                if (footer != null) footer!,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    const size = 220.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: size * 0.45,
            spreadRadius: size * 0.08,
          ),
        ],
      ),
    );
  }
}

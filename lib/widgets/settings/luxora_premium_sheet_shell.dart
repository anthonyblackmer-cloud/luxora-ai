import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Reusable circular close button for modal bottom sheets / pull-downs.
///
/// Drag-to-dismiss is unreliable on some devices, so every sheet exposes an
/// explicit tap target. Pops the nearest route when tapped.
class LuxSheetCloseButton extends StatelessWidget {
  const LuxSheetCloseButton({
    super.key,
    this.color,
    this.background,
    this.onClose,
  });

  final Color? color;
  final Color? background;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final fg = color ?? scheme.onSurface;
    return Semantics(
      button: true,
      label: context.l10n.commonClose,
      child: Material(
        color: background ?? fg.withValues(alpha: 0.06),
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onClose ?? () => Navigator.of(context).maybePop(),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(Icons.close_rounded, size: 20, color: fg),
          ),
        ),
      ),
    );
  }
}

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
    final tokens = luxThemeTokensOf(context);
    final isDark = theme.brightness == Brightness.dark;
    return LuxoraPremiumSheetPalette(
      accent: scheme.primary,
      cardColor: isDark ? const Color(0xFF1F1B33) : tokens.surface,
      borderMuted: tokens.borderSubtle,
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
    this.headerTrailing,
  });

  final String title;
  final Widget child;
  final double heightFraction;
  final Widget? footer;
  final Widget? headerTrailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final palette = LuxoraPremiumSheetPalette.of(context);
    final tokens = luxThemeTokensOf(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final fallbackHeight = MediaQuery.sizeOf(context).height * heightFraction;
        final sheetHeight = constraints.hasBoundedHeight && constraints.maxHeight.isFinite
            ? constraints.maxHeight
            : fallbackHeight;

        return Container(
          height: sheetHeight,
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
                      tokens.bg,
                      tokens.bgSecondary,
                      tokens.bg,
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
                bottom: true,
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: palette.scheme.onSurfaceVariant
                            .withValues(alpha: 0.35),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                      child: Row(
                        children: [
                          const SizedBox(width: 44),
                          Expanded(
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: palette.titleStyle(theme.textTheme).copyWith(
                                    fontSize: 24,
                                  ),
                            ),
                          ),
                          if (headerTrailing case final action?) ...[
                            action,
                            const SizedBox(width: 4),
                          ],
                          LuxSheetCloseButton(
                            color: palette.scheme.onSurface,
                            background: palette.scheme.onSurface
                                .withValues(alpha: 0.06),
                          ),
                        ],
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
      },
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

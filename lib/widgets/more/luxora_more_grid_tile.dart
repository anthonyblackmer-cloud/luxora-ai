import 'package:flutter/material.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Discipline-style premium grid tile — Luxora gold palette.
class LuxoraMoreGridTile extends StatelessWidget {
  const LuxoraMoreGridTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.featured = false,
    this.animationIndex = 0,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool featured;
  final int animationIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final tokens = luxThemeTokensOf(context);
    final accent = tokens.accent;
    final r = 26.0;
    final hi = scheme.surface.withValues(alpha: 0.42);
    final lo = tokens.bgSecondary.withValues(alpha: 0.72);
    final iconBox = featured ? 82.0 : 64.0;
    final iconGlyph = featured ? 44.0 : 34.0;

    final cardGradient = featured
        ? LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.lerp(hi, accent, 0.14)!,
              lo,
              accent.withValues(alpha: 0.12),
            ],
            stops: const [0.0, 0.42, 1.0],
          )
        : LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.lerp(hi, scheme.surface, 0.12)!,
              lo,
            ],
          );

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 420 + animationIndex * 45),
      curve: Curves.easeOutCubic,
      builder: (context, t, child) {
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, (1 - t) * 14),
            child: child,
          ),
        );
      },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(r),
          splashColor: accent.withValues(alpha: 0.14),
          highlightColor: accent.withValues(alpha: 0.07),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(r),
              gradient: cardGradient,
              border: Border.all(
                color: featured
                    ? accent.withValues(alpha: 0.55)
                    : accent.withValues(alpha: 0.18),
                width: featured ? 1.6 : 1.1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.42),
                  blurRadius: 24,
                  offset: const Offset(0, 12),
                  spreadRadius: -6,
                ),
                BoxShadow(
                  color: accent.withValues(alpha: featured ? 0.28 : 0.12),
                  blurRadius: 32,
                  spreadRadius: -8,
                  offset: const Offset(0, 16),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(r - 1),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.center,
                          colors: [
                            Colors.white.withValues(alpha: 0.07),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: IgnorePointer(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            center: const Alignment(-0.92, -0.92),
                            radius: 1.05,
                            colors: [
                              accent.withValues(alpha: featured ? 0.18 : 0.1),
                              Colors.transparent,
                            ],
                            stops: const [0.0, 0.58],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(11, 16, 11, 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          child: Container(
                            width: iconBox,
                            height: iconBox,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  accent.withValues(alpha: featured ? 0.55 : 0.38),
                                  accent.withValues(alpha: 0.05),
                                ],
                                stops: const [0.32, 1.0],
                              ),
                              border: Border.all(
                                color: accent.withValues(
                                  alpha: featured ? 0.75 : 0.48,
                                ),
                                width: featured ? 2.2 : 1.4,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: accent.withValues(
                                    alpha: featured ? 0.65 : 0.4,
                                  ),
                                  blurRadius: featured ? 24 : 16,
                                  spreadRadius: featured ? 2 : 0,
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Icon(icon, color: accent, size: iconGlyph),
                          ),
                        ),
                        SizedBox(height: featured ? 13 : 10),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: featured ? 18 : 16,
                            height: 1.05,
                            letterSpacing: -0.35,
                            color: tokens.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Expanded(
                          child: Text(
                            subtitle,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: tokens.textMuted,
                              height: 1.18,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Compact list row for Account / App sections on the More screen.
class LuxoraMoreListTile extends StatelessWidget {
  const LuxoraMoreListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final tokens = luxThemeTokensOf(context);
    final accent = tokens.accent;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: tokens.bgSecondary.withValues(alpha: 0.5),
            border: Border.all(color: accent.withValues(alpha: 0.14)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: accent.withValues(alpha: 0.12),
                    border: Border.all(
                      color: accent.withValues(alpha: 0.35),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Icon(icon, color: accent, size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: tokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: tokens.textMuted,
                          height: 1.25,
                        ),
                      ),
                    ],
                  ),
                ),
                trailing ??
                    Icon(
                      Icons.chevron_right_rounded,
                      color: tokens.textMuted.withValues(alpha: 0.9),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

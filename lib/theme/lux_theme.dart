import 'package:flutter/material.dart';

enum LuxThemePreset {
  goldenEmber,
  midnightAmethyst,
  emeraldHaven,
}

class LuxThemePalette {
  const LuxThemePalette({
    required this.id,
    required this.name,
    required this.mood,
    required this.bg,
    required this.bgSecondary,
    required this.accent,
    required this.accentSecondary,
    required this.textPrimary,
    required this.textMuted,
    required this.surface,
    required this.glow,
    required this.overlayTint,
  });

  final LuxThemePreset id;
  final String name;
  final String mood;
  final Color bg;
  final Color bgSecondary;
  final Color accent;
  final Color accentSecondary;
  final Color textPrimary;
  final Color textMuted;
  final Color surface;
  final Color glow;
  final Color overlayTint;
}

@immutable
class LuxThemeTokens extends ThemeExtension<LuxThemeTokens> {
  const LuxThemeTokens({
    required this.bg,
    required this.bgSecondary,
    required this.accent,
    required this.accentSecondary,
    required this.textPrimary,
    required this.textMuted,
    required this.glow,
    required this.orbSecondary,
    required this.orbTertiary,
  });

  factory LuxThemeTokens.fromPalette(LuxThemePalette p) => LuxThemeTokens(
        bg: p.bg,
        bgSecondary: p.bgSecondary,
        accent: p.accent,
        accentSecondary: p.accentSecondary,
        textPrimary: p.textPrimary,
        textMuted: p.textMuted,
        glow: p.glow,
        orbSecondary: p.accentSecondary.withValues(alpha: 0.16),
        orbTertiary: p.accent.withValues(alpha: 0.12),
      );

  final Color bg;
  final Color bgSecondary;
  final Color accent;
  final Color accentSecondary;
  final Color textPrimary;
  final Color textMuted;
  final Color glow;
  final Color orbSecondary;
  final Color orbTertiary;

  @override
  LuxThemeTokens copyWith({
    Color? bg,
    Color? bgSecondary,
    Color? accent,
    Color? accentSecondary,
    Color? textPrimary,
    Color? textMuted,
    Color? glow,
    Color? orbSecondary,
    Color? orbTertiary,
  }) {
    return LuxThemeTokens(
      bg: bg ?? this.bg,
      bgSecondary: bgSecondary ?? this.bgSecondary,
      accent: accent ?? this.accent,
      accentSecondary: accentSecondary ?? this.accentSecondary,
      textPrimary: textPrimary ?? this.textPrimary,
      textMuted: textMuted ?? this.textMuted,
      glow: glow ?? this.glow,
      orbSecondary: orbSecondary ?? this.orbSecondary,
      orbTertiary: orbTertiary ?? this.orbTertiary,
    );
  }

  @override
  LuxThemeTokens lerp(ThemeExtension<LuxThemeTokens>? other, double t) {
    if (other is! LuxThemeTokens) return this;
    return LuxThemeTokens(
      bg: Color.lerp(bg, other.bg, t) ?? bg,
      bgSecondary: Color.lerp(bgSecondary, other.bgSecondary, t) ?? bgSecondary,
      accent: Color.lerp(accent, other.accent, t) ?? accent,
      accentSecondary:
          Color.lerp(accentSecondary, other.accentSecondary, t) ?? accentSecondary,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t) ?? textPrimary,
      textMuted: Color.lerp(textMuted, other.textMuted, t) ?? textMuted,
      glow: Color.lerp(glow, other.glow, t) ?? glow,
      orbSecondary: Color.lerp(orbSecondary, other.orbSecondary, t) ?? orbSecondary,
      orbTertiary: Color.lerp(orbTertiary, other.orbTertiary, t) ?? orbTertiary,
    );
  }
}

const _goldenEmber = LuxThemePalette(
  id: LuxThemePreset.goldenEmber,
  name: 'Golden Ember',
  mood: 'Warm ultra-luxury',
  bg: Color(0xFF0C0A09),
  bgSecondary: Color(0xFF1C1917),
  accent: Color(0xFFFBBF24),
  accentSecondary: Color(0xFFF97316),
  textPrimary: Color(0xFFFAFAF9),
  textMuted: Color(0xFFA8A29E),
  surface: Color(0xFF1C1917),
  glow: Color(0x33FBBF24),
  overlayTint: Color(0x00000000),
);

const _midnightAmethyst = LuxThemePalette(
  id: LuxThemePreset.midnightAmethyst,
  name: 'Midnight Amethyst',
  mood: 'Mysterious and exclusive',
  bg: Color(0xFF050505),
  bgSecondary: Color(0xFF0F0F1A),
  accent: Color(0xFF9F7AEA),
  accentSecondary: Color(0xFFA8B2C8),
  textPrimary: Color(0xFFF0F0F5),
  textMuted: Color(0xFFA8B2C8),
  surface: Color(0xFF131321),
  glow: Color(0x449F7AEA),
  overlayTint: Color(0x140D0818),
);

const _emeraldHaven = LuxThemePalette(
  id: LuxThemePreset.emeraldHaven,
  name: 'Emerald Haven',
  mood: 'Serene tropical luxury',
  bg: Color(0xFF0A120F),
  bgSecondary: Color(0xFF11241F),
  accent: Color(0xFF10B981),
  accentSecondary: Color(0xFFEDE4C9),
  textPrimary: Color(0xFFF5F0E6),
  textMuted: Color(0xFFA3B8A9),
  surface: Color(0xFF132923),
  glow: Color(0x3D10B981),
  overlayTint: Color(0x0D052015),
);

const luxThemePalettes = <LuxThemePalette>[
  _goldenEmber,
  _midnightAmethyst,
  _emeraldHaven,
];

LuxThemePalette paletteFor(LuxThemePreset preset) => switch (preset) {
      LuxThemePreset.goldenEmber => _goldenEmber,
      LuxThemePreset.midnightAmethyst => _midnightAmethyst,
      LuxThemePreset.emeraldHaven => _emeraldHaven,
    };

abstract final class LuxColors {
  static const bg = Color(0xFF0C0A09);
  static const gold = Color(0xFFFBBF24);
  static const sunset = Color(0xFFF97316);
  static const ocean = Color(0xFF22D3EE);
  static const cream = Color(0xFFFEF3C7);
  static const stone300 = Color(0xFFD6D3D1);
  static const stone400 = Color(0xFFA8A29E);
  static const stone500 = Color(0xFF78716C);

  /// Gems — quiet insider intelligence (muted champagne / stone).
  static const gemAccent = Color(0xFFC4B5A0);
  static const gemMuted = Color(0xFF78716C);
  static const gemSurface = Color(0xFF1A1816);

  /// Feed — live discovery energy (brighter cyan / coral).
  static const feedAccent = Color(0xFF38BDF8);
  static const feedLive = Color(0xFF34D399);
  static const feedHot = Color(0xFFFB7185);
}

ThemeData buildLuxTheme(LuxThemePreset preset) {
  final palette = paletteFor(preset);
  final tokens = LuxThemeTokens.fromPalette(palette);
  const displayFamily = 'Cormorant Garamond';
  const bodyFamily = 'Noto Sans';

  final baseText = ThemeData(brightness: Brightness.dark).textTheme;

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: bodyFamily,
    // Mood chips use emoji — Noto fallback avoids web console warnings.
    fontFamilyFallback: const [
      'Noto Sans',
      'Noto Sans SC',
      'Noto Sans JP',
      'Noto Sans KR',
      'Noto Sans Devanagari',
      'Noto Color Emoji',
      'Segoe UI Emoji',
      'Apple Color Emoji',
    ],
    scaffoldBackgroundColor: palette.bg,
    colorScheme: ColorScheme.dark(
      primary: palette.accent,
      secondary: palette.accentSecondary,
      surface: palette.surface,
      onSurface: palette.textPrimary,
      onSurfaceVariant: palette.textMuted,
    ),
    cardTheme: CardThemeData(
      color: palette.surface.withValues(alpha: 0.88),
      shadowColor: palette.glow,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: palette.bgSecondary.withValues(alpha: 0.94),
      indicatorColor: palette.accent.withValues(alpha: 0.24),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: selected ? palette.accent : palette.textMuted,
        );
      }),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: palette.surface.withValues(alpha: 0.72),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: palette.accent.withValues(alpha: 0.24)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: palette.accent.withValues(alpha: 0.2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: palette.accent.withValues(alpha: 0.54)),
      ),
      hintStyle: TextStyle(color: palette.textMuted),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: palette.accent,
        foregroundColor: palette.bg,
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
    ),
    extensions: [tokens],
    textTheme: baseText
        .apply(
          bodyColor: palette.textPrimary,
          displayColor: palette.textPrimary,
        )
        .copyWith(
          displayLarge: baseText.displayLarge?.copyWith(
            fontFamily: displayFamily,
            fontWeight: FontWeight.w600,
            height: 1.05,
          ),
          displayMedium: baseText.displayMedium?.copyWith(
            fontFamily: displayFamily,
            fontWeight: FontWeight.w600,
          ),
          headlineMedium: baseText.headlineMedium?.copyWith(
            fontFamily: displayFamily,
            fontWeight: FontWeight.w600,
          ),
          titleLarge: baseText.titleLarge?.copyWith(
            fontFamily: displayFamily,
            fontWeight: FontWeight.w600,
          ),
        ),
  );
}

LuxThemeTokens luxThemeTokensOf(BuildContext context) =>
    Theme.of(context).extension<LuxThemeTokens>() ??
    LuxThemeTokens.fromPalette(_goldenEmber);

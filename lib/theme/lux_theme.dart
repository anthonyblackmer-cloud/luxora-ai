import 'package:flutter/material.dart';

enum LuxThemePreset {
  goldenEmber,
  midnightAmethyst,
  emeraldHaven,
  arctic,
  cloud,
}

class LuxThemePalette {
  const LuxThemePalette({
    required this.id,
    required this.name,
    required this.mood,
    required this.isLight,
    required this.bg,
    required this.bgSecondary,
    required this.accent,
    required this.accentSecondary,
    required this.textPrimary,
    required this.textMuted,
    required this.surface,
    required this.onAccent,
    required this.glow,
    required this.overlayTint,
  });

  final LuxThemePreset id;
  final String name;
  final String mood;
  final bool isLight;
  final Color bg;
  final Color bgSecondary;
  final Color accent;
  final Color accentSecondary;
  final Color textPrimary;
  final Color textMuted;
  final Color surface;
  final Color onAccent;
  final Color glow;
  final Color overlayTint;
}

@immutable
class LuxThemeTokens extends ThemeExtension<LuxThemeTokens> {
  const LuxThemeTokens({
    required this.isLight,
    required this.bg,
    required this.bgSecondary,
    required this.surface,
    required this.accent,
    required this.accentSecondary,
    required this.textPrimary,
    required this.textMuted,
    required this.onAccent,
    required this.glow,
    required this.borderSubtle,
    required this.panelFill,
    required this.cardFill,
    required this.appBarScrim,
    required this.elevationShadow,
    required this.orbSecondary,
    required this.orbTertiary,
  });

  factory LuxThemeTokens.fromPalette(LuxThemePalette p) {
    final borderSubtle = p.isLight
        ? p.textPrimary.withValues(alpha: 0.1)
        : Colors.white.withValues(alpha: 0.08);
    final panelFill = p.isLight
        ? p.bgSecondary.withValues(alpha: 0.85)
        : Colors.white.withValues(alpha: 0.04);
    final cardFill = p.isLight
        ? p.surface
        : p.bgSecondary.withValues(alpha: 0.46);
    final appBarScrim = p.isLight
        ? p.bg.withValues(alpha: 0.94)
        : Colors.black.withValues(alpha: 0.28);
    final elevationShadow = p.isLight
        ? p.textPrimary.withValues(alpha: 0.08)
        : p.glow;
    final orbScale = p.isLight ? 0.35 : 1.0;

    return LuxThemeTokens(
      isLight: p.isLight,
      bg: p.bg,
      bgSecondary: p.bgSecondary,
      surface: p.surface,
      accent: p.accent,
      accentSecondary: p.accentSecondary,
      textPrimary: p.textPrimary,
      textMuted: p.textMuted,
      onAccent: p.onAccent,
      glow: p.glow,
      borderSubtle: borderSubtle,
      panelFill: panelFill,
      cardFill: cardFill,
      appBarScrim: appBarScrim,
      elevationShadow: elevationShadow,
      orbSecondary: p.accentSecondary.withValues(alpha: 0.16 * orbScale),
      orbTertiary: p.accent.withValues(alpha: 0.12 * orbScale),
    );
  }

  final bool isLight;
  final Color bg;
  final Color bgSecondary;
  final Color surface;
  final Color accent;
  final Color accentSecondary;
  final Color textPrimary;
  final Color textMuted;
  final Color onAccent;
  final Color glow;
  final Color borderSubtle;
  final Color panelFill;
  final Color cardFill;
  final Color appBarScrim;
  final Color elevationShadow;
  final Color orbSecondary;
  final Color orbTertiary;

  @override
  LuxThemeTokens copyWith({
    bool? isLight,
    Color? bg,
    Color? bgSecondary,
    Color? surface,
    Color? accent,
    Color? accentSecondary,
    Color? textPrimary,
    Color? textMuted,
    Color? onAccent,
    Color? glow,
    Color? borderSubtle,
    Color? panelFill,
    Color? cardFill,
    Color? appBarScrim,
    Color? elevationShadow,
    Color? orbSecondary,
    Color? orbTertiary,
  }) {
    return LuxThemeTokens(
      isLight: isLight ?? this.isLight,
      bg: bg ?? this.bg,
      bgSecondary: bgSecondary ?? this.bgSecondary,
      surface: surface ?? this.surface,
      accent: accent ?? this.accent,
      accentSecondary: accentSecondary ?? this.accentSecondary,
      textPrimary: textPrimary ?? this.textPrimary,
      textMuted: textMuted ?? this.textMuted,
      onAccent: onAccent ?? this.onAccent,
      glow: glow ?? this.glow,
      borderSubtle: borderSubtle ?? this.borderSubtle,
      panelFill: panelFill ?? this.panelFill,
      cardFill: cardFill ?? this.cardFill,
      appBarScrim: appBarScrim ?? this.appBarScrim,
      elevationShadow: elevationShadow ?? this.elevationShadow,
      orbSecondary: orbSecondary ?? this.orbSecondary,
      orbTertiary: orbTertiary ?? this.orbTertiary,
    );
  }

  @override
  LuxThemeTokens lerp(ThemeExtension<LuxThemeTokens>? other, double t) {
    if (other is! LuxThemeTokens) return this;
    return LuxThemeTokens(
      isLight: t < 0.5 ? isLight : other.isLight,
      bg: Color.lerp(bg, other.bg, t) ?? bg,
      bgSecondary: Color.lerp(bgSecondary, other.bgSecondary, t) ?? bgSecondary,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      accent: Color.lerp(accent, other.accent, t) ?? accent,
      accentSecondary:
          Color.lerp(accentSecondary, other.accentSecondary, t) ?? accentSecondary,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t) ?? textPrimary,
      textMuted: Color.lerp(textMuted, other.textMuted, t) ?? textMuted,
      onAccent: Color.lerp(onAccent, other.onAccent, t) ?? onAccent,
      glow: Color.lerp(glow, other.glow, t) ?? glow,
      borderSubtle: Color.lerp(borderSubtle, other.borderSubtle, t) ?? borderSubtle,
      panelFill: Color.lerp(panelFill, other.panelFill, t) ?? panelFill,
      cardFill: Color.lerp(cardFill, other.cardFill, t) ?? cardFill,
      appBarScrim: Color.lerp(appBarScrim, other.appBarScrim, t) ?? appBarScrim,
      elevationShadow:
          Color.lerp(elevationShadow, other.elevationShadow, t) ?? elevationShadow,
      orbSecondary: Color.lerp(orbSecondary, other.orbSecondary, t) ?? orbSecondary,
      orbTertiary: Color.lerp(orbTertiary, other.orbTertiary, t) ?? orbTertiary,
    );
  }
}

const _goldenEmber = LuxThemePalette(
  id: LuxThemePreset.goldenEmber,
  name: 'Golden Ember',
  mood: 'Warm ultra-luxury',
  isLight: false,
  bg: Color(0xFF0C0A09),
  bgSecondary: Color(0xFF1C1917),
  accent: Color(0xFFFBBF24),
  accentSecondary: Color(0xFFF97316),
  textPrimary: Color(0xFFFAFAF9),
  textMuted: Color(0xFFA8A29E),
  surface: Color(0xFF1C1917),
  onAccent: Color(0xFF0C0A09),
  glow: Color(0x33FBBF24),
  overlayTint: Color(0x00000000),
);

const _midnightAmethyst = LuxThemePalette(
  id: LuxThemePreset.midnightAmethyst,
  name: 'Midnight Amethyst',
  mood: 'Mysterious and exclusive',
  isLight: false,
  bg: Color(0xFF050505),
  bgSecondary: Color(0xFF0F0F1A),
  accent: Color(0xFF9F7AEA),
  accentSecondary: Color(0xFFA8B2C8),
  textPrimary: Color(0xFFF0F0F5),
  textMuted: Color(0xFFA8B2C8),
  surface: Color(0xFF131321),
  onAccent: Color(0xFF050505),
  glow: Color(0x449F7AEA),
  overlayTint: Color(0x140D0818),
);

const _emeraldHaven = LuxThemePalette(
  id: LuxThemePreset.emeraldHaven,
  name: 'Emerald Haven',
  mood: 'Serene tropical luxury',
  isLight: false,
  bg: Color(0xFF0A120F),
  bgSecondary: Color(0xFF11241F),
  accent: Color(0xFF10B981),
  accentSecondary: Color(0xFFEDE4C9),
  textPrimary: Color(0xFFF5F0E6),
  textMuted: Color(0xFFA3B8A9),
  surface: Color(0xFF132923),
  onAccent: Color(0xFF0A120F),
  glow: Color(0x3D10B981),
  overlayTint: Color(0x0D052015),
);

/// Apple / Linear-inspired productivity clarity — high contrast, minimal accent.
const _arctic = LuxThemePalette(
  id: LuxThemePreset.arctic,
  name: 'Arctic',
  mood: 'Clean modern clarity',
  isLight: true,
  bg: Color(0xFFFFFFFF),
  bgSecondary: Color(0xFFF5F5F7),
  accent: Color(0xFF111827),
  accentSecondary: Color(0xFF6B7280),
  textPrimary: Color(0xFF111827),
  textMuted: Color(0xFF6B7280),
  surface: Color(0xFFFFFFFF),
  onAccent: Color(0xFFFFFFFF),
  glow: Color(0x14111827),
  overlayTint: Color(0x00000000),
);

/// Boutique travel magazine — warm surfaces, soft blue accents.
const _cloud = LuxThemePalette(
  id: LuxThemePreset.cloud,
  name: 'Cloud',
  mood: 'Calm boutique travel',
  isLight: true,
  bg: Color(0xFFFAF8F5),
  bgSecondary: Color(0xFFF3EDE4),
  accent: Color(0xFF6B8CAE),
  accentSecondary: Color(0xFFB8A99A),
  textPrimary: Color(0xFF3D3832),
  textMuted: Color(0xFF7A7168),
  surface: Color(0xFFFFFDF9),
  onAccent: Color(0xFFFFFFFF),
  glow: Color(0x266B8CAE),
  overlayTint: Color(0x08FAF8F5),
);

const luxThemePalettes = <LuxThemePalette>[
  _goldenEmber,
  _midnightAmethyst,
  _emeraldHaven,
  _arctic,
  _cloud,
];

LuxThemePalette paletteFor(LuxThemePreset preset) => switch (preset) {
      LuxThemePreset.goldenEmber => _goldenEmber,
      LuxThemePreset.midnightAmethyst => _midnightAmethyst,
      LuxThemePreset.emeraldHaven => _emeraldHaven,
      LuxThemePreset.arctic => _arctic,
      LuxThemePreset.cloud => _cloud,
    };

/// Legacy fixed palette — prefer [luxThemeTokensOf] for theme-aware UI.
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
  final brightness = palette.isLight ? Brightness.light : Brightness.dark;

  final baseText = ThemeData(brightness: brightness).textTheme;

  final colorScheme = palette.isLight
      ? ColorScheme.light(
          primary: palette.accent,
          onPrimary: palette.onAccent,
          secondary: palette.accentSecondary,
          surface: palette.surface,
          onSurface: palette.textPrimary,
          onSurfaceVariant: palette.textMuted,
          outline: palette.textMuted.withValues(alpha: 0.35),
        )
      : ColorScheme.dark(
          primary: palette.accent,
          onPrimary: palette.onAccent,
          secondary: palette.accentSecondary,
          surface: palette.surface,
          onSurface: palette.textPrimary,
          onSurfaceVariant: palette.textMuted,
        );

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    fontFamily: bodyFamily,
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
    colorScheme: colorScheme,
    dividerColor: tokens.borderSubtle,
    iconTheme: IconThemeData(color: palette.textMuted),
    cardTheme: CardThemeData(
      color: tokens.cardFill,
      shadowColor: tokens.elevationShadow,
      elevation: palette.isLight ? 1.5 : 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: palette.isLight
            ? BorderSide(color: tokens.borderSubtle)
            : BorderSide.none,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: palette.isLight
          ? palette.bg.withValues(alpha: 0.96)
          : palette.bgSecondary.withValues(alpha: 0.94),
      indicatorColor: palette.accent.withValues(alpha: palette.isLight ? 0.12 : 0.24),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return TextStyle(
          color: selected ? palette.accent : palette.textMuted,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: selected ? palette.accent : palette.textMuted,
        );
      }),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: tokens.appBarScrim,
      foregroundColor: palette.textPrimary,
      elevation: palette.isLight ? 0.5 : 0,
      scrolledUnderElevation: palette.isLight ? 1 : 0,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: palette.textPrimary),
      titleTextStyle: TextStyle(
        color: palette.textPrimary,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        fontFamily: bodyFamily,
      ),
    ),
    tabBarTheme: TabBarThemeData(
      indicatorColor: palette.accent,
      labelColor: palette.textPrimary,
      unselectedLabelColor: palette.textMuted,
      dividerColor: Colors.transparent,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: palette.isLight
          ? palette.bgSecondary.withValues(alpha: 0.65)
          : palette.surface.withValues(alpha: 0.72),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: palette.accent.withValues(alpha: 0.24)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: tokens.borderSubtle),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: palette.accent.withValues(alpha: palette.isLight ? 0.65 : 0.54),
        ),
      ),
      hintStyle: TextStyle(color: palette.textMuted),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: palette.accent,
        foregroundColor: palette.onAccent,
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
        elevation: palette.isLight ? 0 : 0,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: palette.accent),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: palette.isLight ? palette.textPrimary : palette.bgSecondary,
      contentTextStyle: TextStyle(
        color: palette.isLight ? palette.bg : palette.textPrimary,
      ),
      behavior: SnackBarBehavior.floating,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: palette.bgSecondary,
      titleTextStyle: TextStyle(
        color: palette.textPrimary,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
      contentTextStyle: TextStyle(color: palette.textMuted),
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

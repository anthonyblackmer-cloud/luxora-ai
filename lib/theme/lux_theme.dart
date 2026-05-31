import 'package:flutter/material.dart';

enum LuxThemePreset {
  goldenEmber,
  midnightAmethyst,
  emeraldHaven,
  rivieraWhite,
  coastalGlass,
  champagneLuxe,
  blackCard,
}

/// Visual treatment layered on top of palette colors.
enum LuxThemeSurfaceStyle {
  cinematic,
  resort,
  frostedGlass,
  champagne,
  blackCard,
}

class LuxThemePalette {
  const LuxThemePalette({
    required this.id,
    required this.name,
    required this.mood,
    required this.isLight,
    required this.surfaceStyle,
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
  final LuxThemeSurfaceStyle surfaceStyle;
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
    required this.surfaceStyle,
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
    required this.frostedGlassCards,
    required this.matteBlackButtons,
    required this.goldDisplayHeadlines,
  });

  factory LuxThemeTokens.fromPalette(LuxThemePalette p) {
    final frosted = p.surfaceStyle == LuxThemeSurfaceStyle.frostedGlass;
    final champagne = p.surfaceStyle == LuxThemeSurfaceStyle.champagne;
    final blackCard = p.surfaceStyle == LuxThemeSurfaceStyle.blackCard;

    final borderSubtle = frosted
        ? Colors.transparent
        : p.isLight
            ? p.textPrimary.withValues(alpha: champagne ? 0.06 : 0.1)
            : Colors.white.withValues(alpha: 0.08);

    final panelFill = frosted
        ? Colors.white.withValues(alpha: 0.55)
        : p.isLight
            ? p.bgSecondary.withValues(alpha: 0.85)
            : Colors.white.withValues(alpha: 0.04);

    final cardFill = frosted
        ? Colors.white.withValues(alpha: 0.68)
        : p.isLight
            ? p.surface
            : p.bgSecondary.withValues(alpha: 0.46);

    final appBarScrim = p.isLight
        ? p.bg.withValues(alpha: 0.94)
        : Colors.black.withValues(alpha: 0.28);

    final elevationShadow = champagne
        ? p.textPrimary.withValues(alpha: 0.04)
        : p.isLight
            ? p.textPrimary.withValues(alpha: 0.08)
            : p.glow;

    final orbScale = p.isLight ? 0.35 : 1.0;

    return LuxThemeTokens(
      isLight: p.isLight,
      surfaceStyle: p.surfaceStyle,
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
      frostedGlassCards: frosted,
      matteBlackButtons: blackCard,
      goldDisplayHeadlines: champagne || blackCard,
    );
  }

  final bool isLight;
  final LuxThemeSurfaceStyle surfaceStyle;
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
  final bool frostedGlassCards;
  final bool matteBlackButtons;
  final bool goldDisplayHeadlines;

  @override
  LuxThemeTokens copyWith({
    bool? isLight,
    LuxThemeSurfaceStyle? surfaceStyle,
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
    bool? frostedGlassCards,
    bool? matteBlackButtons,
    bool? goldDisplayHeadlines,
  }) {
    return LuxThemeTokens(
      isLight: isLight ?? this.isLight,
      surfaceStyle: surfaceStyle ?? this.surfaceStyle,
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
      frostedGlassCards: frostedGlassCards ?? this.frostedGlassCards,
      matteBlackButtons: matteBlackButtons ?? this.matteBlackButtons,
      goldDisplayHeadlines: goldDisplayHeadlines ?? this.goldDisplayHeadlines,
    );
  }

  @override
  LuxThemeTokens lerp(ThemeExtension<LuxThemeTokens>? other, double t) {
    if (other is! LuxThemeTokens) return this;
    return LuxThemeTokens(
      isLight: t < 0.5 ? isLight : other.isLight,
      surfaceStyle: t < 0.5 ? surfaceStyle : other.surfaceStyle,
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
      frostedGlassCards: t < 0.5 ? frostedGlassCards : other.frostedGlassCards,
      matteBlackButtons: t < 0.5 ? matteBlackButtons : other.matteBlackButtons,
      goldDisplayHeadlines:
          t < 0.5 ? goldDisplayHeadlines : other.goldDisplayHeadlines,
    );
  }
}

const _goldenEmber = LuxThemePalette(
  id: LuxThemePreset.goldenEmber,
  name: 'Golden Ember',
  mood: 'Warm ultra-luxury',
  isLight: false,
  surfaceStyle: LuxThemeSurfaceStyle.cinematic,
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
  surfaceStyle: LuxThemeSurfaceStyle.cinematic,
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
  surfaceStyle: LuxThemeSurfaceStyle.cinematic,
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

/// Four Seasons / Ritz — luxury resort brochure.
const _rivieraWhite = LuxThemePalette(
  id: LuxThemePreset.rivieraWhite,
  name: 'Riviera White',
  mood: 'Elegant luxury travel magazine',
  isLight: true,
  surfaceStyle: LuxThemeSurfaceStyle.resort,
  bg: Color(0xFFF8F6F1),
  bgSecondary: Color(0xFFF0EBE3),
  accent: Color(0xFFC9A86A),
  accentSecondary: Color(0xFFA88752),
  textPrimary: Color(0xFF1F1F1F),
  textMuted: Color(0xFF6B6B6B),
  surface: Color(0xFFFFFFFF),
  onAccent: Color(0xFF1F1F1F),
  glow: Color(0x26C9A86A),
  overlayTint: Color(0x08F8F6F1),
);

/// Amalfi / Santorini — frosted coastal glass.
const _coastalGlass = LuxThemePalette(
  id: LuxThemePreset.coastalGlass,
  name: 'Coastal Glass',
  mood: 'Clean premium vacation energy',
  isLight: true,
  surfaceStyle: LuxThemeSurfaceStyle.frostedGlass,
  bg: Color(0xFFF4F9FB),
  bgSecondary: Color(0xFFE3F2F7),
  accent: Color(0xFF3A8DAD),
  accentSecondary: Color(0xFF79C2D0),
  textPrimary: Color(0xFF22313F),
  textMuted: Color(0xFF5A6B7A),
  surface: Color(0xFFFFFFFF),
  onAccent: Color(0xFFFFFFFF),
  glow: Color(0x263A8DAD),
  overlayTint: Color(0x0AF4F9FB),
);

/// Luxury hotel lobby — champagne and rose gold.
const _champagneLuxe = LuxThemePalette(
  id: LuxThemePreset.champagneLuxe,
  name: 'Champagne Luxe',
  mood: 'Private concierge elegance',
  isLight: true,
  surfaceStyle: LuxThemeSurfaceStyle.champagne,
  bg: Color(0xFFFFFDF8),
  bgSecondary: Color(0xFFFBF3E8),
  accent: Color(0xFFD6B370),
  accentSecondary: Color(0xFFC6937A),
  textPrimary: Color(0xFF222222),
  textMuted: Color(0xFF6B6358),
  surface: Color(0xFFFFFFFF),
  onAccent: Color(0xFF222222),
  glow: Color(0x24D6B370),
  overlayTint: Color(0x08FFFDF8),
);

/// Centurion / private aviation — warm stone with matte black + gold.
const _blackCard = LuxThemePalette(
  id: LuxThemePreset.blackCard,
  name: 'Black Card',
  mood: 'Private aviation prestige',
  isLight: true,
  surfaceStyle: LuxThemeSurfaceStyle.blackCard,
  bg: Color(0xFFF3F0E8),
  bgSecondary: Color(0xFFEBE6DC),
  accent: Color(0xFFD4AF37),
  accentSecondary: Color(0xFFB88B4A),
  textPrimary: Color(0xFF1A1A1A),
  textMuted: Color(0xFF6B6560),
  surface: Color(0xFFFFFFFF),
  onAccent: Color(0xFFD4AF37),
  glow: Color(0x33D4AF37),
  overlayTint: Color(0x08F3F0E8),
);

const luxThemePalettes = <LuxThemePalette>[
  _goldenEmber,
  _midnightAmethyst,
  _emeraldHaven,
  _rivieraWhite,
  _coastalGlass,
  _champagneLuxe,
  _blackCard,
];

const luxThemePresetOrder = <LuxThemePreset>[
  LuxThemePreset.goldenEmber,
  LuxThemePreset.midnightAmethyst,
  LuxThemePreset.emeraldHaven,
  LuxThemePreset.rivieraWhite,
  LuxThemePreset.coastalGlass,
  LuxThemePreset.champagneLuxe,
  LuxThemePreset.blackCard,
];

LuxThemePreset luxThemePresetFromStorage(String? raw) {
  if (raw == null) return LuxThemePreset.goldenEmber;
  if (raw == 'arctic' || raw == 'cloud') {
    return LuxThemePreset.rivieraWhite;
  }
  for (final preset in LuxThemePreset.values) {
    if (preset.name == raw) return preset;
  }
  return LuxThemePreset.goldenEmber;
}

LuxThemePalette paletteFor(LuxThemePreset preset) => switch (preset) {
      LuxThemePreset.goldenEmber => _goldenEmber,
      LuxThemePreset.midnightAmethyst => _midnightAmethyst,
      LuxThemePreset.emeraldHaven => _emeraldHaven,
      LuxThemePreset.rivieraWhite => _rivieraWhite,
      LuxThemePreset.coastalGlass => _coastalGlass,
      LuxThemePreset.champagneLuxe => _champagneLuxe,
      LuxThemePreset.blackCard => _blackCard,
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
  final borderlessCards = tokens.frostedGlassCards ||
      palette.surfaceStyle == LuxThemeSurfaceStyle.champagne;

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

  final displayColor = tokens.goldDisplayHeadlines
      ? palette.accent
      : palette.textPrimary;

  final filledButtonStyle = tokens.matteBlackButtons
      ? FilledButton.styleFrom(
          backgroundColor: const Color(0xFF0D0D0D),
          foregroundColor: const Color(0xFFD4AF37),
          iconColor: const Color(0xFFD4AF37),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
          elevation: 0,
        )
      : FilledButton.styleFrom(
          backgroundColor: palette.accent,
          foregroundColor: palette.onAccent,
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
          elevation: 0,
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
      elevation: palette.isLight && !borderlessCards ? 1.5 : 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: borderlessCards || !palette.isLight
            ? BorderSide.none
            : BorderSide(color: tokens.borderSubtle),
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
    filledButtonTheme: FilledButtonThemeData(style: filledButtonStyle),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: palette.accent),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor:
          palette.isLight ? palette.surface : const Color(0xFF292524),
      contentTextStyle: TextStyle(
        color: palette.textPrimary,
        fontWeight: FontWeight.w500,
      ),
      actionTextColor: palette.accent,
      closeIconColor: palette.accent,
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
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
          displayColor: displayColor,
        )
        .copyWith(
          displayLarge: baseText.displayLarge?.copyWith(
            fontFamily: displayFamily,
            fontWeight: FontWeight.w600,
            height: 1.05,
            color: displayColor,
          ),
          displayMedium: baseText.displayMedium?.copyWith(
            fontFamily: displayFamily,
            fontWeight: FontWeight.w600,
            color: displayColor,
          ),
          headlineMedium: baseText.headlineMedium?.copyWith(
            fontFamily: displayFamily,
            fontWeight: FontWeight.w600,
            color: displayColor,
          ),
          titleLarge: baseText.titleLarge?.copyWith(
            fontFamily: displayFamily,
            fontWeight: FontWeight.w600,
            color: displayColor,
          ),
        ),
  );
}

LuxThemeTokens luxThemeTokensOf(BuildContext context) =>
    Theme.of(context).extension<LuxThemeTokens>() ??
    LuxThemeTokens.fromPalette(_goldenEmber);

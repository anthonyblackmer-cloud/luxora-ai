import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

ThemeData buildLuxTheme() {
  final display = GoogleFonts.cormorantGaramondTextTheme();
  final body = GoogleFonts.notoSansTextTheme();

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
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
    scaffoldBackgroundColor: LuxColors.bg,
    colorScheme: const ColorScheme.dark(
      primary: LuxColors.gold,
      secondary: LuxColors.sunset,
      surface: Color(0xFF1C1917),
      onSurface: Color(0xFFFAFAF9),
    ),
    textTheme: body.apply(
      bodyColor: const Color(0xFFFAFAF9),
      displayColor: const Color(0xFFFAFAF9),
    ).copyWith(
      displayLarge: display.displayLarge?.copyWith(
        fontWeight: FontWeight.w600,
        height: 1.05,
      ),
      displayMedium: display.displayMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      titleLarge: display.titleLarge?.copyWith(fontWeight: FontWeight.w600),
    ),
  );
}

ThemeData buildLuxLightTheme() {
  final display = GoogleFonts.cormorantGaramondTextTheme();
  final body = GoogleFonts.notoSansTextTheme();

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
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
    scaffoldBackgroundColor: const Color(0xFFFAFAF9),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFD97706),
      secondary: Color(0xFFEA580C),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF1C1917),
      onSurfaceVariant: Color(0xFF57534E),
    ),
    textTheme: body.apply(
      bodyColor: const Color(0xFF1C1917),
      displayColor: const Color(0xFF1C1917),
    ).copyWith(
      displayLarge: display.displayLarge?.copyWith(
        fontWeight: FontWeight.w600,
        height: 1.05,
      ),
      displayMedium: display.displayMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      titleLarge: display.titleLarge?.copyWith(fontWeight: FontWeight.w600),
    ),
  );
}

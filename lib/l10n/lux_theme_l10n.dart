import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

extension LuxThemePresetL10n on AppLocalizations {
  String themePresetLabel(LuxThemePreset preset) => switch (preset) {
        LuxThemePreset.goldenEmber => themeGoldenEmber,
        LuxThemePreset.midnightAmethyst => themeMidnightAmethyst,
        LuxThemePreset.emeraldHaven => themeEmeraldHaven,
        LuxThemePreset.rivieraWhite => themeRivieraWhite,
        LuxThemePreset.coastalGlass => themeCoastalGlass,
        LuxThemePreset.champagneLuxe => themeChampagneLuxe,
        LuxThemePreset.blackCard => themeBlackCard,
      };

  String themePresetMood(LuxThemePreset preset) => switch (preset) {
        LuxThemePreset.goldenEmber => themeGoldenEmberMood,
        LuxThemePreset.midnightAmethyst => themeMidnightAmethystMood,
        LuxThemePreset.emeraldHaven => themeEmeraldHavenMood,
        LuxThemePreset.rivieraWhite => themeRivieraWhiteMood,
        LuxThemePreset.coastalGlass => themeCoastalGlassMood,
        LuxThemePreset.champagneLuxe => themeChampagneLuxeMood,
        LuxThemePreset.blackCard => themeBlackCardMood,
      };
}

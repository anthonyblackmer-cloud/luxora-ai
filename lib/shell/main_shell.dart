import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/lux_background.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final tokens = luxThemeTokensOf(context);
    final compactNav = MediaQuery.sizeOf(context).width < 560;
    final navBg = tokens.bg.withValues(alpha: 0.92);

    return LuxBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // Web: let the browser resize the viewport; avoid double keyboard inset math.
        resizeToAvoidBottomInset: !kIsWeb,
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          height: compactNav ? 68 : 74,
          labelBehavior: compactNav
              ? NavigationDestinationLabelBehavior.onlyShowSelected
              : NavigationDestinationLabelBehavior.alwaysShow,
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
            final selected = states.contains(WidgetState.selected);
            return TextStyle(
              fontSize: compactNav ? 10 : 11,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
            );
          }),
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: navigationShell.goBranch,
          backgroundColor: navBg,
          indicatorColor: tokens.accent.withValues(alpha: 0.22),
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.chat_bubble_outline_rounded),
              selectedIcon: const Icon(Icons.chat_bubble_rounded),
              label: l.navConcierge,
            ),
            NavigationDestination(
              icon: const Icon(Icons.view_timeline_outlined),
              selectedIcon: const Icon(Icons.view_timeline_rounded),
              label: l.navTimeline,
            ),
            NavigationDestination(
              icon: const Icon(Icons.map_outlined),
              selectedIcon: const Icon(Icons.map_rounded),
              label: l.navMap,
            ),
            NavigationDestination(
              icon: const Icon(Icons.diamond_outlined),
              selectedIcon: const Icon(Icons.diamond_rounded),
              label: l.navGems,
              tooltip: l.navGems,
            ),
            NavigationDestination(
              icon: const Icon(Icons.explore_outlined),
              selectedIcon: const Icon(Icons.explore_rounded),
              label: l.navFeed,
              tooltip: l.navFeed,
            ),
            NavigationDestination(
              icon: const Icon(Icons.auto_awesome_outlined),
              selectedIcon: const Icon(Icons.auto_awesome_rounded),
              label: l.navTrips,
            ),
          ],
        ),
      ),
    );
  }
}

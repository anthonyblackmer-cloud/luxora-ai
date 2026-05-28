import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/lux_background.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return LuxBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // Web: let the browser resize the viewport; avoid double keyboard inset math.
        resizeToAvoidBottomInset: !kIsWeb,
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: navigationShell.goBranch,
          backgroundColor: const Color(0xFF0C0A09).withValues(alpha: 0.92),
          indicatorColor: LuxColors.gold.withValues(alpha: 0.2),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.chat_bubble_outline_rounded),
              selectedIcon: Icon(Icons.chat_bubble_rounded),
              label: 'Concierge',
            ),
            NavigationDestination(
              icon: Icon(Icons.view_timeline_outlined),
              selectedIcon: Icon(Icons.view_timeline_rounded),
              label: 'Timeline',
            ),
            NavigationDestination(
              icon: Icon(Icons.map_outlined),
              selectedIcon: Icon(Icons.map_rounded),
              label: 'Map',
            ),
            NavigationDestination(
              icon: Icon(Icons.diamond_outlined),
              selectedIcon: Icon(Icons.diamond_rounded),
              label: 'Gems',
              tooltip: 'Insider secrets & local-only',
            ),
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore_rounded),
              label: 'Feed',
              tooltip: 'Trending & live discovery',
            ),
            NavigationDestination(
              icon: Icon(Icons.auto_awesome_outlined),
              selectedIcon: Icon(Icons.auto_awesome_rounded),
              label: 'Trips',
            ),
          ],
        ),
      ),
    );
  }
}

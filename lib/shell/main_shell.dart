import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:luxora_ai/l10n/app_localizations.dart';

import 'package:luxora_ai/theme/lux_breakpoints.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/lux_background.dart';
import 'package:luxora_ai/widgets/lux_responsive_frame.dart';



/// Five-tab shell — Today · Map · Concierge · Discover · More.

class MainShell extends StatelessWidget {

  const MainShell({super.key, required this.navigationShell});



  final StatefulNavigationShell navigationShell;



  @override

  Widget build(BuildContext context) {

    final l = AppLocalizations.of(context);

    final tokens = luxThemeTokensOf(context);

    final compactNav = MediaQuery.sizeOf(context).width < 560;
    final tablet = luxIsTablet(context);
    final navBg = tokens.bg.withValues(alpha: 0.92);

    final navBar = NavigationBar(
      height: compactNav ? 68 : (tablet ? 64 : 74),

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

              icon: const Icon(Icons.event_note_outlined),

              selectedIcon: const Icon(Icons.event_note_rounded),

              label: l.navAgenda,

              tooltip: l.navAgenda,

            ),

            NavigationDestination(

              icon: const Icon(Icons.map_outlined),

              selectedIcon: const Icon(Icons.map_rounded),

              label: l.navMap,

            ),

            NavigationDestination(

              icon: const Icon(Icons.mic_none_outlined),

              selectedIcon: Icon(
                Icons.mic_rounded,
                color: tokens.accent.withValues(alpha: 0.95),
              ),

              label: l.navConcierge,

              tooltip: l.navConcierge,

            ),

            NavigationDestination(

              icon: const Icon(Icons.auto_awesome_outlined),

              selectedIcon: const Icon(Icons.auto_awesome_rounded),

              label: l.navDiscover,

              tooltip: l.navDiscover,

            ),

            NavigationDestination(

              icon: const Icon(Icons.diamond_outlined),

              selectedIcon: const Icon(Icons.diamond_rounded),

              label: l.navMore,

              tooltip: l.navMore,

            ),

          ],

        );

    return LuxBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: !kIsWeb,
        body: LuxResponsiveFrame(
          fullBleed: navigationShell.currentIndex == 1,
          child: navigationShell,
        ),
        bottomNavigationBar: navBar,
      ),
    );
  }
}

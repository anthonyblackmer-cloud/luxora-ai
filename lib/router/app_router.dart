import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/screens/concierge/concierge_screen.dart';
import 'package:luxora_ai/screens/experiences/experiences_screen.dart';
import 'package:luxora_ai/screens/gems/gems_screen.dart';
import 'package:luxora_ai/screens/itinerary/itinerary_screen.dart';
import 'package:luxora_ai/screens/landing/landing_screen.dart';
import 'package:luxora_ai/screens/map/map_screen.dart';
import 'package:luxora_ai/screens/onboarding/onboarding_screen.dart';
import 'package:luxora_ai/screens/story/why_luxora_screen.dart';
import 'package:luxora_ai/screens/trips/trips_screen.dart';
import 'package:luxora_ai/shell/main_shell.dart';

final _rootKey = GlobalKey<NavigatorState>();

GoRouter createAppRouter() {
  return GoRouter(
    navigatorKey: _rootKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LandingScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/story',
        builder: (context, state) => const WhyLuxoraScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/concierge',
                builder: (context, state) => const ConciergeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/itinerary',
                builder: (context, state) => const ItineraryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/map',
                builder: (context, state) => const MapScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/gems',
                builder: (context, state) => const GemsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/experiences',
                builder: (context, state) => const ExperiencesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/trips',
                builder: (context, state) => const TripsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

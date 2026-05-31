import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/data/saved_trips.dart';
import 'package:luxora_ai/screens/concierge/concierge_screen.dart';
import 'package:luxora_ai/screens/experiences/experiences_screen.dart';
import 'package:luxora_ai/screens/gems/gems_screen.dart';
import 'package:luxora_ai/screens/itinerary/itinerary_screen.dart';
import 'package:luxora_ai/screens/landing/landing_screen.dart';
import 'package:luxora_ai/screens/map/map_screen.dart';
import 'package:luxora_ai/screens/more/more_screen.dart';
import 'package:luxora_ai/screens/more/partner_offers_screen.dart';
import 'package:luxora_ai/screens/more/saved_favorites_screen.dart';
import 'package:luxora_ai/screens/onboarding/onboarding_screen.dart';
import 'package:luxora_ai/screens/paywall/luxora_paywall_screen.dart';
import 'package:luxora_ai/screens/restaurants/restaurants_screen.dart';
import 'package:luxora_ai/screens/story/why_luxora_screen.dart';
import 'package:luxora_ai/screens/hotels/hotel_matchmaker_screen.dart';
import 'package:luxora_ai/screens/hotels/hotels_screen.dart';
import 'package:luxora_ai/screens/ticket_savings/ticket_savings_screen.dart';
import 'package:luxora_ai/screens/trips/trip_story_screen.dart';
import 'package:luxora_ai/screens/trips/trips_screen.dart';
import 'package:luxora_ai/shell/main_shell.dart';
import 'package:luxora_ai/widgets/lux_background.dart';

final luxoraRootNavigatorKey = GlobalKey<NavigatorState>();

Widget _luxPage(Widget child) => LuxBackground(child: child);

GoRouter createAppRouter() {
  return GoRouter(
    navigatorKey: luxoraRootNavigatorKey,
    initialLocation: '/',
    redirect: (context, state) {
      if (state.uri.path == '/experiences') return '/discover';
      if (state.uri.path == '/itinerary') return '/agenda';
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LandingScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => _luxPage(
          OnboardingScreen(
            initialCityId: state.uri.queryParameters['city'],
          ),
        ),
      ),
      GoRoute(
        path: '/story',
        builder: (context, state) => _luxPage(const WhyLuxoraScreen()),
      ),
      GoRoute(
        parentNavigatorKey: luxoraRootNavigatorKey,
        path: '/paywall',
        pageBuilder: (context, state) {
          final cityId = state.uri.queryParameters['city'] ?? 'orlando';
          final addonId = state.uri.queryParameters['addon'];
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: LuxoraPaywallScreen(
              cityId: cityId,
              addonId: addonId,
              contextHeadline: state.uri.queryParameters['headline'],
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: '/trip-story',
        builder: (context, state) {
          final trip = state.extra;
          if (trip is! SavedTripSummary) {
            return _luxPage(const TripsScreen());
          }
          return _luxPage(TripStoryScreen(trip: trip));
        },
      ),
      // Secondary full-screen routes (outside bottom nav shell).
      GoRoute(
        parentNavigatorKey: luxoraRootNavigatorKey,
        path: '/gems',
        builder: (context, state) => _luxPage(const GemsScreen()),
      ),
      GoRoute(
        parentNavigatorKey: luxoraRootNavigatorKey,
        path: '/ticket-savings',
        builder: (context, state) => _luxPage(const TicketSavingsScreen()),
      ),
      GoRoute(
        parentNavigatorKey: luxoraRootNavigatorKey,
        path: '/stays',
        builder: (context, state) => _luxPage(const HotelsScreen()),
        routes: [
          GoRoute(
            parentNavigatorKey: luxoraRootNavigatorKey,
            path: 'matchmaker',
            builder: (context, state) =>
                _luxPage(const HotelMatchmakerScreen()),
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: luxoraRootNavigatorKey,
        path: '/trips',
        builder: (context, state) => _luxPage(const TripsScreen()),
      ),
      GoRoute(
        parentNavigatorKey: luxoraRootNavigatorKey,
        path: '/saved-favorites',
        builder: (context, state) => _luxPage(const SavedFavoritesScreen()),
      ),
      GoRoute(
        parentNavigatorKey: luxoraRootNavigatorKey,
        path: '/restaurants',
        builder: (context, state) => _luxPage(const RestaurantsScreen()),
      ),
      GoRoute(
        parentNavigatorKey: luxoraRootNavigatorKey,
        path: '/partner-offers',
        builder: (context, state) => _luxPage(const PartnerOffersScreen()),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/agenda',
                builder: (context, state) =>
                    const ItineraryScreen(primaryTab: true),
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
                path: '/concierge',
                builder: (context, state) => const ConciergeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/discover',
                builder: (context, state) => const ExperiencesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/more',
                builder: (context, state) => const MoreScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

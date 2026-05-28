import 'package:flutter/material.dart';

class MapAiCapability {
  const MapAiCapability({
    required this.title,
    required this.description,
    required this.icon,
    this.comingSoon = true,
  });

  final String title;
  final String description;
  final IconData icon;
  final bool comingSoon;
}

const mapAiCapabilities = [
  MapAiCapability(
    icon: Icons.favorite_outline_rounded,
    title: 'Mood-based routes',
    description:
        'Paths that match romantic, wellness, family, or adventure — not just shortest drive time.',
  ),
  MapAiCapability(
    icon: Icons.route_rounded,
    title: 'Drive-time optimization',
    description:
        'Smart sequencing so you spend time feeling, not sitting in traffic between highlights.',
  ),
  MapAiCapability(
    icon: Icons.cloud_outlined,
    title: 'Weather-aware suggestions',
    description:
        'Rain backup routes and live windows for beaches, rooftops, and springs.',
  ),
  MapAiCapability(
    icon: Icons.wb_twilight_rounded,
    title: 'Best sunset right now',
    description:
        'Where golden hour hits best in the next 90 minutes based on sky and crowd patterns.',
  ),
  MapAiCapability(
    icon: Icons.groups_outlined,
    title: 'Crowd prediction',
    description:
        'When parks, springs, and viral spots quiet down — before you arrive.',
  ),
  MapAiCapability(
    icon: Icons.diamond_outlined,
    title: 'Nearby hidden gems',
    description:
        'Insider pins surfaced along your route — not just top-10 tourist stops.',
  ),
  MapAiCapability(
    icon: Icons.tune_rounded,
    title: 'Route personalization',
    description:
        'Your trip feel, pace, and budget reshape the map in real time.',
  ),
];

/// Flagship map layer — AI navigation beyond discovery (roadmap).
const mapAiCapabilitiesFuture = [
  MapAiCapability(
    icon: Icons.local_fire_department_outlined,
    title: 'Live crowd heat',
    description:
        'Real-time density on springs, parks, and viral rooftops — worth it right now?',
  ),
  MapAiCapability(
    icon: Icons.local_parking_outlined,
    title: 'Parking difficulty',
    description:
        'Friction score before you commit — valet, garage, or rideshare sweet spot.',
  ),
  MapAiCapability(
    icon: Icons.traffic_outlined,
    title: 'Drive friction score',
    description:
        'Stress-weighted routing — not just minutes, but how the drive will feel.',
  ),
  MapAiCapability(
    icon: Icons.swap_calls_rounded,
    title: 'Spontaneous reroute',
    description:
        'Weather shift or crowd spike? One tap to reshape the rest of your day.',
  ),
];

/// Monetization surfaces — embedded in recommendations later.
const affiliateCategories = [
  'Hotels & staycations',
  'Experiences & tours',
  'Restaurant reservations',
  'Theme park tickets',
  'ResortPass / day passes',
  'Car rentals',
  'Wellness bookings',
];

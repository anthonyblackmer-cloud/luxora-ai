import 'package:flutter/material.dart';

enum FeedItemKind {
  trending,
  newOpening,
  creatorPick,
  seasonal,
  viralSpot,
  liveUpdate,
}

class FeedItem {
  const FeedItem({
    required this.id,
    required this.kind,
    required this.title,
    required this.subtitle,
    required this.location,
    required this.headline,
    required this.socialProof,
    required this.gradient,
    this.isLive = false,
  });

  final String id;
  final FeedItemKind kind;
  final String title;
  final String subtitle;
  final String location;
  final String headline;
  final String socialProof;
  final List<Color> gradient;
  final bool isLive;

  String get kindLabel => switch (kind) {
        FeedItemKind.trending => 'Trending now',
        FeedItemKind.newOpening => 'New opening',
        FeedItemKind.creatorPick => 'Creator pick',
        FeedItemKind.seasonal => 'Seasonal',
        FeedItemKind.viralSpot => 'Viral aesthetic',
        FeedItemKind.liveUpdate => 'Live update',
      };
}

const discoveryFeed = [
  FeedItem(
    id: 'feed-rooftop-viral',
    kind: FeedItemKind.viralSpot,
    title: 'Skyline omakase rooftop',
    subtitle: 'Winter Park · reel-famous sunset deck',
    location: 'Orlando metro',
    headline:
        'The table everyone’s filming — golden hour reservations gone in minutes this season.',
    socialProof: '12.4K saves this week · #OrlandoSunset',
    gradient: [Color(0xFFFB7185), Color(0xFFF97316), Color(0xFF4C1D95)],
    isLive: true,
  ),
  FeedItem(
    id: 'feed-disney-after-dark',
    kind: FeedItemKind.trending,
    title: 'After-hours park magic',
    subtitle: 'Lake Buena Vista',
    location: 'Orlando',
    headline:
        'Night events are trending — fewer crowds, more sparkle, adult pacing with kid joy.',
    socialProof: 'Trending · families + couples',
    gradient: [Color(0xFFD946EF), Color(0xFF7C3AED), Color(0xFF020617)],
  ),
  FeedItem(
    id: 'feed-new-wellness',
    kind: FeedItemKind.newOpening,
    title: 'Citrus ritual spa — just opened',
    subtitle: 'Wellness district · 3 weeks old',
    location: 'Winter Park, FL',
    headline:
        'New hydrotherapy circuit + outdoor soaking — soft launch pricing through June.',
    socialProof: 'Grand opening · limited slots',
    gradient: [Color(0xFFA78BFA), Color(0xFF6366F1), Color(0xFF1E293B)],
  ),
  FeedItem(
    id: 'feed-creator-keys',
    kind: FeedItemKind.creatorPick,
    title: 'Keys island-hop day sail',
    subtitle: '@floridaluxlife pick',
    location: 'Key West trail',
    headline:
        'Creator-favorite catamaran route — turquoise stops, wind in your hair, chapter-by-chapter islands.',
    socialProof: 'Creator pick · 48K views',
    gradient: [Color(0xFF38BDF8), Color(0xFF14B8A6), Color(0xFF0F172A)],
  ),
  FeedItem(
    id: 'feed-summer-springs',
    kind: FeedItemKind.seasonal,
    title: 'Summer spring cooldown circuit',
    subtitle: 'Beat the heat · 3-stop route',
    location: 'Central Florida',
    headline:
        'Seasonal route: morning spring, shaded lunch, rooftop sundowner — built for July humidity.',
    socialProof: 'Seasonal · updated weekly',
    gradient: [Color(0xFF22D3EE), Color(0xFF059669), Color(0xFF134E4A)],
  ),
  FeedItem(
    id: 'feed-live-storm',
    kind: FeedItemKind.liveUpdate,
    title: 'Evening storm clearing — beach window',
    subtitle: 'Gulf coast · next 2 hours',
    location: 'Clearwater area',
    headline:
        'Live: clouds breaking west — best beach light expected 6:15–7:00 PM. Indoor backup attached.',
    socialProof: 'Live weather window',
    gradient: [Color(0xFF64748B), Color(0xFF0EA5E9), Color(0xFF1E3A5F)],
    isLive: true,
  ),
];

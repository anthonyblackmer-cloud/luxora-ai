import 'package:flutter/material.dart';
import 'package:luxora_ai/data/feed_items.dart';

const floridaKeysDiscoveryFeed = [
  FeedItem(
    id: 'keys-feed-pennekamp-snorkel',
    kind: FeedItemKind.trending,
    title: 'Pennekamp reef snorkel morning',
    subtitle: 'Key Largo · first boat out',
    location: 'Key Largo, FL',
    headline:
        'Glass-bottom calm before noon — Christ of the Deep visibility peaks on light-wind weekdays.',
    socialProof: '8.4K saves · #KeysReef',
    gradient: [Color(0xFF0EA5E9), Color(0xFF14B8A6), Color(0xFF0F172A)],
    isLive: true,
  ),
  FeedItem(
    id: 'keys-feed-robbies-tarpon',
    kind: FeedItemKind.creatorPick,
    title: 'Robbie\'s tarpon ritual',
    subtitle: '@keysislandlife pick',
    location: 'Islamorada, FL',
    headline:
        'Buy bait bucket, feed giants from the dock, fish sandwich after — the Islamorada loop locals repeat.',
    socialProof: 'Creator pick · 41K views',
    gradient: [Color(0xFF38BDF8), Color(0xFF0D9488), Color(0xFF134E4A)],
  ),
  FeedItem(
    id: 'keys-feed-seven-mile-sunrise',
    kind: FeedItemKind.viralSpot,
    title: 'Seven Mile Bridge sunrise pull-off',
    subtitle: 'Marathon · Overseas Highway',
    location: 'Marathon, FL',
    headline:
        'Park at the legacy bridge ramp — horizon glow without the Key West crowd.',
    socialProof: '12.1K saves · #OverseasHighway',
    gradient: [Color(0xFFF97316), Color(0xFFFB7185), Color(0xFF4C1D95)],
    isLive: true,
  ),
  FeedItem(
    id: 'keys-feed-bahia-honda-swim',
    kind: FeedItemKind.seasonal,
    title: 'Bahia Honda shallow swim',
    subtitle: 'Big Pine Key · best beach',
    location: 'Big Pine Key, FL',
    headline:
        'Arrive before 10 AM for parking — turquoise shallows and bridge backdrop all morning.',
    socialProof: 'Seasonal · calm wind days',
    gradient: [Color(0xFF0EA5E9), Color(0xFF6366F1), Color(0xFF1E1B4B)],
  ),
  FeedItem(
    id: 'keys-feed-mallory-sunset',
    kind: FeedItemKind.trending,
    title: 'Mallory Square sunset crawl',
    subtitle: 'Key West · golden hour',
    location: 'Key West, FL',
    headline:
        'Street performers, waterfront margaritas, and the most photographed sunset in Florida.',
    socialProof: 'Trending · nightly',
    gradient: [Color(0xFFFB7185), Color(0xFFF97316), Color(0xFF292524)],
    isLive: true,
  ),
  FeedItem(
    id: 'keys-feed-hogfish-dock',
    kind: FeedItemKind.creatorPick,
    title: 'Hogfish dock lunch',
    subtitle: 'Stock Island · working waterfront',
    location: 'Key West, FL',
    headline:
        'Yellowtail and hogfish platters on a plastic chair — zero polish, maximum flavor.',
    socialProof: 'Local favorite · lunch only',
    gradient: [Color(0xFF78716C), Color(0xFF57534E), Color(0xFF1C1917)],
  ),
  FeedItem(
    id: 'keys-feed-dry-tortugas-day',
    kind: FeedItemKind.newOpening,
    title: 'Dry Tortugas day trip',
    subtitle: 'Fort Jefferson · bucket list',
    location: '70 mi west of Key West',
    headline:
        'Yankee Freedom early ferry — snorkel the moat wall, explore the fort, return by sunset.',
    socialProof: 'Book ahead · limited seats',
    gradient: [Color(0xFF38BDF8), Color(0xFF14B8A6), Color(0xFF0F172A)],
  ),
  FeedItem(
    id: 'keys-feed-fort-zachary-local',
    kind: FeedItemKind.trending,
    title: 'Fort Zachary locals\' beach',
    subtitle: 'Key West · skip South Beach crowds',
    location: 'Key West, FL',
    headline:
        'Clear snorkel off the rock edge — bring chairs, stay through sunset glow.',
    socialProof: '9.2K saves · #KeyWestLocal',
    gradient: [Color(0xFF0EA5E9), Color(0xFF14B8A6), Color(0xFF134E4A)],
  ),
  FeedItem(
    id: 'keys-feed-sandbar-boat',
    kind: FeedItemKind.seasonal,
    title: 'Middle Keys sandbar charter',
    subtitle: 'Marathon · calm wind window',
    location: 'Marathon, FL',
    headline:
        'Anchor on a waist-deep bar — cooler, snorkel masks, and nowhere to be until sunset.',
    socialProof: 'Seasonal · weekend slots',
    gradient: [Color(0xFF64748B), Color(0xFF0F766E), Color(0xFF1E293B)],
  ),
  FeedItem(
    id: 'keys-feed-latitudes-romantic',
    kind: FeedItemKind.creatorPick,
    title: 'Latitudes torch-lit dinner',
    subtitle: 'Sunset Key · private ferry',
    location: 'Key West, FL',
    headline:
        'The Keys\' most romantic reservation — sand-floor dining with Gulf breeze.',
    socialProof: 'Luxury pick · couples',
    gradient: [Color(0xFFA78BFA), Color(0xFF6366F1), Color(0xFF1E293B)],
  ),
];

const kFloridaKeysFeedItemPlaceIds = <String, String>{
  'keys-feed-pennekamp-snorkel': 'place-keys-pennekamp',
  'keys-feed-robbies-tarpon': 'place-keys-robbies-marina',
  'keys-feed-seven-mile-sunrise': 'place-keys-seven-mile-bridge',
  'keys-feed-bahia-honda-swim': 'place-keys-bahia-honda',
  'keys-feed-mallory-sunset': 'place-keys-mallory-square',
  'keys-feed-hogfish-dock': 'place-keys-hogfish-bar',
  'keys-feed-dry-tortugas-day': 'place-keys-dry-tortugas',
  'keys-feed-fort-zachary-local': 'place-keys-fort-zachary',
  'keys-feed-sandbar-boat': 'keys-exp-keys-marathon-0',
  'keys-feed-latitudes-romantic': 'place-keys-latitudes',
};

const kFloridaKeysItineraryMomentPlaceIds = <String, String>{
  'keys-moment-sunrise-bridge': 'place-keys-seven-mile-bridge',
  'keys-moment-reef-snorkel': 'place-keys-molasses-reef',
  'keys-moment-sunset-celebration': 'place-keys-mallory-square',
  'keys-moment-dock-lunch': 'place-keys-hogfish-bar',
  'keys-moment-beach-calm': 'place-keys-bahia-honda',
};

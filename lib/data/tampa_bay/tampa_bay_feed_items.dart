import 'package:flutter/material.dart';
import 'package:luxora_ai/data/feed_items.dart';

const tampaBayDiscoveryFeed = [
  FeedItem(
    id: 'tampa-bay-feed-clearwater-sunrise',
    kind: FeedItemKind.trending,
    title: 'Clearwater Beach before noon',
    subtitle: 'Gulf window · soft sand + calm water',
    location: 'Clearwater Beach, FL',
    headline:
        'Beach conditions peak before noon — swim Clearwater, then pivot indoor at the aquarium if clouds build.',
    socialProof: '8.4K saves · #ClearwaterMorning',
    gradient: [Color(0xFF0EA5E9), Color(0xFF6366F1), Color(0xFF1E1B4B)],
    isLive: true,
  ),
  FeedItem(
    id: 'tampa-bay-feed-riverwalk-sunset',
    kind: FeedItemKind.creatorPick,
    title: 'Riverwalk golden hour walk',
    subtitle: 'Downtown Tampa · waterfront benches',
    location: 'Tampa Riverwalk',
    headline:
        'Start at Sparkman Wharf, walk north to Armature Works — sunset light on the Hillsborough is underrated.',
    socialProof: 'Creator pick · 41K views',
    gradient: [Color(0xFFF97316), Color(0xFFEC4899), Color(0xFF4C1D95)],
  ),
  FeedItem(
    id: 'tampa-bay-feed-st-pete-art-food',
    kind: FeedItemKind.viralSpot,
    title: 'St. Pete art + food loop',
    subtitle: 'Dalí → Beach Drive → Pier',
    location: 'St. Petersburg, FL',
    headline:
        'Museum morning, Beach Drive lunch, pier sunset — the locals\' weekend without crossing the bridge twice.',
    socialProof: '10.1K saves · #StPeteWeekend',
    gradient: [Color(0xFFFB7185), Color(0xFFF97316), Color(0xFF4C1D95)],
    isLive: true,
  ),
  FeedItem(
    id: 'tampa-bay-feed-ybor-night',
    kind: FeedItemKind.seasonal,
    title: 'Ybor after dark',
    subtitle: 'Historic district · live music crawl',
    location: 'Ybor City, Tampa',
    headline:
        'Cuban dinner first, then 7th Avenue — arrive before 9 PM for easier parking and cooler brick-street walks.',
    socialProof: 'Seasonal · Thu–Sat nights',
    gradient: [Color(0xFFF59E0B), Color(0xFFEA580C), Color(0xFF292524)],
  ),
  FeedItem(
    id: 'tampa-bay-feed-dunedin-brewery',
    kind: FeedItemKind.trending,
    title: 'Dunedin brewery afternoon',
    subtitle: 'Waterfront pint crawl',
    location: 'Dunedin, FL',
    headline:
        'Small-town harbor energy — bike the Pinellas Trail between pours when UV is high.',
    socialProof: 'Trending · friend groups',
    gradient: [Color(0xFF38BDF8), Color(0xFF14B8A6), Color(0xFF0F172A)],
  ),
  FeedItem(
    id: 'tampa-bay-feed-tarpon-greek',
    kind: FeedItemKind.creatorPick,
    title: 'Tarpon Springs Greek lunch',
    subtitle: 'Sponge docks · waterfront tables',
    location: 'Tarpon Springs, FL',
    headline:
        'Order grilled octopus at the dock — walk the sponge boats after, not before (fewer tour clusters).',
    socialProof: 'Creator pick · 28K views',
    gradient: [Color(0xFF14B8A6), Color(0xFF365314), Color(0xFF134E4A)],
  ),
  FeedItem(
    id: 'tampa-bay-feed-sunset-cruise',
    kind: FeedItemKind.liveUpdate,
    title: 'Sunset cruise window open',
    subtitle: 'Tampa Bay · light winds tonight',
    location: 'Channelside, Tampa',
    headline:
        'Live: boating suitability excellent 5:30–7:30 PM — book a bay cruise before pier crowds peak.',
    socialProof: 'Live weather window',
    gradient: [Color(0xFF64748B), Color(0xFF0EA5E9), Color(0xFF1E3A5F)],
    isLive: true,
  ),
  FeedItem(
    id: 'tampa-bay-feed-hidden-sand-key',
    kind: FeedItemKind.viralSpot,
    title: 'Sand Key quiet cove',
    subtitle: 'Local beach escape',
    location: 'Clearwater, FL',
    headline:
        'Skip Pier 60 chaos — locals cross to Sand Key for calmer Gulf swims and easier parking.',
    socialProof: '6.8K saves · #HiddenGulf',
    gradient: [Color(0xFF22D3EE), Color(0xFF059669), Color(0xFF134E4A)],
  ),
  FeedItem(
    id: 'tampa-bay-feed-busch-family',
    kind: FeedItemKind.seasonal,
    title: 'Busch Gardens full day',
    subtitle: 'Family adventure · arrive early',
    location: 'Tampa, FL',
    headline:
        'Rope-drop the Serengeti Express side — afternoon storms often push crowds indoors after 2 PM.',
    socialProof: 'Seasonal · family route',
    gradient: [Color(0xFFA855F7), Color(0xFF6366F1), Color(0xFF1E293B)],
  ),
  FeedItem(
    id: 'tampa-bay-feed-safety-harbor-spa',
    kind: FeedItemKind.newOpening,
    title: 'Safety Harbor spa afternoon',
    subtitle: 'Mineral springs · rain backup',
    location: 'Safety Harbor, FL',
    headline:
        'Rain reroute favorite — spa soak and main-street dinner when Gulf beaches are blown out.',
    socialProof: 'Rain-day pivot · locals',
    gradient: [Color(0xFF78716C), Color(0xFF57534E), Color(0xFF292524)],
  ),
];

const kTampaBayFeedItemPlaceIds = <String, String>{
  'tampa-bay-feed-clearwater-sunrise': 'place-clearwater-beach',
  'tampa-bay-feed-riverwalk-sunset': 'place-tampa-riverwalk',
  'tampa-bay-feed-st-pete-art-food': 'place-dali-museum',
  'tampa-bay-feed-ybor-night': 'place-ybor-city',
  'tampa-bay-feed-dunedin-brewery': 'place-downtown-dunedin',
  'tampa-bay-feed-tarpon-greek': 'place-tarpon-sponge-docks',
  'tampa-bay-feed-sunset-cruise': 'place-sparkman-wharf',
  'tampa-bay-feed-hidden-sand-key': 'place-sand-key-park',
  'tampa-bay-feed-busch-family': 'place-busch-gardens-tampa-bay',
  'tampa-bay-feed-safety-harbor-spa': 'place-sunken-gardens',
};

const kTampaBayItineraryMomentPlaceIds = <String, String>{
  'moment-1': 'place-clearwater-beach',
  'moment-2': 'place-st-pete-pier',
  'moment-3': 'place-tampa-riverwalk',
};

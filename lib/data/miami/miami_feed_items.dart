import 'package:flutter/material.dart';
import 'package:luxora_ai/data/feed_items.dart';

/// Hand-crafted Miami discovery feed — parity with Orlando's [discoveryFeed].
const miamiDiscoveryFeed = [
  FeedItem(
    id: 'miami-feed-ocean-drive-sunrise',
    kind: FeedItemKind.trending,
    title: 'Ocean Drive sunrise swim',
    subtitle: 'South Beach · art deco waking up',
    location: 'Miami Beach',
    headline:
        'Hit the sand before 8 AM — empty pastel facades, soft light, and the Atlantic all yours.',
    socialProof: '9.8K saves this week · #MiamiSunrise',
    gradient: [Color(0xFF0EA5E9), Color(0xFF6366F1), Color(0xFF1E1B4B)],
    isLive: true,
  ),
  FeedItem(
    id: 'miami-feed-wynwood-mural-crawl',
    kind: FeedItemKind.creatorPick,
    title: 'Wynwood mural crawl',
    subtitle: '@miamiluxlife pick',
    location: 'Wynwood, Miami',
    headline:
        'Creator loop: Panther Coffee → Wynwood Walls → Design District lunch — the aesthetic day locals post.',
    socialProof: 'Creator pick · 62K views',
    gradient: [Color(0xFFEC4899), Color(0xFF8B5CF6), Color(0xFF1C1917)],
  ),
  FeedItem(
    id: 'miami-feed-brickell-rooftop',
    kind: FeedItemKind.viralSpot,
    title: 'Komodo — Brickell skyline dinner',
    subtitle: 'Financial district · three-story dining',
    location: 'Brickell, Miami',
    headline:
        'Southeast Asian plates with a see-and-be-seen lounge — reserve early for Friday sunset tables.',
    socialProof: '11.2K saves · #BrickellSunset',
    gradient: [Color(0xFFFB7185), Color(0xFFF97316), Color(0xFF4C1D95)],
    isLive: true,
  ),
  FeedItem(
    id: 'miami-feed-little-havana-cafecito',
    kind: FeedItemKind.seasonal,
    title: 'Little Havana cafecito run',
    subtitle: 'Calle Ocho · morning ritual',
    location: 'Little Havana, Miami',
    headline:
        'Seasonal route: Versailles croquetas → domino park watch → cigar shop stop — culture before noon.',
    socialProof: 'Seasonal · weekend mornings',
    gradient: [Color(0xFFF59E0B), Color(0xFFEA580C), Color(0xFF292524)],
  ),
  FeedItem(
    id: 'miami-feed-south-beach-social',
    kind: FeedItemKind.trending,
    title: 'South Beach social day',
    subtitle: 'Lummus Park → Española Way',
    location: 'Miami Beach',
    headline:
        'Beach morning, pool afternoon, al fresco dinner — the Miami pacing everyone wants but rarely sequences.',
    socialProof: 'Trending · couples + friend groups',
    gradient: [Color(0xFF38BDF8), Color(0xFF14B8A6), Color(0xFF0F172A)],
  ),
  FeedItem(
    id: 'miami-feed-design-district-opening',
    kind: FeedItemKind.trending,
    title: 'Mandolin Aegean Bistro courtyard',
    subtitle: 'Design District · bougainvillea patio',
    location: 'Design District, Miami',
    headline:
        'Greek mezze under string lights — the courtyard table locals book for unhurried lunches.',
    socialProof: 'Local favorite · lunch + dinner',
    gradient: [Color(0xFFA78BFA), Color(0xFF6366F1), Color(0xFF1E293B)],
  ),
  FeedItem(
    id: 'miami-feed-key-biscayne-bike',
    kind: FeedItemKind.creatorPick,
    title: 'Key Biscayne bike & beach loop',
    subtitle: '@floridaluxlife pick',
    location: 'Key Biscayne, FL',
    headline:
        'Crandon Park sand → Rickenbacker skyline views — turquoise without South Beach crowds.',
    socialProof: 'Creator pick · 31K views',
    gradient: [Color(0xFF22D3EE), Color(0xFF059669), Color(0xFF134E4A)],
  ),
  FeedItem(
    id: 'miami-feed-live-storm-clearing',
    kind: FeedItemKind.liveUpdate,
    title: 'Afternoon storm clearing — beach window',
    subtitle: 'South Beach · next 90 min',
    location: 'Miami Beach',
    headline:
        'Live: clouds breaking east — best beach light expected 5:45–6:30 PM. Indoor PAMM backup attached.',
    socialProof: 'Live weather window',
    gradient: [Color(0xFF64748B), Color(0xFF0EA5E9), Color(0xFF1E3A5F)],
    isLive: true,
  ),
  FeedItem(
    id: 'miami-feed-vizcaya-golden',
    kind: FeedItemKind.viralSpot,
    title: 'Vizcaya golden hour portraits',
    subtitle: 'Coconut Grove · bayfront gardens',
    location: 'Miami',
    headline:
        'The gilded terrace everyone\'s posting — arrive 45 minutes before sunset for the quiet garden arc.',
    socialProof: '7.4K saves · #VizcayaVibes',
    gradient: [Color(0xFFF97316), Color(0xFFEC4899), Color(0xFF4C1D95)],
  ),
  FeedItem(
    id: 'miami-feed-everglades-daytrip',
    kind: FeedItemKind.seasonal,
    title: 'Everglades airboat day trip',
    subtitle: 'Wild Florida · half-day escape',
    location: 'Everglades, FL',
    headline:
        'Pair a beach-heavy stay with one wild chapter — morning airboat, afternoon pool reset.',
    socialProof: 'Seasonal · dry season best',
    gradient: [Color(0xFF14B8A6), Color(0xFF365314), Color(0xFF134E4A)],
  ),
  FeedItem(
    id: 'miami-feed-espanolola-date',
    kind: FeedItemKind.trending,
    title: 'Española Way date night',
    subtitle: 'Pedestrian village · no car needed',
    location: 'South Beach, Miami Beach',
    headline:
        'String lights, shared plates, and a slow walk home — the romantic move when club nights feel too loud.',
    socialProof: 'Trending · couples + foodies',
    gradient: [Color(0xFFA855F7), Color(0xFFF472B6), Color(0xFF1E1B4B)],
  ),
  FeedItem(
    id: 'miami-feed-liv-after-dark',
    kind: FeedItemKind.trending,
    title: 'Fontainebleau after-dark',
    subtitle: 'LIV + late pool energy',
    location: 'Mid-Beach, Miami Beach',
    headline:
        'Dress-up night out with a poolside decompression built in — Miami nightlife without the guesswork.',
    socialProof: 'Trending · nightlife seekers',
    gradient: [Color(0xFFD946EF), Color(0xFF7C3AED), Color(0xFF020617)],
  ),
];

const kMiamiFeedItemPlaceIds = <String, String>{
  'miami-feed-ocean-drive-sunrise': 'place-miami-ocean-drive',
  'miami-feed-wynwood-mural-crawl': 'place-miami-wynwood-walls',
  'miami-feed-brickell-rooftop': 'dining-miami-komodo',
  'miami-feed-little-havana-cafecito': 'place-miami-little-havana',
  'miami-feed-south-beach-social': 'place-miami-lummus-park',
  'miami-feed-design-district-opening': 'dining-miami-mandolin',
  'miami-feed-key-biscayne-bike': 'place-miami-key-biscayne',
  'miami-feed-live-storm-clearing': 'place-miami-south-pointe',
  'miami-feed-vizcaya-golden': 'place-miami-vizcaya',
  'miami-feed-everglades-daytrip': 'place-miami-everglades',
  'miami-feed-espanolola-date': 'place-miami-espanolola-way',
  'miami-feed-liv-after-dark': 'place-miami-liv-nightclub',
};

const kMiamiItineraryMomentPlaceIds = <String, String>{
  'moment-1': 'place-miami-lummus-park',
  'moment-2': 'place-miami-wynwood-walls',
  'moment-3': 'dining-miami-komodo',
};

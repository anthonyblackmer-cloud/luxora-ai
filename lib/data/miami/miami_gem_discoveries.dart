import 'package:flutter/material.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';

/// Curated Miami hidden gems — parity with Orlando's [hiddenGemsCatalog].
const miamiHiddenGemsCatalog = [
  HiddenGem(
    id: 'miami-gem-panther-alley',
    title: 'Panther Coffee back-alley mural',
    location: 'Wynwood, Miami · NW 2nd Ave',
    whySpecial:
        'Skip the main line and duck through the loading alley — a full-wall mural locals use as their private photo studio.',
    bestTime: '8:00–9:30 AM before the mural crawl',
    crowdLevel: 'Low before 10 AM',
    insiderTip:
        'Order at the window, walk the alley clockwise — best light hits the turquoise wall at 8:45 AM.',
    localOnlyNote: 'Tour buses never stop here — it\'s a barista secret.',
    gradient: [Color(0xFF78716C), Color(0xFF57534E), Color(0xFF292524)],
  ),
  HiddenGem(
    id: 'miami-gem-mandolin-courtyard',
    title: 'Mandolin hidden courtyard table',
    location: 'Design District, Miami · behind the bougainvillea',
    whySpecial:
        'The bougainvillea courtyard is the draw — mezze boards and unhurried lunches away from the Design District rush.',
    bestTime: 'Late lunch Tue–Thu',
    crowdLevel: 'Intimate · walk-ins rare Fri–Sat',
    insiderTip:
        'Ask for the corner under the olive tree — staff saves it for repeat locals when possible.',
    localOnlyNote: 'Hotel concierges rarely book the courtyard specifically.',
    gradient: [Color(0xFFA8A29E), Color(0xFF78716C), Color(0xFF292524)],
  ),
  HiddenGem(
    id: 'miami-gem-key-biscayne-north',
    title: 'Key Biscayne north beach cove',
    location: 'Key Biscayne, FL · north parking lot',
    whySpecial:
        'Calmer water than South Beach with half the crowd — locals bring chairs and stay until sunset.',
    bestTime: 'Weekday afternoons',
    crowdLevel: 'Moderate weekends · low weekdays',
    insiderTip:
        'Park at the north lot, walk 200 yards past the main flags — shade trees and fewer volleyball nets.',
    localOnlyNote: 'South Beach visitors rarely cross the Rickenbacker for this.',
    gradient: [Color(0xFF0EA5E9), Color(0xFF0D9488), Color(0xFF134E4A)],
  ),
  HiddenGem(
    id: 'miami-gem-vizcaya-mangrove',
    title: 'Vizcaya mangrove shoreline path',
    location: 'Coconut Grove, Miami · east garden gate',
    whySpecial:
        'Most visitors never leave the villa — the mangrove boardwalk feels like a private bay retreat.',
    bestTime: '90 min before sunset',
    crowdLevel: 'Very low · self-guided',
    insiderTip:
        'Enter from the east garden, walk counter-clockwise — herons lift off in near silence at golden hour.',
    localOnlyNote: 'Instagram crowds cluster at the main terrace only.',
    gradient: [Color(0xFF6B7280), Color(0xFF4B5563), Color(0xFF1F2937)],
  ),
  HiddenGem(
    id: 'miami-gem-little-havana-domino',
    title: 'Domino Park sideline seats',
    location: 'Little Havana, Miami · Calle Ocho',
    whySpecial:
        'The tournament tables get filmed — the sideline benches are where abuelos actually teach the game.',
    bestTime: 'Weekday mornings after 9 AM',
    crowdLevel: 'Low weekdays · lively weekends',
    insiderTip:
        'Buy cafecito from the window cart first — regulars open up when you\'re holding a cortadito.',
    localOnlyNote: 'Not on typical food-tour routes.',
    gradient: [Color(0xFF57534E), Color(0xFF44403C), Color(0xFF1C1917)],
  ),
  HiddenGem(
    id: 'miami-gem-south-pointe-pier',
    title: 'South Pointe pier sunrise bench',
    location: 'South Pointe, Miami Beach · pier end',
    whySpecial:
        'Cruise ships slip past at dawn — wide horizon without Ocean Drive noise.',
    bestTime: '6:30–7:15 AM',
    crowdLevel: 'Very low · joggers only',
    insiderTip:
        'Sit at the pier end facing east — bring a light layer; bay breeze picks up before the sun clears.',
    localOnlyNote: 'Nightlife crowd sleeps through this entirely.',
    gradient: [Color(0xFF64748B), Color(0xFF0F766E), Color(0xFF0F172A)],
  ),
  HiddenGem(
    id: 'miami-gem-coconut-grove-sail',
    title: 'Coconut Grove morning sail charter',
    location: 'Coconut Grove, Miami · Dinner Key',
    whySpecial:
        'Small catamarans leave before the bay gets busy — Biscayne calm with skyline blush.',
    bestTime: '8:00 AM weekday slots',
    crowdLevel: 'Low · 6-person max',
    insiderTip:
        'Book the first slot — wind is lighter and the captain routes toward the quiet mangrove edge.',
    localOnlyNote: 'Bayside tourist boats never match this pace.',
    gradient: [Color(0xFF38BDF8), Color(0xFF14B8A6), Color(0xFF0F172A)],
  ),
  HiddenGem(
    id: 'miami-gem-brickell-baywalk',
    title: 'Brickell Baywalk dead-end bench',
    location: 'Brickell, Miami · south baywalk terminus',
    whySpecial:
        'The walk ends at a quiet bench facing Key Biscayne — skyline behind you, water ahead, zero club noise.',
    bestTime: 'Sunset Thu–Sun',
    crowdLevel: 'Low · locals only',
    insiderTip:
        'Start at Icon Brickell, walk south to the terminus — pre-book dinner 15 min away in Brickell.',
    localOnlyNote: 'Rarely on hotel concierge lists.',
    gradient: [Color(0xFF78716C), Color(0xFF57534E), Color(0xFF292524)],
  ),
];

const kMiamiGemPlaceIds = <String, String>{
  'miami-gem-panther-alley': 'place-miami-panther-coffee',
  'miami-gem-mandolin-courtyard': 'dining-miami-mandolin',
  'miami-gem-key-biscayne-north': 'place-miami-key-biscayne',
  'miami-gem-vizcaya-mangrove': 'place-miami-vizcaya',
  'miami-gem-little-havana-domino': 'place-miami-little-havana',
  'miami-gem-south-pointe-pier': 'place-miami-south-pointe',
  'miami-gem-coconut-grove-sail': 'place-miami-bayside-harbor',
  'miami-gem-brickell-baywalk': 'dining-miami-komodo',
};

import 'package:flutter/material.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';

const nycHiddenGemsCatalog = [
  HiddenGem(
    id: 'nyc-gem-curated-0',
    title: 'Statue of Liberty & Ellis Island insider angle',
    location: 'Financial District · local',
    whySpecial: 'Harbor icon and immigration history — ferry timing is everything.',
    bestTime: 'Golden hour · weekdays',
    crowdLevel: 'Low if timed right',
    insiderTip: 'Arrive 30 min before peak — New York City locals tip.',
    localOnlyNote: 'Not on typical visitor maps.',
    gradient: [Color(0xFF0EA5E9), Color(0xFF0D9488), Color(0xFF134E4A)],
  ),
  HiddenGem(
    id: 'nyc-gem-curated-1',
    title: 'Empire State Building insider angle',
    location: 'Midtown · local',
    whySpecial: 'Art Deco skyline views — concierge deck timing beats midday queues.',
    bestTime: 'Golden hour · weekdays',
    crowdLevel: 'Low if timed right',
    insiderTip: 'Arrive 30 min before peak — New York City locals tip.',
    localOnlyNote: 'Not on typical visitor maps.',
    gradient: [Color(0xFF0EA5E9), Color(0xFF0D9488), Color(0xFF134E4A)],
  ),
  HiddenGem(
    id: 'nyc-gem-curated-2',
    title: 'Central Park insider angle',
    location: 'Upper West Side · local',
    whySpecial: '843 acres of urban escape — enter smart, not at Columbus Circle.',
    bestTime: 'Golden hour · weekdays',
    crowdLevel: 'Low if timed right',
    insiderTip: 'Arrive 30 min before peak — New York City locals tip.',
    localOnlyNote: 'Not on typical visitor maps.',
    gradient: [Color(0xFF0EA5E9), Color(0xFF0D9488), Color(0xFF134E4A)],
  ),
  HiddenGem(
    id: 'nyc-gem-curated-3',
    title: 'The Metropolitan Museum of Art insider angle',
    location: 'Upper East Side · local',
    whySpecial: 'World-class collections — rainy-day anchor with pay-what-you-wish windows.',
    bestTime: 'Golden hour · weekdays',
    crowdLevel: 'Low if timed right',
    insiderTip: 'Arrive 30 min before peak — New York City locals tip.',
    localOnlyNote: 'Not on typical visitor maps.',
    gradient: [Color(0xFF0EA5E9), Color(0xFF0D9488), Color(0xFF134E4A)],
  ),
  HiddenGem(
    id: 'nyc-gem-curated-4',
    title: 'Times Square insider angle',
    location: 'Times Square · local',
    whySpecial: 'Neon heart of Manhattan — strategy beats wandering into tourist traps.',
    bestTime: 'Golden hour · weekdays',
    crowdLevel: 'Low if timed right',
    insiderTip: 'Arrive 30 min before peak — New York City locals tip.',
    localOnlyNote: 'Not on typical visitor maps.',
    gradient: [Color(0xFF0EA5E9), Color(0xFF0D9488), Color(0xFF134E4A)],
  ),
];

const kNycGemPlaceIds = <String, String>{
  'nyc-gem-curated-0': 'place-statue-of-liberty',
  'nyc-gem-curated-1': 'place-empire-state',
  'nyc-gem-curated-2': 'place-central-park',
  'nyc-gem-curated-3': 'place-met-museum',
  'nyc-gem-curated-4': 'place-times-square',
};

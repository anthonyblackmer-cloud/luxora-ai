import 'package:flutter/material.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';

const tampaBayHiddenGemsCatalog = [
  HiddenGem(
    id: 'tampa-bay-gem-sand-key-sunrise',
    title: 'Sand Key sunrise bench',
    location: 'Clearwater, FL · north cove',
    whySpecial:
        'Gulf light without Pier 60 buskers — locals bring coffee and stay until the charter boats leave.',
    bestTime: '6:45–7:30 AM weekdays',
    crowdLevel: 'Very low · joggers only',
    insiderTip:
        'Park north lot, walk past the main flags — herons fish in the shallows at first light.',
    localOnlyNote: 'Clearwater day-trippers rarely cross the bridge this early.',
    gradient: [Color(0xFF0EA5E9), Color(0xFF0D9488), Color(0xFF134E4A)],
  ),
  HiddenGem(
    id: 'tampa-bay-gem-riverwalk-bench',
    title: 'Riverwalk secret bench row',
    location: 'Tampa Riverwalk · south of Armature Works',
    whySpecial:
        'Benches face west over the Hillsborough — sunset color without Sparkman Wharf lawn crowds.',
    bestTime: '45 min before sunset',
    crowdLevel: 'Low · locals walking dogs',
    insiderTip:
        'Start at Armature Works coffee, walk south three lamp posts — best color hits the water first.',
    localOnlyNote: 'Tour routes stop at the wharf, not this stretch.',
    gradient: [Color(0xFFF97316), Color(0xFFEC4899), Color(0xFF4C1D95)],
  ),
  HiddenGem(
    id: 'tampa-bay-gem-dali-roofline',
    title: 'Dalí Museum roofline view',
    location: 'St. Pete · east garden overlook',
    whySpecial:
        'Most visitors never climb to the garden overlook — bay bridge panorama in silence.',
    bestTime: 'Wed–Fri 4 PM',
    crowdLevel: 'Low · museum quiet hour',
    insiderTip:
        'Book the last entry slot — golden light on the geodesic glass is worth the timing.',
    localOnlyNote: 'Not on the standard museum audio route.',
    gradient: [Color(0xFF6366F1), Color(0xFF8B5CF6), Color(0xFF1E1B4B)],
  ),
  HiddenGem(
    id: 'tampa-bay-gem-ybor-courtyard',
    title: 'Ybor courtyard cigar patio',
    location: 'Ybor City · off 7th Ave',
    whySpecial:
        'Brick courtyard behind a cigar shop — live acoustic sets without club cover charges.',
    bestTime: 'Thu–Sat 8 PM',
    crowdLevel: 'Intimate · locals + regulars',
    insiderTip:
        'Order a Cuban sandwich to go, eat in the courtyard — staff points regulars to the side door.',
    localOnlyNote: 'Nightlife maps skip the courtyard entirely.',
    gradient: [Color(0xFF57534E), Color(0xFF44403C), Color(0xFF1C1917)],
  ),
  HiddenGem(
    id: 'tampa-bay-gem-dunedin-rooftop',
    title: 'Dunedin harbor rooftop',
    location: 'Dunedin, FL · marina walk',
    whySpecial:
        'Second-floor deck over the harbor — sunset beers without Clearwater traffic.',
    bestTime: 'Weekday sunset',
    crowdLevel: 'Moderate weekends · low weekdays',
    insiderTip:
        'Arrive before 6 PM for a rail table — dolphins sometimes trace the channel at dusk.',
    localOnlyNote: 'Weekend visitors stay on Clearwater sand instead.',
    gradient: [Color(0xFF14B8A6), Color(0xFF365314), Color(0xFF134E4A)],
  ),
];

const kTampaBayGemPlaceIds = <String, String>{
  'tampa-bay-gem-sand-key-sunrise': 'place-sand-key-park',
  'tampa-bay-gem-riverwalk-bench': 'place-tampa-riverwalk',
  'tampa-bay-gem-dali-roofline': 'place-dali-museum',
  'tampa-bay-gem-ybor-courtyard': 'place-ybor-city',
  'tampa-bay-gem-dunedin-rooftop': 'place-downtown-dunedin',
};

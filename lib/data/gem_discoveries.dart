import 'package:flutter/material.dart';
import 'package:luxora_ai/models/partner_sponsorship.dart';

/// Curated secret discoveries — local insider knowledge, not trending content.
class HiddenGem {
  const HiddenGem({
    required this.id,
    required this.title,
    required this.location,
    required this.whySpecial,
    required this.bestTime,
    required this.crowdLevel,
    required this.insiderTip,
    required this.localOnlyNote,
    required this.gradient,
    this.sponsorship,
  });

  final String id;
  final String title;
  final String location;
  final String whySpecial;
  final String bestTime;
  final String crowdLevel;
  final String insiderTip;
  final String localOnlyNote;
  final List<Color> gradient;
  final PartnerSponsorship? sponsorship;
}

const hiddenGemsCatalog = [
  HiddenGem(
    id: 'gem-wekiwa-dawn',
    title: 'Wekiwa Springs — east bank float',
    location: 'Apopka, FL · locals only trail',
    whySpecial:
        'Crystal water without the ticket-line energy of the main spring — feels like a private nature reset.',
    bestTime: '7:00–9:30 AM weekdays',
    crowdLevel: 'Low before 10 AM',
    insiderTip:
        'Enter from the north trailhead; bring a dry bag for phones — shade is sparse by noon.',
    localOnlyNote: 'Most visitors never leave the main boardwalk.',
    gradient: [Color(0xFF57534E), Color(0xFF44403C), Color(0xFF1C1917)],
  ),
  HiddenGem(
    id: 'gem-winter-park-alley',
    title: 'Park Avenue courtyard wine bar',
    location: 'Winter Park, FL · alley entrance',
    whySpecial:
        'No signage on the street — candlelit courtyard tucked behind a bookstore.',
    bestTime: 'Sunset, Tue–Thu',
    crowdLevel: 'Intimate · reservations help',
    insiderTip:
        'Ask for the corner table under the string lights — best for conversation, not people-watching.',
    localOnlyNote: 'Walk-ins rarely find seats Fri–Sat without a local tip.',
    gradient: [Color(0xFF78716C), Color(0xFF57534E), Color(0xFF292524)],
  ),
  HiddenGem(
    id: 'gem-merritt-island',
    title: 'Merritt Island dusk paddle',
    location: 'Titusville, FL · mangrove channels',
    whySpecial:
        'Bioluminescent potential in season; herons lift off in silence — Florida’s secret cathedral.',
    bestTime: '90 min before sunset',
    crowdLevel: 'Very low · guide optional',
    insiderTip:
        'Book the last slot of the day; bring insect repellent and a light jacket.',
    localOnlyNote: 'Tour buses never route here — kayak outfitters are local-run.',
    gradient: [Color(0xFF6B7280), Color(0xFF4B5563), Color(0xFF1F2937)],
  ),
  HiddenGem(
    id: 'gem-mount-dora',
    title: 'Mount Dora lakeside inn porch',
    location: 'Mount Dora, FL · lakefront',
    whySpecial:
        'Small-town stillness 45 minutes from Orlando — rocking chairs, no theme-park hum.',
    bestTime: 'Late afternoon golden hour',
    crowdLevel: 'Low · weekend brunch busier',
    insiderTip:
        'Order the citrus spritz at the porch bar — they’ll point you to the antique pier walk.',
    localOnlyNote: 'Orlando visitors rarely day-trip here without a local nudge.',
    gradient: [Color(0xFFA8A29E), Color(0xFF78716C), Color(0xFF292524)],
  ),
  HiddenGem(
    id: 'gem-kelly-park-tube',
    title: 'Kelly Park tube launch',
    location: 'Apopka, FL · Rock Springs run',
    whySpecial:
        'The crystal tube run locals guard — cold, fast, and nothing like the crowded main spring.',
    bestTime: '8:00 AM weekend entry',
    crowdLevel: 'High after 10 AM · cap enforced',
    insiderTip:
        'Park one car at the tube take-out if your group splits — cell service is spotty.',
    localOnlyNote: 'Out-of-towners rarely know the north entrance timing hack.',
    gradient: [Color(0xFF57534E), Color(0xFF3F6212), Color(0xFF1C1917)],
  ),
  HiddenGem(
    id: 'gem-blue-spring-manatee',
    title: 'Blue Spring manatee boardwalk',
    location: 'Orange City, FL',
    whySpecial:
        'Hundreds of manatees in cold snaps — boardwalk views without a boat charter.',
    bestTime: 'Cool mornings Dec–Feb',
    crowdLevel: 'Moderate · winter peaks',
    insiderTip:
        'Check the state park webcam before you drive — manatee counts update daily.',
    localOnlyNote: 'Summer visitors miss the migration entirely.',
    gradient: [Color(0xFF64748B), Color(0xFF0F766E), Color(0xFF0F172A)],
  ),
  HiddenGem(
    id: 'gem-sanford-riverwalk',
    title: 'Sanford craft riverwalk',
    location: 'Sanford, FL · lakefront',
    whySpecial:
        'Brick alleys and lake breezes — Orlando’s theme-park bubble disappears in twenty minutes.',
    bestTime: 'Thursday happy hour',
    crowdLevel: 'Low weekdays',
    insiderTip:
        'Start at the west end for sunset, walk east to the speakeasy alley bar.',
    localOnlyNote: 'Rarely on hotel concierge lists.',
    gradient: [Color(0xFF78716C), Color(0xFF57534E), Color(0xFF292524)],
  ),
  HiddenGem(
    id: 'gem-enchanted-forest',
    title: 'Enchanted Forest boardwalk',
    location: 'Titusville, FL · free',
    whySpecial:
        'Shaded oak cathedral five minutes off the Space Coast highway — zero ticket lines.',
    bestTime: 'Early morning birding',
    crowdLevel: 'Very low',
    insiderTip:
        'Combine with a late KSC visit — air-conditioning break before the drive back.',
    localOnlyNote: 'Not marketed to I-Drive tourists.',
    gradient: [Color(0xFF6B7280), Color(0xFF365314), Color(0xFF1F2937)],
  ),
];

import 'package:flutter/material.dart';

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
];

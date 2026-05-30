import 'package:luxora_ai/data/restaurant_menus.dart';
import 'package:luxora_ai/models/attraction_detail.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/places_repository.dart';

class AttractionDetailRepository {
  AttractionDetailRepository._();
  static final AttractionDetailRepository instance = AttractionDetailRepository._();

  final PlacesRepository _places = PlacesRepository.instance;

  AttractionDetail forPlace(LuxPlace place) {
    final mapUrl = officialParkMaps[place.id];
    final menu = restaurantMenus[place.id] ?? const [];
    final seeded = _seeded[place.id];
    if (seeded != null) {
      var detail = seeded;
      if (mapUrl != null) detail = detail.copyWith(officialMapUrl: mapUrl);
      if (menu.isNotEmpty) detail = detail.copyWith(menu: menu);
      return detail;
    }

    return AttractionDetail(
      officialMapUrl: mapUrl,
      menu: menu,
      placeId: place.id,
      title: place.title,
      emotionalHook:
          'Arrive, exhale, and let ${place.location} recalibrate your pace before the next moment unfolds.',
      whySpecial:
          '${place.title} is where Luxora turns planning into atmosphere. It blends ${place.categoryLabel.toLowerCase()} energy with an intentionally curated rhythm so your day feels composed, not crowded. You get the sense of discovery without the stress of guesswork. The result is a chapter that feels personal, cinematic, and quietly exclusive.',
      bestTimeToGo:
          'Best enjoyed in shoulder windows (early morning or golden hour) when lines are lighter and the mood is calmer. Midday can be busier; if crowds spike, Luxora can pivot this stop to a nearby alternative.',
      insiderTips:
          'Book your key slot before noon when possible, keep transfers short by clustering nearby stops, and leave 20–30 minutes of buffer so the experience feels unhurried. Ask staff for off-menu timing recommendations — locals often know the quietest window.',
      practicalDetails: AttractionPracticalDetails(
        typicalDuration: '75–120 min',
        costRange: '\$\$',
        bestFor: place.moodTags.take(3).toList(),
      ),
      vibeMatch: _defaultVibesForPlace(place),
      nearbyGemPlaceIds: _nearbyRecommendations(place),
    );
  }

  List<String> _defaultVibesForPlace(LuxPlace place) {
    final vibes = <String>[
      if (place.moodTags.any((t) => t.contains('romantic'))) 'Romantic',
      if (place.moodTags.any((t) => t.contains('wellness'))) 'Wellness reset',
      if (place.moodTags.any((t) => t.contains('hidden') || t.contains('gem')))
        'Hidden luxury',
      if (place.moodTags.any((t) => t.contains('foodie'))) 'Aesthetic dining',
      if (place.moodTags.any((t) => t.contains('nature') || t.contains('springs')))
        'Nature-heavy',
    ];
    if (vibes.isEmpty) {
      vibes.addAll(const ['Curated', 'Insider feel', 'Emotion-first']);
    }
    return vibes;
  }

  List<String> _nearbyRecommendations(LuxPlace place) {
    final matches = _places.activePlaces
        .where((p) => p.id != place.id && !p.moodTags.contains('trip-cover'))
        .where(
          (p) =>
              p.category == place.category ||
              p.moodTags.any((t) => place.moodTags.contains(t)),
        )
        .take(3)
        .map((p) => p.id)
        .toList();
    return matches;
  }

  /// Publicly available official park maps, keyed by place id. Only includes
  /// links that land directly on a real map (Disney's official maps hub and
  /// Universal's printable Volcano Bay PDF). Other parks publish maps only via
  /// their apps, so they fall back to the embedded interactive mini-map.
  static const Map<String, String> officialParkMaps = {
    'place-hollywood-studios': 'https://disneyworld.disney.go.com/common/maps/',
    'place-animal-kingdom': 'https://disneyworld.disney.go.com/common/maps/',
    'place-typhoon-lagoon': 'https://disneyworld.disney.go.com/common/maps/',
    'place-blizzard-beach': 'https://disneyworld.disney.go.com/common/maps/',
    'place-volcano-bay':
        'https://www.universalorlando.com/webdata/k2/en/us/files/Documents/uvb-park-map.pdf',
  };

  static const Map<String, AttractionDetail> _seeded = {
    'place-wekiwa-springs': AttractionDetail(
      placeId: 'place-wekiwa-springs',
      title: 'Wekiwa Springs – East Bank Float',
      emotionalHook:
          'Slip into crystal-clear spring water and feel the world go quiet. This is Florida before the theme parks arrived.',
      whySpecial:
          'Tucked away from tourist-heavy routes, the east bank opens into a softer, wilder version of Central Florida. The water carries that impossible emerald clarity, framed by cypress and drifting light. Herons lift off in near silence, and time feels elastic in the best way. It is less about checking a box and more about resetting your nervous system in living nature. This is the kind of stop people remember long after the flight home.',
      bestTimeToGo:
          'Go between 7:00–9:30 AM on weekdays for the calmest water and lowest crowds. Saturdays after 11 AM can feel busier. In warmer months, early arrival gives you shade and easier parking.',
      insiderTips:
          'Enter from the north trailhead for a quieter approach. Bring a dry bag and water shoes; limestone edges can be slick. Pack a light post-float layer for breezy shade and keep your next stop within 20 minutes to preserve the relaxed mood.',
      practicalDetails: AttractionPracticalDetails(
        typicalDuration: '90–150 min',
        costRange: '\$',
        bestFor: ['Nature-heavy', 'Wellness', 'Couples', 'Families'],
      ),
      vibeMatch: ['Nature-heavy', 'Wellness reset', 'Hidden luxury', 'Less crowded'],
      nearbyGemPlaceIds: [
        'place-winter-park-courtyard',
        'place-winter-park-rooftop',
        'place-wellness-spa',
      ],
    ),
    'place-winter-park-rooftop': AttractionDetail(
      placeId: 'place-winter-park-rooftop',
      title: 'Winter Park Rooftop Sunset Dinner',
      emotionalHook:
          'Golden hour arrives at your table first — skyline blush, warm light, and a slow first toast.',
      whySpecial:
          'This rooftop feels editorial without trying too hard: open skyline lines, polished service, and a pace that invites conversation. As the sun drops, the city shifts into amber and deep blue, giving the entire evening a cinematic arc. It works whether you are celebrating something big or simply marking that the trip has officially started. The staff tends to read the room well, so the experience can feel remarkably tailored. It is one of those rare places where atmosphere does half the storytelling for you.',
      bestTimeToGo:
          'Request a reservation 35–50 minutes before sunset for the best light transition. Weeknights are smoother; Friday peak can feel energetic and louder. Rain windows clear quickly in summer, so keep a flexible backup slot.',
      insiderTips:
          'Ask for west-facing seating when available. Order in two waves: a light starter before peak color, then mains after sunset for a longer golden-to-indigo flow. If you are continuing the night, pre-book your next stop to avoid surge wait times.',
      practicalDetails: AttractionPracticalDetails(
        typicalDuration: '90–120 min',
        costRange: '\$\$\$',
        bestFor: ['Romantic', 'Foodie', 'Celebrations'],
      ),
      vibeMatch: ['Romantic', 'Aesthetic dining', 'Golden hour', 'Luxury mood'],
      nearbyGemPlaceIds: [
        'place-winter-park-courtyard',
        'place-wellness-spa',
        'place-wekiwa-springs',
      ],
    ),
    'place-wellness-spa': AttractionDetail(
      placeId: 'place-wellness-spa',
      title: 'Citrus Wellness Studio',
      emotionalHook:
          'You walk in carrying travel noise and leave in a softer state — lighter, slower, and more present.',
      whySpecial:
          'This studio is designed around decompression rather than spectacle: warm tones, intentional quiet, and treatments that feel restorative instead of performative. Citrus-forward rituals and hydro moments create a clean reset after flights or long drives. It is especially powerful as a first-day anchor, because it sets your pace before the rest of the itinerary. Service is polished but calm, giving the entire visit a private-club energy. Luxora uses this stop as a rhythm setter for trips that prioritize emotional quality over volume.',
      bestTimeToGo:
          'Best in the 8:30–11:00 AM window when energy is calm and schedules are flexible. Late afternoons can book quickly, especially before weekend evenings. Arrive 15 minutes early for full facility time.',
      insiderTips:
          'Book treatment + hydro access as one block, then schedule a low-friction lunch nearby. Keep your phone on minimal mode during and 30 minutes after; the mood carryover is part of the value. If you are pairing with springs, spa first usually feels better.',
      practicalDetails: AttractionPracticalDetails(
        typicalDuration: '75–120 min',
        costRange: '\$\$\$',
        bestFor: ['Wellness', 'Romantic', 'Slow mornings'],
      ),
      vibeMatch: ['Wellness reset', 'Slow mornings', 'Hidden luxury'],
      nearbyGemPlaceIds: [
        'place-wekiwa-springs',
        'place-winter-park-rooftop',
        'place-winter-park-courtyard',
      ],
    ),
    'place-miami-vizcaya': AttractionDetail(
      placeId: 'place-miami-vizcaya',
      title: 'Vizcaya Museum & Gardens',
      emotionalHook:
          'Gilded rooms open onto Biscayne Bay — Miami\'s most romantic time capsule.',
      whySpecial:
          'James Deering\'s 1916 villa blends European grandeur with subtropical gardens that feel impossibly private for a city this loud. Stone terraces frame the bay; mangrove edges whisper; and every corridor rewards slow pacing.',
      bestTimeToGo:
          'Arrive 90 minutes before sunset Wed–Fri for garden light. Weekends after 11 AM fill quickly near the main terrace.',
      insiderTips:
          'Book online to skip the ticket line. Walk the mangrove boardwalk counter-clockwise at golden hour.',
      practicalDetails: AttractionPracticalDetails(
        typicalDuration: '2–3 hours',
        costRange: '\$\$',
        bestFor: ['Romantic', 'Culture', 'Photography', 'History'],
      ),
      vibeMatch: ['Romantic', 'Hidden luxury', 'Culture-heavy', 'Golden hour'],
      nearbyGemPlaceIds: [
        'dining-miami-mandolin',
        'place-miami-bayside-harbor',
        'place-miami-little-havana',
      ],
    ),
    'place-miami-wynwood-walls': AttractionDetail(
      placeId: 'place-miami-wynwood-walls',
      title: 'Wynwood Walls',
      emotionalHook:
          'Color at building scale — Miami\'s open-air gallery where every wall is a canvas.',
      whySpecial:
          'Murals rotate; photo angles change by the hour; and the neighborhood pulses with coffee, tacos, and gallery hops.',
      bestTimeToGo:
          'Weekday 10 AM–2 PM for softer crowds. Saturday afternoons are social and energetic.',
      insiderTips:
          'Start at Panther Coffee, walk counter-clockwise through the Walls, then lunch in the Design District.',
      practicalDetails: AttractionPracticalDetails(
        typicalDuration: '90–150 min',
        costRange: '\$\$',
        bestFor: ['Arts', 'Photography', 'Foodie', 'Walkable'],
      ),
      vibeMatch: ['Aesthetic dining', 'Trending', 'Culture-heavy', 'Creator energy'],
      nearbyGemPlaceIds: [
        'place-miami-panther-coffee',
        'place-miami-design-district',
        'dining-miami-komodo',
      ],
    ),
    'place-miami-little-havana': AttractionDetail(
      placeId: 'place-miami-little-havana',
      title: 'Calle Ocho · Little Havana',
      emotionalHook:
          'Cafecito steam, domino slap, and cigar smoke — Cuba\'s heartbeat in Miami.',
      whySpecial:
          'Living culture, not a themed street — bakeries, domino parks, and stories on every block.',
      bestTimeToGo:
          'Weekday 9–11 AM for domino park energy and shorter lines at Versailles.',
      insiderTips:
          'Walk Calle Ocho west to east. Order a cortadito at the window before sit-down lunch.',
      practicalDetails: AttractionPracticalDetails(
        typicalDuration: '2–3 hours',
        costRange: '\$',
        bestFor: ['Culture', 'Foodie', 'Local', 'Family'],
      ),
      vibeMatch: ['Local insider', 'Foodie', 'Culture-heavy', 'Walkable'],
      nearbyGemPlaceIds: [
        'dining-miami-versailles',
        'place-miami-vizcaya',
        'place-miami-design-district',
      ],
    ),
  };
}

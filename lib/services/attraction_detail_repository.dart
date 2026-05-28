import 'package:luxora_ai/models/attraction_detail.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/places_repository.dart';

class AttractionDetailRepository {
  AttractionDetailRepository._();
  static final AttractionDetailRepository instance = AttractionDetailRepository._();

  final PlacesRepository _places = PlacesRepository.instance;

  AttractionDetail forPlace(LuxPlace place) {
    final seeded = _seeded[place.id];
    if (seeded != null) {
      return seeded;
    }

    return AttractionDetail(
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
  };
}

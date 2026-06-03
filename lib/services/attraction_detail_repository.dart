import 'package:luxora_ai/data/restaurant_menus.dart';
import 'package:luxora_ai/models/attraction_detail.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/experience_moment_service.dart';
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

    final cityId = CityPackRegistry.instance.active.cityId;
    final momentTip = ExperienceMomentService.insiderTipForPlace(
      place.id,
      cityId: cityId,
    );
    final moment = ExperienceMomentService.primaryMoment(
      placeId: place.id,
      cityId: cityId,
    );

    return AttractionDetail(
      officialMapUrl: mapUrl,
      menu: menu,
      placeId: place.id,
      title: place.title,
      emotionalHook: moment != null
          ? moment.title
          : 'Arrive, exhale, and let ${place.location} recalibrate your pace before the next moment unfolds.',
      whySpecial:
          '${place.title} is where Luxora turns planning into atmosphere. It blends ${place.categoryLabel.toLowerCase()} energy with an intentionally curated rhythm so your day feels composed, not crowded. You get the sense of discovery without the stress of guesswork. The result is a chapter that feels personal, cinematic, and quietly exclusive.',
      bestTimeToGo:
          'Best enjoyed in shoulder windows (early morning or golden hour) when lines are lighter and the mood is calmer. Midday can be busier; if crowds spike, Luxora can pivot this stop to a nearby alternative.',
      insiderTips: momentTip ??
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
        'dining-prato',
        'dining-luma-on-park',
        'place-woodhouse-winter-park',
        'place-amore-domani-spa',
      ],
    ),
    'dining-luma-on-park': AttractionDetail(
      placeId: 'dining-luma-on-park',
      title: 'Luma on Park',
      emotionalHook:
          'Park Avenue energy slows to conversation — seasonal plates and golden-hour light through the windows.',
      whySpecial:
          'One of Winter Park\'s anchor restaurants — modern American cooking, a serious wine program, and a sidewalk scene that feels like the heart of the neighborhood. It works for a first-night celebration or a mid-trip reset between park days.',
      bestTimeToGo:
          'Reserve 45–60 minutes before sunset on weekends. Weeknight early dinners are easier to walk in.',
      insiderTips:
          'Ask for a sidewalk table when weather cooperates. Pair with a stroll on Park Avenue before or after.',
      practicalDetails: AttractionPracticalDetails(
        typicalDuration: '90–120 min',
        costRange: '\$\$\$',
        bestFor: ['Romantic', 'Foodie', 'Celebrations'],
      ),
      vibeMatch: ['Romantic', 'Aesthetic dining', 'Golden hour', 'Foodie'],
      nearbyGemPlaceIds: [
        'dining-prato',
        'place-woodhouse-winter-park',
        'place-scenic-boat-winter-park',
      ],
    ),
    'place-woodhouse-winter-park': AttractionDetail(
      placeId: 'place-woodhouse-winter-park',
      title: 'The Woodhouse Day Spa – Winter Park',
      emotionalHook:
          'Slip into a quiet treatment room and let the travel tension melt before the day picks up again.',
      whySpecial:
          'A proper day spa minutes from Park Avenue — massage, facials, and calm rooms without resort pricing theatrics. It is an easy first-day anchor or a mid-trip reset when park days stack up. Book a block with hydro access when available and keep lunch walkable on Winter Park’s side streets.',
      bestTimeToGo:
          'Weekday mornings (9:00–11:30 AM) are calmest. Saturday afternoons fill fast — reserve ahead.',
      insiderTips:
          'Pair with the scenic boat tour or Morse Museum for a slow Winter Park chapter. Arrive fifteen minutes early and keep your next stop unhurried.',
      practicalDetails: AttractionPracticalDetails(
        typicalDuration: '75–120 min',
        costRange: '\$\$\$',
        bestFor: ['Wellness', 'Romantic', 'Slow mornings'],
      ),
      vibeMatch: ['Wellness reset', 'Slow mornings', 'Hidden luxury'],
      nearbyGemPlaceIds: [
        'place-scenic-boat-winter-park',
        'place-morse-museum',
        'dining-luma-on-park',
        'place-amore-domani-spa',
      ],
    ),
    'place-spa-ritz-grande-lakes': AttractionDetail(
      placeId: 'place-spa-ritz-grande-lakes',
      title: 'The Ritz-Carlton Spa, Grande Lakes',
      emotionalHook:
          'Lake breezes, hushed corridors, and time that finally belongs to you again.',
      whySpecial:
          'One of Orlando’s most polished resort spas — strong for anniversaries, slow afternoons, and travelers who want luxury without a park ticket. Treatments lean unhurried; the setting does the emotional work.',
      bestTimeToGo:
          'Book mid-week afternoons for the quietest rooms. Allow buffer before dinner at the resort or a sunset drive back toward the parks.',
      insiderTips:
          'Combine with a Grande Lakes stroll or pool time if you are staying on property. Mention celebration notes when booking — the team often personalizes the room setup.',
      practicalDetails: AttractionPracticalDetails(
        typicalDuration: '90–150 min',
        costRange: '\$\$\$\$',
        bestFor: ['Wellness', 'Romantic', 'Luxury'],
      ),
      vibeMatch: ['Wellness reset', 'Hidden luxury', 'Romantic'],
      nearbyGemPlaceIds: [
        'place-spa-jw-bonnet-creek',
        'place-spa-waldorf-orlando',
        'place-leu-gardens',
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
    'place-magic-kingdom': AttractionDetail(
      placeId: 'place-magic-kingdom',
      title: 'Magic Kingdom',
      emotionalHook: 'Happily Ever After on the castle hub — the moment most families fly home talking about.',
      whySpecial:
          'The anchor Disney park — rope drop energy, classic lands, parades, and the fireworks show that defines Orlando for millions of visitors. Luxora paces it as a full emotional arc, not a ride checklist.',
      bestTimeToGo:
          'Rope drop for top-priority rides; hold the hub or Main Street for Happily Ever After 45–60 minutes before showtime on busy nights.',
      insiderTips:
          'Main Street curb or hub grass for fireworks. Consider fireworks dining at California Grill if crowds are a hard no. Stack parades midday and save hard rides for morning or late evening.',
      practicalDetails: AttractionPracticalDetails(
        typicalDuration: 'Full day',
        costRange: '\$\$\$',
        bestFor: ['Family', 'First-timers', 'Iconic nights'],
      ),
      vibeMatch: ['Iconic', 'Family', 'Memorable nights'],
      nearbyGemPlaceIds: ['place-disney-springs', 'dining-california-grill'],
    ),
    'place-epcot': AttractionDetail(
      placeId: 'place-epcot',
      title: 'EPCOT',
      emotionalHook: 'World Showcase at dusk — food, culture, then the lagoon spectacular.',
      whySpecial:
          'The most adult-friendly Disney park day — festival booths, country pavilions, and a nighttime show that rewards slow pacing.',
      bestTimeToGo:
          'Late afternoon entry for Showcase grazing; lagoon edge 30 minutes before the nighttime spectacular.',
      insiderTips:
          'Mexico or Norway promenade for softer fireworks views. Festival seasons mean dinner is grazing, not one long reservation.',
      practicalDetails: AttractionPracticalDetails(
        typicalDuration: 'Full day or evening',
        costRange: '\$\$\$',
        bestFor: ['Foodie', 'Couples', 'Festivals'],
      ),
      vibeMatch: ['Foodie', 'Couples', 'Iconic nights'],
      nearbyGemPlaceIds: ['place-disney-springs'],
    ),
    'place-hollywood-studios': AttractionDetail(
      placeId: 'place-hollywood-studios',
      title: 'Hollywood Studios',
      emotionalHook: 'Galaxy\'s Edge at open, Fantasmic! to close — a two-act thrill day.',
      whySpecial:
          'Star Wars land, premium coasters, and one of Disney\'s best night shows. The park compresses well if you anchor morning and evening.',
      bestTimeToGo:
          'Galaxy\'s Edge at rope drop; Fantasmic! seating 45+ minutes early on peak nights.',
      insiderTips:
          'Ronto Roasters mobile order keeps you in Batuu. A dining package seat can save Fantasmic! stress on holiday weeks.',
      practicalDetails: AttractionPracticalDetails(
        typicalDuration: 'Full day',
        costRange: '\$\$\$',
        bestFor: ['Adventure', 'Star Wars fans', 'Night shows'],
      ),
      vibeMatch: ['Adventure', 'Iconic nights', 'Thrill'],
      nearbyGemPlaceIds: ['place-disney-springs'],
    ),
    'place-islands-of-adventure': AttractionDetail(
      placeId: 'place-islands-of-adventure',
      title: 'Islands of Adventure',
      emotionalHook: 'Hogsmeade at open, castle lights after dark.',
      whySpecial:
          'Wizarding World emotional anchor plus marquee coasters — the park hopper half of a Universal classic.',
      bestTimeToGo:
          'Hagrid\'s and VelociCoaster first hour; The Nighttime Lights on Hogwarts after sunset.',
      insiderTips:
          'Single-rider lines help on busy weekends. Park-to-park for Diagon Alley if your ticket allows.',
      practicalDetails: AttractionPracticalDetails(
        typicalDuration: 'Full day',
        costRange: '\$\$\$',
        bestFor: ['Adventure', 'Wizarding World', 'Thrill'],
      ),
      vibeMatch: ['Adventure', 'Iconic nights', 'Family'],
      nearbyGemPlaceIds: ['place-universal-studios', 'place-volcano-bay'],
    ),
  };
}

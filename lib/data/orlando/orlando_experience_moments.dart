import 'package:luxora_ai/models/orlando/orlando_experience_moment.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';

/// Curated iconic Orlando moments — real shows, fireworks, and rituals travelers
/// expect. Editorial catalog (verify show names seasonally); not live schedules.
abstract final class OrlandoExperienceMomentsCatalog {
  static const all = <OrlandoExperienceMoment>[
    // —— Walt Disney World ——
    OrlandoExperienceMoment(
      id: 'moment-mk-happily-ever-after',
      placeId: 'place-magic-kingdom',
      kind: OrlandoMomentKind.fireworks,
      phase: DayPhase.evening,
      priority: 100,
      title: 'Happily Ever After',
      conciergeLine:
          'Stay for Happily Ever After on the castle — stake out Main Street or the hub 45–60 minutes early for the full story.',
      insiderTip:
          'Main Street curb or the hub grass give the classic view. On busy nights, consider a fireworks dining package at a resort or California Grill instead of fighting the exit crush.',
      tags: ['fireworks', 'iconic', 'family', 'night'],
    ),
    OrlandoExperienceMoment(
      id: 'moment-mk-rope-drop',
      placeId: 'place-magic-kingdom',
      kind: OrlandoMomentKind.atmosphere,
      phase: DayPhase.morning,
      priority: 85,
      title: 'Rope drop on the castle',
      conciergeLine:
          'Rope drop sets the tone — head to your must-do land first while lines are still human.',
      insiderTip:
          'Seven Dwarfs Mine Train and TRON reward an early move if they are on your list. Save parades and character stops for the midday heat.',
      tags: ['iconic', 'family'],
    ),
    OrlandoExperienceMoment(
      id: 'moment-mk-parade-festival',
      placeId: 'place-magic-kingdom',
      kind: OrlandoMomentKind.parade,
      phase: DayPhase.midday,
      priority: 70,
      title: 'Festival of Fantasy parade',
      conciergeLine:
          'Catch Festival of Fantasy on Main Street when crowds spike — it is the easy midday anchor.',
      insiderTip:
          'Stand near the castle end of Main Street for softer sun and a quick pivot to afternoon rides.',
      tags: ['parade', 'family'],
    ),
    OrlandoExperienceMoment(
      id: 'moment-epcot-luminous',
      placeId: 'place-epcot',
      kind: OrlandoMomentKind.fireworks,
      phase: DayPhase.evening,
      priority: 100,
      title: 'Luminous nighttime spectacular',
      conciergeLine:
          'World Showcase lagoon at night — graze around the countries, then hold the lagoon edge for Luminous.',
      insiderTip:
          'Mexico or Norway promenade corners stay less packed than the main bridge. Festival seasons add food booths — plan dinner as grazing, not one sit-down.',
      tags: ['fireworks', 'foodie', 'couples'],
    ),
    OrlandoExperienceMoment(
      id: 'moment-epcot-festival',
      placeId: 'place-epcot',
      kind: OrlandoMomentKind.seasonal,
      phase: DayPhase.midday,
      priority: 75,
      title: 'Festival tasting lap',
      conciergeLine:
          'Festival booths are the plan at EPCOT — sample your way around the Showcase instead of one long lunch line.',
      insiderTip:
          'Share plates, hit the countries you care about first, and save the lagoon for the last hour of light.',
      tags: ['foodie', 'seasonal'],
    ),
    OrlandoExperienceMoment(
      id: 'moment-hs-fantasmic',
      placeId: 'place-hollywood-studios',
      kind: OrlandoMomentKind.show,
      phase: DayPhase.evening,
      priority: 100,
      title: 'Fantasmic!',
      conciergeLine:
          'Bookend the day with Fantasmic! — arrive early for the amphitheater or grab a dining package seat.',
      insiderTip:
          'Stack Galaxy\'s Edge morning, midday coasters, then Fantasmic! as your hard stop — exit fatigue is real after the finale.',
      tags: ['show', 'night', 'family'],
    ),
    OrlandoExperienceMoment(
      id: 'moment-hs-galaxys-edge',
      placeId: 'place-hollywood-studios',
      kind: OrlandoMomentKind.atmosphere,
      phase: DayPhase.morning,
      priority: 90,
      title: "Galaxy's Edge at open",
      conciergeLine:
          "Galaxy's Edge at park open — Rise of the Resistance and Smuggler's Run before the heat and lines build.",
      insiderTip:
          'Mobile order at Ronto Roasters for a quick breakfast that keeps you in Batuu.',
      tags: ['adventure', 'iconic'],
    ),
    OrlandoExperienceMoment(
      id: 'moment-ak-pandora-night',
      placeId: 'place-animal-kingdom',
      kind: OrlandoMomentKind.atmosphere,
      phase: DayPhase.evening,
      priority: 95,
      title: 'Pandora after dark',
      conciergeLine:
          'Pandora bioluminescent at dusk — stay after the safari crowd leaves for the glow and shorter Flight of Passage waits.',
      insiderTip:
          'Kilimanjaro Safari first thing, Pandora late afternoon into evening. Tree of Life projections are a quiet bonus on the way out.',
      tags: ['nature', 'family', 'night'],
    ),
    OrlandoExperienceMoment(
      id: 'moment-ak-safari-morning',
      placeId: 'place-animal-kingdom',
      kind: OrlandoMomentKind.atmosphere,
      phase: DayPhase.morning,
      priority: 88,
      title: 'Kilimanjaro Safari dawn',
      conciergeLine:
          'First safari of the day — animals are active and the heat has not flattened the savanna yet.',
      insiderTip:
          'Pair with Avatar Flight of Passage in the evening same day for a calm Animal Kingdom rhythm.',
      tags: ['nature', 'family'],
    ),
    OrlandoExperienceMoment(
      id: 'moment-typhoon-lagoon-wave',
      placeId: 'place-typhoon-lagoon',
      kind: OrlandoMomentKind.atmosphere,
      phase: DayPhase.midday,
      priority: 80,
      title: 'Typhoon Lagoon surf pool',
      conciergeLine:
          'Claim chairs early, hit the big wave pool mid-morning, then lazy river when the sun peaks.',
      insiderTip:
          'A water park half-day pairs cleanly with Disney Springs dinner — keep the evening light.',
      tags: ['water', 'family', 'relaxing'],
    ),
    OrlandoExperienceMoment(
      id: 'moment-blizzard-beach-summit',
      placeId: 'place-blizzard-beach',
      kind: OrlandoMomentKind.atmosphere,
      phase: DayPhase.morning,
      priority: 78,
      title: 'Summit Plummet morning',
      conciergeLine:
          'Blizzard Beach before noon — Summit Plummet and Team Boat Springs when lines are shortest.',
      insiderTip:
          'Cross-over days with a dry park are rare; treat this as a full reset day, not a rushed add-on.',
      tags: ['water', 'adventure'],
    ),
    OrlandoExperienceMoment(
      id: 'moment-springs-live-music',
      placeId: 'place-disney-springs',
      kind: OrlandoMomentKind.show,
      phase: DayPhase.evening,
      priority: 72,
      title: 'Disney Springs evening stroll',
      conciergeLine:
          'Disney Springs after dark — live music on the waterfront, no ticket required, great between park days.',
      insiderTip:
          'Amphicar tours and The Edison work for date night; splitsville and food halls for families.',
      tags: ['dining', 'nightlife', 'free'],
    ),
    OrlandoExperienceMoment(
      id: 'moment-california-grill-fireworks',
      placeId: 'dining-california-grill',
      kind: OrlandoMomentKind.diningWindow,
      phase: DayPhase.evening,
      priority: 92,
      title: 'Fireworks from California Grill',
      conciergeLine:
          'California Grill reservation timed to Magic Kingdom fireworks — rooftop viewing without the hub crowd.',
      insiderTip:
          'Ask for the observation deck access window when you check in; dress slightly elevated for the lounge vibe.',
      tags: ['fireworks', 'luxury', 'dining'],
    ),
    // —— Universal Orlando ——
    OrlandoExperienceMoment(
      id: 'moment-ioa-hogwarts-lights',
      placeId: 'place-islands-of-adventure',
      kind: OrlandoMomentKind.show,
      phase: DayPhase.evening,
      priority: 98,
      title: 'The Nighttime Lights on Hogwarts',
      conciergeLine:
          'Hogsmeade at dusk, then The Nighttime Lights on Hogwarts — the castle show is the emotional payoff.',
      insiderTip:
          'Hagrid\'s and VelociCoaster morning, Wizarding World afternoon, castle lights after dark.',
      tags: ['iconic', 'family', 'night'],
    ),
    OrlandoExperienceMoment(
      id: 'moment-ioa-velocicoaster',
      placeId: 'place-islands-of-adventure',
      kind: OrlandoMomentKind.atmosphere,
      phase: DayPhase.morning,
      priority: 82,
      title: 'Coaster stack at open',
      conciergeLine:
          'Islands at open — Hagrid\'s and VelociCoaster before park hopper crowds arrive.',
      insiderTip:
          'Single-rider lines help on busy weekends if your group can split.',
      tags: ['adventure', 'thrill'],
    ),
    OrlandoExperienceMoment(
      id: 'moment-usf-diagon-alley',
      placeId: 'place-universal-studios',
      kind: OrlandoMomentKind.atmosphere,
      phase: DayPhase.midday,
      priority: 80,
      title: 'Diagon Alley reveal',
      conciergeLine:
          'Diagon Alley midday — Escape from Gringotts and knockturn alley shade when IOA morning energy fades.',
      insiderTip:
          'Park-to-park if you have it: Hogwarts Express links the Wizarding World halves cleanly.',
      tags: ['iconic', 'family'],
    ),
    OrlandoExperienceMoment(
      id: 'moment-volcano-bay-tapu',
      placeId: 'place-volcano-bay',
      kind: OrlandoMomentKind.atmosphere,
      phase: DayPhase.morning,
      priority: 85,
      title: 'TapuTapu first',
      conciergeLine:
          'Volcano Bay open — link TapuTapu first, Krakatau Aqua Coaster before the lazy river crowd settles in.',
      insiderTip:
          'Premium seating is worth it on peak summer weeks; treat as a half-day breather between dry parks.',
      tags: ['water', 'relaxing'],
    ),
    // —— SeaWorld & regional ——
    OrlandoExperienceMoment(
      id: 'moment-seaworld-orca',
      placeId: 'place-seaworld-orlando',
      kind: OrlandoMomentKind.show,
      phase: DayPhase.midday,
      priority: 75,
      title: 'SeaWorld shows & coasters',
      conciergeLine:
          'SeaWorld half-day — pipeline coaster morning, then sea lion or orca presentation as your timed anchor.',
      insiderTip:
          'Aquatica combo tickets make a strong two-day water + marine rhythm without Disney pricing.',
      tags: ['family', 'wildlife'],
    ),
    OrlandoExperienceMoment(
      id: 'moment-kennedy-launch',
      placeId: 'place-kennedy-space-center',
      kind: OrlandoMomentKind.seasonal,
      phase: DayPhase.morning,
      priority: 88,
      title: 'Launch viewing window',
      conciergeLine:
          'Kennedy Space Center — align with a morning launch if the calendar cooperates; Saturn V hall as backup plan.',
      insiderTip:
          'Stay north of the parks the night before a launch — traffic on A1A spikes hard.',
      tags: ['iconic', 'family', 'seasonal'],
    ),
    OrlandoExperienceMoment(
      id: 'moment-lake-eola-swan',
      placeId: 'place-lake-eola',
      kind: OrlandoMomentKind.atmosphere,
      phase: DayPhase.evening,
      priority: 65,
      title: 'Lake Eola swan boats',
      conciergeLine:
          'Lake Eola at golden hour — swan pedal boats and skyline views between heavy park days.',
      insiderTip:
          'Sunday farmers market mornings pair with a Winter Park afternoon if you want a local reset day.',
      tags: ['romantic', 'free', 'downtown'],
    ),
    OrlandoExperienceMoment(
      id: 'moment-wekiwa-springs-float',
      placeId: 'place-wekiwa-springs',
      kind: OrlandoMomentKind.atmosphere,
      phase: DayPhase.morning,
      priority: 70,
      title: 'Crystal spring float',
      conciergeLine:
          'Wekiwa Springs before 9 AM — crystal water and shade while theme park crowds sleep in.',
      insiderTip:
          'Rent tubes on site; keep lunch in Apopka or Winter Park, not another long drive.',
      tags: ['nature', 'hidden', 'relaxing'],
    ),
  ];

  static List<OrlandoExperienceMoment> forPlace(String placeId) =>
      all.where((m) => m.placeId == placeId).toList(growable: false);
}

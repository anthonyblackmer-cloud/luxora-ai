import 'package:flutter/material.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';

/// Curated Florida Keys hidden gems — tied to real [FloridaKeysCuratedPlaces] ids.
const floridaKeysHiddenGemsCatalog = [
  HiddenGem(
    id: 'keys-gem-pennekamp-early',
    title: 'Pennekamp — first snorkel boat',
    location: 'Key Largo, FL · John Pennekamp Coral Reef State Park',
    whySpecial:
        'Christ of the Deep and Molasses Reef calm before the charter rush — glass-bottom clarity on light-wind mornings.',
    bestTime: '8:00–10:30 AM weekdays',
    crowdLevel: 'Moderate · first boat is calmest',
    insiderTip:
        'Book the earliest reef trip and ask for leeward moorings when wind picks up.',
    localOnlyNote: 'Day-trippers from Miami rarely leave before noon.',
    gradient: [Color(0xFF0EA5E9), Color(0xFF14B8A6), Color(0xFF0F172A)],
  ),
  HiddenGem(
    id: 'keys-gem-molasses-wall',
    title: 'Molasses Reef wall dive',
    location: 'Key Largo · Atlantic reef tract',
    whySpecial:
        'Legendary reef wall with sea turtles and crystal viz — dive boats run daily from Key Largo marinas.',
    bestTime: 'Morning dive slots · Tue–Thu',
    crowdLevel: 'Moderate on weekends',
    insiderTip:
        'Check wind forecast — north wind often improves visibility on the Atlantic side.',
    localOnlyNote: 'Snorkel-only visitors miss the deeper wall entirely.',
    gradient: [Color(0xFF38BDF8), Color(0xFF0D9488), Color(0xFF134E4A)],
  ),
  HiddenGem(
    id: 'keys-gem-robbies-dock',
    title: 'Robbie\'s tarpon dock',
    location: 'Islamorada, FL · mile marker 77.5',
    whySpecial:
        'Hand-feed massive tarpon from the dock, then grab a fish sandwich — a Keys ritual since the 1970s.',
    bestTime: 'Late morning before lunch rush',
    crowdLevel: 'High weekends · manageable weekdays',
    insiderTip:
        'Buy the bait bucket, feed from the far end of the dock, then lunch at the on-site grill.',
    localOnlyNote: 'Tour buses stop here — arrive before 10 AM for space.',
    gradient: [Color(0xFFF97316), Color(0xFFFB7185), Color(0xFF4C1D95)],
  ),
  HiddenGem(
    id: 'keys-gem-seven-mile-sunrise',
    title: 'Seven Mile Bridge sunrise pull-off',
    location: 'Marathon · Overseas Highway',
    whySpecial:
        'Legacy bridge ramp views without Key West crowds — horizon glow over the Atlantic.',
    bestTime: 'Sunrise · 6:30–7:15 AM',
    crowdLevel: 'Low weekdays',
    insiderTip:
        'Use the old bridge fishing pier access for photos facing east before traffic builds.',
    localOnlyNote: 'Most drivers never stop between Miami and Key West.',
    gradient: [Color(0xFF64748B), Color(0xFF0F766E), Color(0xFF1E293B)],
  ),
  HiddenGem(
    id: 'keys-gem-sombrero-north',
    title: 'Sombrero Beach north end',
    location: 'Marathon, FL · free public beach',
    whySpecial:
        'Calm shallows and palm shade — locals swim here when Bahia Honda parking fills.',
    bestTime: 'Weekday afternoons',
    crowdLevel: 'Moderate weekends · low weekdays',
    insiderTip:
        'Walk north past the main pavilion for quieter sand and fewer volleyball nets.',
    localOnlyNote: 'Highway tourists often skip Marathon entirely.',
    gradient: [Color(0xFF0EA5E9), Color(0xFF14B8A6), Color(0xFF0F172A)],
  ),
  HiddenGem(
    id: 'keys-gem-bahia-shallows',
    title: 'Bahia Honda shallow swim',
    location: 'Big Pine Key, FL · Bahia Honda State Park',
    whySpecial:
        'Often called the Keys\' best beach — turquoise shallows under the Old Bahia Honda Bridge.',
    bestTime: 'Before 10 AM for parking',
    crowdLevel: 'High on calm weekends',
    insiderTip:
        'Enter from the ocean-side lot and swim near the bridge pilings for shade breaks.',
    localOnlyNote: 'Day-trippers from Key West rarely drive back north for this.',
    gradient: [Color(0xFF38BDF8), Color(0xFF14B8A6), Color(0xFF0F172A)],
  ),
  HiddenGem(
    id: 'keys-gem-key-deer-dawn',
    title: 'Key deer at first light',
    location: 'Big Pine Key · National Key Deer Refuge',
    whySpecial:
        'Tiny Key deer grazing in pine hammocks — quiet bike paths far from US-1 rush.',
    bestTime: 'Sunrise · 6:45–8:00 AM',
    crowdLevel: 'Very low',
    insiderTip:
        'Drive slowly on Key Deer Boulevard — dawn is when deer cross near No Name Pub road.',
    localOnlyNote: 'Most visitors only see deer from a car window at speed.',
    gradient: [Color(0xFF78716C), Color(0xFF57534E), Color(0xFF292524)],
  ),
  HiddenGem(
    id: 'keys-gem-fort-zachary-snorkel',
    title: 'Fort Zachary rock-edge snorkel',
    location: 'Key West, FL · Fort Zachary Taylor State Park',
    whySpecial:
        'Clear water off the rock edge — locals\' favorite swim away from Duval Street crowds.',
    bestTime: 'Morning before noon heat',
    crowdLevel: 'Moderate · lower on weekdays',
    insiderTip:
        'Bring chairs and stay through sunset glow — picnic groves have shade the beach lacks.',
    localOnlyNote: 'Cruise passengers rarely leave the Duval corridor for this.',
    gradient: [Color(0xFF0EA5E9), Color(0xFF0D9488), Color(0xFF134E4A)],
  ),
  HiddenGem(
    id: 'keys-gem-hogfish-dock',
    title: 'Hogfish Bar dock lunch',
    location: 'Stock Island, Key West',
    whySpecial:
        'Dockside hogfish and yellowtail on a working waterfront — zero tourist polish, maximum flavor.',
    bestTime: '11:30 AM–1:30 PM weekdays',
    crowdLevel: 'Moderate · lunch only',
    insiderTip:
        'Sit at the dock rail facing the working boats — order whatever came in that morning.',
    localOnlyNote: 'Old Town visitors rarely cross to Stock Island.',
    gradient: [Color(0xFF78716C), Color(0xFF57534E), Color(0xFF1C1917)],
  ),
  HiddenGem(
    id: 'keys-gem-mallory-angle',
    title: 'Mallory Square — east waterfront angle',
    location: 'Key West, FL · Sunset Celebration',
    whySpecial:
        'Street performers and conch fritters — the most famous sunset in Florida when you arrive early.',
    bestTime: '90 min before sunset',
    crowdLevel: 'High nightly · arrive early',
    insiderTip:
        'Stand on the east pier extension before performers pack the main square.',
    localOnlyNote: 'Late arrivals only see shoulders and phone screens.',
    gradient: [Color(0xFFF97316), Color(0xFFFB7185), Color(0xFF292524)],
  ),
  HiddenGem(
    id: 'keys-gem-dry-tortugas-moat',
    title: 'Dry Tortugas moat snorkel',
    location: '70 miles west of Key West',
    whySpecial:
        'Fort Jefferson moat wall snorkel on a remote island — bucket-list isolation after the Yankee Freedom crossing.',
    bestTime: 'Book earliest ferry · calm seas only',
    crowdLevel: 'Limited seats daily',
    insiderTip:
        'Snorkel the moat wall right after the fort tour while others eat lunch.',
    localOnlyNote: 'Most Key West visitors never leave the island for the day trip.',
    gradient: [Color(0xFF38BDF8), Color(0xFF14B8A6), Color(0xFF0F172A)],
  ),
  HiddenGem(
    id: 'keys-gem-seaport-sunset',
    title: 'Historic Seaport sunset sail',
    location: 'Key West, FL · Key West Bight',
    whySpecial:
        'Schooner sails and dockside bars from the working waterfront — quieter than Duval at golden hour.',
    bestTime: '90 min before sunset',
    crowdLevel: 'Moderate · book sails ahead',
    insiderTip:
        'Compare schooner vs catamaran departure times — catamarans often have more deck space.',
    localOnlyNote: 'Hotel packages rarely include the seaport walk from Old Town.',
    gradient: [Color(0xFF64748B), Color(0xFF0F766E), Color(0xFF1E293B)],
  ),
];

const kFloridaKeysGemPlaceIds = <String, String>{
  'keys-gem-pennekamp-early': 'place-keys-pennekamp',
  'keys-gem-molasses-wall': 'place-keys-molasses-reef',
  'keys-gem-robbies-dock': 'place-keys-robbies-marina',
  'keys-gem-seven-mile-sunrise': 'place-keys-seven-mile-bridge',
  'keys-gem-sombrero-north': 'place-keys-sombrero-beach',
  'keys-gem-bahia-shallows': 'place-keys-bahia-honda',
  'keys-gem-key-deer-dawn': 'place-keys-big-pine-key-deer',
  'keys-gem-fort-zachary-snorkel': 'place-keys-fort-zachary',
  'keys-gem-hogfish-dock': 'place-keys-hogfish-bar',
  'keys-gem-mallory-angle': 'place-keys-mallory-square',
  'keys-gem-dry-tortugas-moat': 'place-keys-dry-tortugas',
  'keys-gem-seaport-sunset': 'place-keys-key-west-harbor',
};

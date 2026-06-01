import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/services/active_trip_plan_store.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';

TripPlan samplePlanForActiveCity() {
  final cityId = CityPackRegistry.instance.active.cityId;
  final stored = ActiveTripPlanStore.instance.planFor(cityId);
  if (stored != null && stored.days.any((d) => d.items.isNotEmpty)) {
    return stored;
  }
  if (cityId == 'miami') {
    return sampleMiamiEscapePlan;
  }
  return sampleGoldenEscapePlan;
}

const sampleMiamiEscapePlan = TripPlan(
  id: 'miami-golden',
  title: 'Miami Golden Escape',
  days: [
    TripDay(
      dayNumber: 1,
      label: 'South Beach rhythm',
      items: [
        TripItem(
          id: 'm1',
          time: '8:30 AM',
          title: 'Sunrise on Lummus Park Beach',
          emotionalLine:
              'Wide Atlantic light and soft sand — you start Miami unhurried, not tourist-rushed.',
          location: 'South Beach',
          category: 'Beach',
          placeId: 'place-miami-lummus-park',
        ),
        TripItem(
          id: 'm2',
          time: '1:00 PM',
          title: 'Wynwood mural walk',
          emotionalLine:
              'Color explodes block by block — your camera finds stories the guidebooks skip.',
          location: 'Wynwood',
          category: 'Arts',
          placeId: 'place-miami-wynwood-walls',
        ),
        TripItem(
          id: 'm3',
          time: '6:30 PM',
          title: 'Vizcaya gardens at golden hour',
          emotionalLine:
              'Bay breezes through Italian stone — dinner energy without leaving the romance.',
          location: 'Coconut Grove',
          category: 'Culture',
          placeId: 'place-miami-vizcaya',
        ),
      ],
    ),
    TripDay(
      dayNumber: 2,
      label: 'Culture & coast',
      items: [
        TripItem(
          id: 'm4',
          time: '10:00 AM',
          title: 'Pérez Art Museum terrace',
          emotionalLine:
              'Modern art with Biscayne views — a calm counterpoint to last night\'s neon.',
          location: 'Downtown Miami',
          category: 'Museums',
          placeId: 'place-miami-perez-art',
        ),
        TripItem(
          id: 'm5',
          time: '2:30 PM',
          title: 'Little Havana cafecito crawl',
          emotionalLine:
              'Espresso, domino clatter, and living history — Miami as locals actually live it.',
          location: 'Little Havana',
          category: 'Food',
          placeId: 'place-miami-little-havana',
        ),
        TripItem(
          id: 'm6',
          time: '7:15 PM',
          title: 'Ocean Drive sunset stroll',
          emotionalLine:
              'Art deco pastels glow as the Atlantic turns gold — your table waits nearby.',
          location: 'South Beach',
          category: 'Nightlife',
          placeId: 'place-miami-ocean-drive',
        ),
      ],
    ),
  ],
);

const sampleGoldenEscapePlan = TripPlan(
  id: 'orlando-golden',
  title: 'Orlando Golden Escape',
  days: [
    TripDay(
      dayNumber: 1,
      label: 'Arrival reset',
      items: [
        TripItem(
          id: '1',
          time: '9:00 AM',
          title: 'Slow spa morning',
          emotionalLine:
              'You ease into the day — steam, quiet rooms, and time that belongs to you.',
          location: 'The Woodhouse Day Spa, Winter Park',
          category: 'Spas',
          placeId: 'place-woodhouse-winter-park',
        ),
        TripItem(
          id: '2',
          time: '1:30 PM',
          title: 'Hidden spring dip',
          emotionalLine:
              'Cool emerald water washes away travel fatigue — Florida most tourists never see.',
          location: 'Wekiwa Springs',
          category: 'Springs',
          placeId: 'place-wekiwa-springs',
        ),
        TripItem(
          id: '3',
          time: '6:45 PM',
          title: 'Luma on Park dinner',
          emotionalLine:
              'Park Avenue glow at your table — seasonal plates and a wine list worth lingering over.',
          location: 'Winter Park',
          category: 'Dining',
          placeId: 'dining-luma-on-park',
        ),
      ],
    ),
    TripDay(
      dayNumber: 2,
      label: 'Discovery day',
      items: [
        TripItem(
          id: '4',
          time: '10:00 AM',
          title: 'Prato brunch on Park Ave',
          emotionalLine:
              'Wood-fired pizza and pasta on the avenue — a slow morning before the afternoon adventure.',
          location: 'Winter Park',
          category: 'Dining',
          placeId: 'dining-prato',
        ),
        TripItem(
          id: '5',
          time: '2:00 PM',
          title: 'Wildlife drive loop',
          emotionalLine:
            'Roseate spoonbills and marsh silence reset your headspace before the evening build.',
          location: 'Merritt Island National Wildlife Refuge',
          category: 'Nature',
          placeId: 'place-merritt-island-nwr',
        ),
        TripItem(
          id: '6',
          time: '7:10 PM',
          title: 'Return to Park Avenue',
          emotionalLine:
              'A second dinner, different mood — this time celebratory and unhurried.',
          location: 'Winter Park',
          category: 'Dining',
          placeId: 'dining-luma-on-park',
        ),
      ],
    ),
    TripDay(
      dayNumber: 3,
      label: 'Theme park wonder',
      items: [
        TripItem(
          id: '7',
          time: '8:30 AM',
          title: 'Magic Kingdom — castle day',
          emotionalLine:
              'The park opens like a storybook — you chose wonder over rushing.',
          location: 'Lake Buena Vista',
          category: 'Theme parks',
          placeId: 'place-magic-kingdom',
        ),
      ],
    ),
  ],
);

import 'package:luxora_ai/models/trip_plan.dart';

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
              'You ease into the day — steam, citrus water, and time that belongs to you.',
          location: 'Winter Park wellness studio',
          category: 'Spas',
          placeId: 'place-wellness-spa',
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
          title: 'Rooftop sunset dinner',
          emotionalLine:
              'Your table is timed for golden hour — the skyline blushes with your first toast.',
          location: 'Winter Park rooftop',
          category: 'Rooftop dining',
          placeId: 'place-winter-park-rooftop',
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
          title: 'Courtyard brunch hidden off Park Ave',
          emotionalLine:
              'A tucked-away table starts the day softly — no crowds, no rush, just mood.',
          location: 'Park Avenue courtyard',
          category: 'Dining',
          placeId: 'place-winter-park-courtyard',
        ),
        TripItem(
          id: '5',
          time: '2:00 PM',
          title: 'Mangrove paddle window',
          emotionalLine:
              'Light movement and still water reset your headspace before the evening build.',
          location: 'Merritt Island channels',
          category: 'Nature',
          placeId: 'place-mangrove-paddle',
        ),
        TripItem(
          id: '6',
          time: '7:10 PM',
          title: 'Golden-hour return to the skyline',
          emotionalLine:
              'A second sunset, different mood — this time playful and celebratory.',
          location: 'Winter Park rooftop',
          category: 'Rooftop dining',
          placeId: 'place-winter-park-rooftop',
        ),
      ],
    ),
  ],
);

import 'package:flutter/material.dart';
import 'package:luxora_ai/models/trip_profile.dart';

class ExperienceCard {
  const ExperienceCard({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.location,
    required this.gradient,
    required this.emotionalHook,
    required this.tags,
  });

  final String id;
  final String title;
  final String subtitle;
  final String category;
  final String location;
  final List<Color> gradient;
  final String emotionalHook;
  final List<String> tags;
}

class MoodOption {
  const MoodOption(this.mood, this.label, this.emoji);
  final TripMood mood;
  final String label;
  final String emoji;
}

const floridaCategories = [
  'Hidden gems',
  'Luxury staycations',
  'Beaches',
  'Rooftop dining',
  'Spas',
  'Nightlife',
  'Family',
  'Eco tourism',
  'Theme parks',
  'Romantic getaways',
  'Food experiences',
  'Springs',
  'Island hopping',
  'Influencer-worthy',
];

const moodOptions = [
  MoodOption(TripMood.romantic, 'Romantic', '✨'),
  MoodOption(TripMood.relaxing, 'Relaxing', '🌊'),
  MoodOption(TripMood.adventurous, 'Adventurous', '🌴'),
  MoodOption(TripMood.luxurious, 'Luxurious', '🥂'),
  MoodOption(TripMood.familyBonding, 'Family bonding', '👨‍👩‍👧'),
  MoodOption(TripMood.social, 'Social', '🎉'),
  MoodOption(TripMood.nature, 'Nature-focused', '🦋'),
  MoodOption(TripMood.wellness, 'Wellness retreat', '🧘'),
  MoodOption(TripMood.foodie, 'Foodie experience', '🍽️'),
];

const floridaExperiences = [
  ExperienceCard(
    id: 'winter-park-rooftop',
    title: 'Rooftop Sunset & Small Plates',
    subtitle: 'Winter Park skyline',
    category: 'Rooftop dining',
    location: 'Winter Park, FL',
    gradient: [Color(0xFFF59E0B), Color(0xFFE11D48), Color(0xFF312E81)],
    emotionalHook:
        'Golden hour arrives before your appetite — this is where the vacation truly begins.',
    tags: ['romantic', 'foodie', 'luxury'],
  ),
  ExperienceCard(
    id: 'wekiwa-springs',
    title: 'Crystal Spring Morning Float',
    subtitle: 'Hidden emerald water',
    category: 'Springs',
    location: 'Apopka, FL',
    gradient: [Color(0xFF2DD4BF), Color(0xFF059669), Color(0xFF0F172A)],
    emotionalHook:
        "Cool water, dappled light, zero crowds if you arrive early — nature's reset button.",
    tags: ['nature', 'wellness', 'hidden-gem'],
  ),
  ExperienceCard(
    id: 'south-beach-staycation',
    title: 'Oceanfront Luxury Staycation',
    subtitle: 'South Beach rhythm',
    category: 'Luxury staycations',
    location: 'Miami Beach, FL',
    gradient: [Color(0xFF38BDF8), Color(0xFF06B6D4), Color(0xFF4C1D95)],
    emotionalHook:
        'Wake to salt air and linen sheets — your balcony feels like a private island.',
    tags: ['luxury', 'relaxing', 'beach'],
  ),
  ExperienceCard(
    id: 'disney-after-hours',
    title: 'Theme Park After-Dark Magic',
    subtitle: 'Orlando icons, fewer crowds',
    category: 'Theme parks',
    location: 'Lake Buena Vista, FL',
    gradient: [Color(0xFFD946EF), Color(0xFF7C3AED), Color(0xFF020617)],
    emotionalHook:
        'Sparkles feel closer at night — childhood wonder, adult pacing.',
    tags: ['family', 'adventure'],
  ),
];

class ItineraryMoment {
  const ItineraryMoment({
    required this.id,
    required this.time,
    required this.title,
    required this.emotionalLine,
    required this.location,
    required this.category,
  });

  final String id;
  final String time;
  final String title;
  final String emotionalLine;
  final String location;
  final String category;
}

const sampleOrlandoItinerary = [
  ItineraryMoment(
    id: '1',
    time: '9:00 AM',
    title: 'Slow spa morning',
    emotionalLine:
        'You ease into the day — steam, citrus water, and time that belongs to you.',
    location: 'Winter Park wellness studio',
    category: 'Spas',
  ),
  ItineraryMoment(
    id: '2',
    time: '1:30 PM',
    title: 'Hidden spring dip',
    emotionalLine:
        'Cool emerald water washes away travel fatigue — Florida most tourists never see.',
    location: 'Wekiwa Springs',
    category: 'Springs',
  ),
  ItineraryMoment(
    id: '3',
    time: '6:45 PM',
    title: 'Rooftop sunset dinner',
    emotionalLine:
        'Your table is timed for golden hour — the skyline blushes with your first toast.',
    location: 'Winter Park rooftop',
    category: 'Rooftop dining',
  ),
];

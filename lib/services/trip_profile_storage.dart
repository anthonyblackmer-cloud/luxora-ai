import 'dart:convert';

import 'package:luxora_ai/models/trip_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _key = 'luxora_trip_profile';

class TripProfileStorage {
  Future<void> save(TripProfile profile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(_encode(profile)));
  }

  Future<TripProfile?> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) return null;
    try {
      return _decode(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Map<String, dynamic> _encode(TripProfile p) => {
        'destination': p.destination,
        'region': p.region,
        'startDate': p.startDate,
        'endDate': p.endDate,
        'budgetUsd': p.budgetUsd,
        'travelerCount': p.travelerCount,
        'adults': p.adults,
        'kids': p.kids,
        'pace': p.pace.name,
        'luxuryLevel': p.luxuryLevel.name,
        'nightlifeInterest': p.nightlifeInterest,
        'relaxationVsAdventure': p.relaxationVsAdventure,
        'foodieInterest': p.foodieInterest,
        'discoveryStyle': p.discoveryStyle.name,
        'tripFeel': p.tripFeel,
        'moods': p.moods.map((m) => m.name).toList(),
      };

  TripProfile _decode(Map<String, dynamic> m) {
    return TripProfile(
      destination: m['destination'] as String? ?? 'Orlando',
      region: m['region'] as String? ?? 'Florida',
      startDate: m['startDate'] as String? ?? '',
      endDate: m['endDate'] as String? ?? '',
      budgetUsd: m['budgetUsd'] as int? ?? 3500,
      travelerCount: m['travelerCount'] as int? ?? 2,
      adults: m['adults'] as int? ?? 2,
      kids: m['kids'] as int? ?? 0,
      pace: PacePreference.values.byName(m['pace'] as String? ?? 'balanced'),
      luxuryLevel: LuxuryLevel.values
          .byName(m['luxuryLevel'] as String? ?? 'premium'),
      nightlifeInterest: m['nightlifeInterest'] as int? ?? 40,
      relaxationVsAdventure: m['relaxationVsAdventure'] as int? ?? 50,
      foodieInterest: m['foodieInterest'] as int? ?? 70,
      discoveryStyle: DiscoveryStyle.values
          .byName(m['discoveryStyle'] as String? ?? 'balanced'),
      tripFeel: m['tripFeel'] as String? ?? '',
      moods: (m['moods'] as List<dynamic>? ?? [])
          .map((e) => TripMood.values.byName(e as String))
          .toList(),
    );
  }
}

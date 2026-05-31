import 'dart:convert';

import 'package:luxora_ai/models/trip_occasion.dart';
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
        'cityId': p.cityId,
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
        'poolsideInterest': p.poolsideInterest,
        'adventureInterest': p.adventureInterest,
        'cultureInterest': p.cultureInterest,
        'discoveryStyle': p.discoveryStyle.name,
        'tripFeel': p.tripFeel,
        'tripName': p.tripName,
        'useAutoTripName': p.useAutoTripName,
        'moods': p.moods.map((m) => m.name).toList(),
        'occasion': p.occasion.name,
      };

  TripProfile _decode(Map<String, dynamic> m) {
    final relaxAdventure = m['relaxationVsAdventure'] as int? ?? 50;
    return TripProfile(
      cityId: m['cityId'] as String? ?? 'orlando',
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
      relaxationVsAdventure: relaxAdventure,
      foodieInterest: m['foodieInterest'] as int? ?? 70,
      // Back-compat: profiles saved before the split derive their poolside /
      // adventure dials from the old single relax↔adventure axis.
      poolsideInterest: m['poolsideInterest'] as int? ?? (100 - relaxAdventure),
      adventureInterest: m['adventureInterest'] as int? ?? relaxAdventure,
      cultureInterest: m['cultureInterest'] as int? ?? 40,
      discoveryStyle: DiscoveryStyle.values
          .byName(m['discoveryStyle'] as String? ?? 'balanced'),
      tripFeel: m['tripFeel'] as String? ?? '',
      tripName: m['tripName'] as String? ?? '',
      useAutoTripName: m['useAutoTripName'] as bool? ?? true,
      moods: (m['moods'] as List<dynamic>? ?? [])
          .map((e) => TripMood.values.byName(e as String))
          .toList(),
      occasion: TripOccasion.values
          .byName(m['occasion'] as String? ?? 'general'),
    );
  }
}

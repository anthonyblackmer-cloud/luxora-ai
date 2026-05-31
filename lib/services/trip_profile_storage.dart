import 'dart:convert';

import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
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
        'travelerName': p.travelerName,
        'useAutoTripName': p.useAutoTripName,
        'moods': p.moods.map((m) => m.name).toList(),
        'occasion': p.occasion.name,
        'travelerType': p.travelerType.name,
        'childrenTypes': p.childrenTypes
            .where((t) => t != ChildrenType.none)
            .map((e) => e.name)
            .toList(),
        'tripStyles': p.tripStyles.map((e) => e.name).toList(),
        'hotelTypePreferences':
            p.hotelTypePreferences.map((e) => e.name).toList(),
        'hotelBudgetLevel': p.hotelBudgetLevel.name,
        'hotelAmenities': p.hotelAmenities.map((e) => e.name).toList(),
        'cuisinePreferences': p.cuisinePreferences.map((e) => e.name).toList(),
        'diningPreferences': p.diningPreferences.map((e) => e.name).toList(),
        'vacationGoals': p.vacationGoals.map((e) => e.name).toList(),
        'experiencePreferences':
            p.experiencePreferences.map((e) => e.name).toList(),
        'avoidPreferences': p.avoidPreferences.map((e) => e.name).toList(),
        'desiredTripEmotion': p.desiredTripEmotion.name,
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
      poolsideInterest: m['poolsideInterest'] as int? ?? (100 - relaxAdventure),
      adventureInterest: m['adventureInterest'] as int? ?? relaxAdventure,
      cultureInterest: m['cultureInterest'] as int? ?? 40,
      discoveryStyle: DiscoveryStyle.values
          .byName(m['discoveryStyle'] as String? ?? 'balanced'),
      tripFeel: m['tripFeel'] as String? ?? '',
      tripName: m['tripName'] as String? ?? '',
      travelerName: m['travelerName'] as String? ?? '',
      useAutoTripName: m['useAutoTripName'] as bool? ?? true,
      moods: (m['moods'] as List<dynamic>? ?? [])
          .map((e) => TripMood.values.byName(e as String))
          .toList(),
      occasion: TripOccasion.values
          .byName(m['occasion'] as String? ?? 'general'),
      travelerType: TravelerType.values
          .byName(m['travelerType'] as String? ?? 'couple'),
      childrenTypes: _decodeChildrenTypes(m),
      tripStyles: parseEnumList(m['tripStyles'] as List?, TripStyle.values),
      hotelTypePreferences: parseEnumList(
        m['hotelTypePreferences'] as List?,
        HotelTypePreference.values,
      ),
      hotelBudgetLevel: HotelBudgetLevel.values.byName(
        m['hotelBudgetLevel'] as String? ?? 'two',
      ),
      hotelAmenities: parseEnumList(
        m['hotelAmenities'] as List?,
        HotelAmenity.values,
      ),
      cuisinePreferences: parseEnumList(
        m['cuisinePreferences'] as List?,
        CuisinePreference.values,
      ),
      diningPreferences: parseEnumList(
        m['diningPreferences'] as List?,
        DiningPreference.values,
      ),
      vacationGoals: parseEnumList(
        m['vacationGoals'] as List?,
        VacationGoal.values,
      ),
      experiencePreferences: parseEnumList(
        m['experiencePreferences'] as List?,
        ExperiencePreference.values,
      ),
      avoidPreferences: parseEnumList(
        m['avoidPreferences'] as List?,
        AvoidPreference.values,
      ),
      desiredTripEmotion: DesiredTripEmotion.values.byName(
        m['desiredTripEmotion'] as String? ?? 'memorable',
      ),
    );
  }

  static List<ChildrenType> _decodeChildrenTypes(Map<String, dynamic> m) {
    final fromList = parseEnumList(
      m['childrenTypes'] as List?,
      ChildrenType.values,
    ).where((t) => t != ChildrenType.none).toList();
    if (fromList.isNotEmpty) return fromList;

    final legacy = m['childrenType'] as String?;
    if (legacy == null || legacy == 'none') return const [];
    return [
      ChildrenType.values.byName(legacy),
    ];
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _key = 'luxora_active_trip_plans_v1';

/// User-built itinerary from Concierge / Day Flow — one plan per city pack.
class ActiveTripPlanStore extends ChangeNotifier {
  ActiveTripPlanStore._();

  static final ActiveTripPlanStore instance = ActiveTripPlanStore._();

  final Map<String, TripPlan> _plans = {};
  bool _loaded = false;

  TripPlan? planFor(String cityId) => _plans[cityId];

  Future<void> load() async {
    if (_loaded) return;
    _loaded = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_key);
      if (raw == null) return;
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      for (final entry in decoded.entries) {
        _plans[entry.key] = _decodePlan(entry.value as Map<String, dynamic>);
      }
    } catch (_) {}
  }

  Future<void> save(TripPlan plan, {required String cityId}) async {
    await load();
    _plans[cityId] = plan;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      final encoded = jsonEncode({
        for (final e in _plans.entries) e.key: _encodePlan(e.value),
      });
      await prefs.setString(_key, encoded);
    } catch (_) {}
  }

  Map<String, dynamic> _encodePlan(TripPlan plan) => {
        'id': plan.id,
        'title': plan.title,
        'days': plan.days
            .map(
              (d) => {
                'dayNumber': d.dayNumber,
                'label': d.label,
                'items': d.items
                    .map(
                      (i) => {
                        'id': i.id,
                        'time': i.time,
                        'title': i.title,
                        'emotionalLine': i.emotionalLine,
                        'location': i.location,
                        'category': i.category,
                        'placeId': i.placeId,
                        if (i.ticketDealId != null) 'ticketDealId': i.ticketDealId,
                      },
                    )
                    .toList(),
              },
            )
            .toList(),
      };

  TripPlan _decodePlan(Map<String, dynamic> json) {
    final daysRaw = json['days'] as List<dynamic>? ?? const [];
    return TripPlan(
      id: json['id'] as String? ?? 'custom-plan',
      title: json['title'] as String? ?? 'Your trip',
      days: daysRaw.map((dayJson) {
        final day = dayJson as Map<String, dynamic>;
        final itemsRaw = day['items'] as List<dynamic>? ?? const [];
        return TripDay(
          dayNumber: day['dayNumber'] as int? ?? 1,
          label: day['label'] as String? ?? 'Day 1',
          items: itemsRaw.map((itemJson) {
            final item = itemJson as Map<String, dynamic>;
            return TripItem(
              id: item['id'] as String? ?? 'item',
              time: item['time'] as String? ?? '9:00 AM',
              title: item['title'] as String? ?? '',
              emotionalLine: item['emotionalLine'] as String? ?? '',
              location: item['location'] as String? ?? '',
              category: item['category'] as String? ?? '',
              placeId: item['placeId'] as String?,
              ticketDealId: item['ticketDealId'] as String?,
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}

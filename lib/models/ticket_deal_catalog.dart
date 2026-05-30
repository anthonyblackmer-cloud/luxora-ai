import 'package:luxora_ai/models/ticket_deal.dart';

/// Remote or bundled ticket-deals payload — one file per city.
class TicketDealCatalogBundle {
  const TicketDealCatalogBundle({
    required this.version,
    required this.cityId,
    required this.updatedAt,
    required this.deals,
  });

  final int version;
  final String cityId;
  final DateTime updatedAt;
  final List<TicketDeal> deals;

  Map<String, dynamic> toJson() => {
        'version': version,
        'cityId': cityId,
        'updatedAt': updatedAt.toUtc().toIso8601String(),
        'deals': deals.map(TicketDealJson.toMap).toList(),
      };

  static TicketDealCatalogBundle fromJson(Map<String, dynamic> json) {
    final dealsRaw = json['deals'] as List<dynamic>? ?? [];
    return TicketDealCatalogBundle(
      version: json['version'] as int? ?? 1,
      cityId: json['cityId'] as String? ?? 'orlando',
      updatedAt: DateTime.tryParse(json['updatedAt'] as String? ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
      deals: [
        for (final item in dealsRaw)
          if (item is Map<String, dynamic>)
            TicketDealJson.fromMap(item),
      ],
    );
  }
}

/// JSON encoding for [TicketDeal] — sponsorship resolved at runtime via registry.
abstract final class TicketDealJson {
  static Map<String, dynamic> toMap(TicketDeal deal) {
    final daysUntilExpiry = deal.expiresAt.difference(DateTime.now()).inDays;
    return {
      'id': deal.id,
      'title': deal.title,
      'category': deal.category.name,
      'officialPriceUsd': deal.officialPriceUsd,
      'discountPriceUsd': deal.discountPriceUsd,
      'sourceName': deal.sourceName,
      if (daysUntilExpiry >= 0) 'expiresInDays': daysUntilExpiry,
      'expiresAt': deal.expiresAt.toUtc().toIso8601String(),
      if (deal.placeId != null) 'placeId': deal.placeId,
      if (deal.unsplashPhotoId != null) 'unsplashPhotoId': deal.unsplashPhotoId,
      if (deal.discountPercent != null) 'discountPercent': deal.discountPercent,
      'familyFriendly': deal.familyFriendly,
      'luxury': deal.luxury,
      'popularityScore': deal.popularityScore,
      'milesFromOrlando': deal.milesFromOrlando,
      if (deal.itineraryTags.isNotEmpty) 'itineraryTags': deal.itineraryTags,
      if (deal.conciergeBestDay != null) 'conciergeBestDay': deal.conciergeBestDay,
      if (deal.conciergeCrowd != null) 'conciergeCrowd': deal.conciergeCrowd,
      if (deal.conciergeResidentNote != null)
        'conciergeResidentNote': deal.conciergeResidentNote,
      if (deal.bundleOpportunity != null)
        'bundleOpportunity': deal.bundleOpportunity,
      'confidence': deal.confidence.name,
      if (deal.sourceUrl != null) 'sourceUrl': deal.sourceUrl,
    };
  }

  static TicketDeal fromMap(Map<String, dynamic> map) {
    final expiresAt = _parseExpiresAt(map);
    return TicketDeal(
      id: map['id'] as String,
      title: map['title'] as String,
      category: TicketDealCategory.values.byName(map['category'] as String),
      officialPriceUsd: map['officialPriceUsd'] as int,
      discountPriceUsd: map['discountPriceUsd'] as int,
      sourceName: map['sourceName'] as String,
      expiresAt: expiresAt,
      placeId: map['placeId'] as String?,
      unsplashPhotoId: map['unsplashPhotoId'] as String?,
      discountPercent: map['discountPercent'] as int?,
      familyFriendly: map['familyFriendly'] as bool? ?? true,
      luxury: map['luxury'] as bool? ?? false,
      popularityScore: map['popularityScore'] as int? ?? 50,
      milesFromOrlando: (map['milesFromOrlando'] as num?)?.toDouble() ?? 15,
      itineraryTags: (map['itineraryTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      conciergeBestDay: map['conciergeBestDay'] as String?,
      conciergeCrowd: map['conciergeCrowd'] as String?,
      conciergeResidentNote: map['conciergeResidentNote'] as String?,
      bundleOpportunity: map['bundleOpportunity'] as String?,
      confidence: DealConfidence.values.byName(
        map['confidence'] as String? ?? 'verified',
      ),
      sourceUrl: map['sourceUrl'] as String?,
    );
  }

  static DateTime _parseExpiresAt(Map<String, dynamic> map) {
    final iso = map['expiresAt'] as String?;
    if (iso != null) {
      final parsed = DateTime.tryParse(iso);
      if (parsed != null) return parsed.toLocal();
    }
    final inDays = map['expiresInDays'] as int?;
    if (inDays != null) {
      return DateTime.now().add(Duration(days: inDays));
    }
    return DateTime.now().add(const Duration(days: 14));
  }
}

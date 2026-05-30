import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/hotel_intelligence_service.dart';
import 'package:luxora_ai/util/place_distance.dart';
import 'package:luxora_ai/util/share_hero_media.dart';
import 'package:luxora_ai/widgets/luxora_branded_share_card.dart';
import 'package:luxora_ai/widgets/luxora_share_section.dart';

Widget buildHotelShareCard(
  BuildContext context, {
  required LuxHotel hotel,
  required LuxPlace place,
  TripProfile? profile,
  DayFlow? flow,
  HotelMatchmakerInput? matchInput,
}) {
  final l = context.l10n;
  final reasons = HotelIntelligenceService.recommendationReasons(
    hotel: hotel,
    profile: profile,
    flow: flow,
    matchInput: matchInput,
  );
  final friction = HotelIntelligenceService.travelFrictionScore(hotel);
  final hubMiles = PlaceDistance.milesFromHub(place);
  final hubDrive = PlaceDistance.driveTimeFromHubLabel(place);

  final sections = <LuxoraShareSection>[
    LuxoraShareSection(body: hotel.emotionalDescription),
    LuxoraShareSection(
      heading: l.hotelScoreLuxury,
      lines: [
        '${l.hotelScoreLuxury}: ${hotel.luxuryScore}',
        '${l.hotelScoreFamily}: ${hotel.familyScore}',
        '${l.hotelScoreRomance}: ${hotel.romanceScore}',
        '${l.hotelScoreWalkability}: ${hotel.walkabilityScore}',
      ],
    ),
    LuxoraShareSection(
      heading: l.detailLocation,
      lines: [
        '${PlaceDistance.milesLabel(hubMiles)} · ${l.detailDriveFromActiveHub(hubDrive)}',
      ],
    ),
    if (hotel.attractionDistances.isNotEmpty)
      LuxoraShareSection(
        heading: l.hotelDistanceTitle,
        lines: [
          for (final e in hotel.attractionDistances.entries)
            '${e.key} · ${e.value}',
        ],
      ),
    if (reasons.isNotEmpty)
      LuxoraShareSection(
        heading: l.hotelWhyRecommendTitle,
        lines: [
          for (final reason in reasons)
            HotelIntelligenceService.reasonText(l, reason, hotel),
        ],
      ),
    LuxoraShareSection(
      heading: l.hotelItineraryImpactTitle,
      body: l.hotelItineraryImpactBody(
        HotelIntelligenceService.driveTimeImpactLabel(hotel),
        friction,
      ),
    ),
  ];

  return LuxoraBrandedShareCard(
    title: hotel.name,
    subtitle: hotel.neighborhood,
    header: ShareHeroMedia(
      place: place,
      overridePhotoId: hotel.unsplashPhotoId,
    ),
    chips: [
      for (final tag in hotel.bestForTags)
        HotelIntelligenceService.bestForTagLabel(l, tag),
    ],
    sections: sections,
  );
}

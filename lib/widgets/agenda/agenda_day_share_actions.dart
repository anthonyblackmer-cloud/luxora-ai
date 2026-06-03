import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/util/trip_day_share_content.dart';
import 'package:luxora_ai/widgets/visual_share_icon_button.dart';
import 'package:share_plus/share_plus.dart';

/// Text + image share for the selected agenda day itinerary.
class AgendaDayShareActions extends StatelessWidget {
  const AgendaDayShareActions({
    super.key,
    required this.plan,
    required this.day,
  });

  final TripPlan plan;
  final TripDay day;

  Future<void> _shareText(BuildContext context) async {
    await SharePlus.instance.share(
      ShareParams(
        text: tripDayShareText(context, plan, day),
        subject: tripDayShareSubject(context, plan, day),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    return Wrap(
      spacing: 4,
      runSpacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        TextButton.icon(
          onPressed: () => _shareText(context),
          icon: const Icon(Icons.ios_share_rounded, size: 18),
          label: Text(l.tripsShare),
          style: TextButton.styleFrom(
            foregroundColor: LuxColors.gold,
          ),
        ),
        VisualShareIconButton(
          subject: tripDayShareSubject(context, plan, day),
          fileName: 'luxora_day_itinerary.png',
          shareWidth: 420,
          color: LuxColors.gold,
          background: LuxColors.gold.withValues(alpha: 0.12),
          cardBuilder: (ctx) => buildTripDayShareCard(ctx, plan, day),
        ),
      ],
    );
  }
}

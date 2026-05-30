import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/luxora_visual_share.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/luxora_branded_share_card.dart';

/// Renders a cinematic itinerary card and shares it as a PNG.
class VisualItineraryShareCard extends StatefulWidget {
  const VisualItineraryShareCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.lines,
  });

  final String title;
  final String subtitle;
  final List<String> lines;

  @override
  State<VisualItineraryShareCard> createState() =>
      _VisualItineraryShareCardState();
}

class _VisualItineraryShareCardState extends State<VisualItineraryShareCard> {
  final _cardKey = GlobalKey();

  Future<void> _shareImage() async {
    await LuxoraVisualShare.shareFromKey(
      context,
      key: _cardKey,
      subject: widget.title,
      fileName: 'luxora_trip.png',
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RepaintBoundary(
          key: _cardKey,
          child: LuxoraBrandedShareCard(
            title: widget.title,
            subtitle: widget.subtitle,
            lines: widget.lines,
          ),
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: _shareImage,
          icon: const Icon(Icons.image_rounded, size: 18),
          label: Text(l.visualShareImageButton),
          style: OutlinedButton.styleFrom(
            foregroundColor: LuxColors.gold,
            side: BorderSide(color: LuxColors.gold.withValues(alpha: 0.45)),
          ),
        ),
      ],
    );
  }
}

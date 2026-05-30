import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:share_plus/share_plus.dart';

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
    final boundary = _cardKey.currentContext?.findRenderObject()
        as RenderRepaintBoundary?;
    if (boundary == null) return;
    final image = await boundary.toImage(pixelRatio: 3);
    final bytes =
        await image.toByteData(format: ui.ImageByteFormat.png);
    if (bytes == null || !mounted) return;
    final png = Uint8List.view(bytes.buffer);
    final l = context.l10n;
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile.fromData(png, mimeType: 'image/png', name: 'luxora_trip.png')],
        text: widget.title,
        subject: l.shareSubject(widget.title),
      ),
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
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF1C1917), Color(0xFF0C0A09), Color(0xFF292524)],
              ),
              border: Border.all(color: LuxColors.gold.withValues(alpha: 0.35)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LUXORA',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 3,
                    color: LuxColors.gold.withValues(alpha: 0.9),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: LuxColors.cream,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  widget.subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: LuxColors.stone400,
                  ),
                ),
                const SizedBox(height: 16),
                for (final line in widget.lines)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('✦ ', style: TextStyle(color: LuxColors.gold)),
                        Expanded(
                          child: Text(
                            line,
                            style: const TextStyle(
                              fontSize: 13,
                              height: 1.35,
                              color: LuxColors.cream,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
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

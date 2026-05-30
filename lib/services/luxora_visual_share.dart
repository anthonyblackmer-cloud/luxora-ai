import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:share_plus/share_plus.dart';

/// Captures a widget off-screen and shares it as a branded PNG card.
abstract final class LuxoraVisualShare {
  static Future<void> shareWidget(
    BuildContext context, {
    required Widget child,
    required String subject,
    String fileName = 'luxora_share.png',
    double width = 400,
    bool loadNetworkAssets = false,
    List<String> precacheNetworkUrls = const [],
  }) async {
    final key = GlobalKey();
    final overlay = OverlayEntry(
      builder: (ctx) => Positioned(
        left: -8000,
        top: 0,
        width: width,
        child: Material(
          color: Colors.transparent,
          child: RepaintBoundary(key: key, child: child),
        ),
      ),
    );

    final overlayState = Overlay.of(context, rootOverlay: true);
    overlayState.insert(overlay);
    try {
      for (final url in precacheNetworkUrls) {
        if (url.isEmpty) continue;
        try {
          await precacheImage(NetworkImage(url), context);
        } catch (_) {}
      }
      await WidgetsBinding.instance.endOfFrame;
      await Future<void>.delayed(
        Duration(milliseconds: loadNetworkAssets ? 1400 : 60),
      );

      final boundary =
          key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null || !context.mounted) return;

      final image = await boundary.toImage(pixelRatio: 3);
      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
      if (bytes == null || !context.mounted) return;

      final png = Uint8List.view(bytes.buffer);
      final l = context.l10n;
      await SharePlus.instance.share(
        ShareParams(
          files: [
            XFile.fromData(png, mimeType: 'image/png', name: fileName),
          ],
          text: subject,
          subject: l.shareSubject(subject),
        ),
      );
    } finally {
      overlay.remove();
    }
  }

  static Future<void> shareFromKey(
    BuildContext context, {
    required GlobalKey key,
    required String subject,
    String fileName = 'luxora_share.png',
  }) async {
    final boundary =
        key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null || !context.mounted) return;

    final image = await boundary.toImage(pixelRatio: 3);
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    if (bytes == null || !context.mounted) return;

    final png = Uint8List.view(bytes.buffer);
    final l = context.l10n;
    await SharePlus.instance.share(
      ShareParams(
        files: [
          XFile.fromData(png, mimeType: 'image/png', name: fileName),
        ],
        text: subject,
        subject: l.shareSubject(subject),
      ),
    );
  }
}

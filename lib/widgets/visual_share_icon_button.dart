import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/luxora_visual_share.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Compact share control that renders a branded card off-screen and shares PNG.
class VisualShareIconButton extends StatelessWidget {
  const VisualShareIconButton({
    super.key,
    required this.subject,
    required this.cardBuilder,
    this.fileName = 'luxora_share.png',
    this.shareWidth = 400,
    this.loadNetworkAssets = false,
    this.precacheNetworkUrls = const [],
    this.iconSize = 20,
    this.color,
    this.background,
  });

  final String subject;
  final Widget Function(BuildContext context) cardBuilder;
  final String fileName;
  final double shareWidth;
  final bool loadNetworkAssets;
  final List<String> precacheNetworkUrls;
  final double iconSize;
  final Color? color;
  final Color? background;

  Future<void> _share(BuildContext context) async {
    await LuxoraVisualShare.shareWidget(
      context,
      subject: subject,
      fileName: fileName,
      width: shareWidth,
      loadNetworkAssets: loadNetworkAssets,
      precacheNetworkUrls: precacheNetworkUrls,
      child: cardBuilder(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final fg = color ?? LuxColors.cream;
    return Semantics(
      button: true,
      label: l.visualShareImageButton,
      child: Material(
        color: background ?? Colors.white.withValues(alpha: 0.06),
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => _share(context),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.ios_share_rounded,
              size: iconSize,
              color: fg,
            ),
          ),
        ),
      ),
    );
  }
}

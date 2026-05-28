import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/unsplash_photo.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:url_launcher/url_launcher.dart';

/// “Photo by [Photographer Name] on Unsplash” — required on every Unsplash image.
class UnsplashAttribution extends StatelessWidget {
  const UnsplashAttribution({
    super.key,
    required this.photo,
    this.compact = false,
    this.onDark = true,
  });

  final UnsplashPhoto photo;
  final bool compact;
  final bool onDark;

  @override
  Widget build(BuildContext context) {
    final linkColor = onDark
        ? LuxColors.cream.withValues(alpha: 0.95)
        : LuxColors.gold;
    final muted = onDark
        ? LuxColors.stone300.withValues(alpha: 0.9)
        : LuxColors.stone500;
    final style = TextStyle(
      fontSize: compact ? 10 : 11,
      height: 1.35,
      color: muted,
      fontWeight: FontWeight.w500,
    );
    final linkStyle = style.copyWith(
      color: linkColor,
      decoration: TextDecoration.underline,
      decorationColor: linkColor.withValues(alpha: 0.65),
    );

    return RichText(
      text: TextSpan(
        style: style,
        children: [
          TextSpan(text: '${context.l10n.photoBy} '),
          TextSpan(
            text: photo.photographerName,
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () => _open(photo.photographerProfileUrl),
          ),
          TextSpan(text: ' ${context.l10n.photoOn} '),
          TextSpan(
            text: 'Unsplash',
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () => _open(UnsplashPhoto.unsplashHomeUrl),
          ),
        ],
      ),
    );
  }

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:luxora_ai/theme/lux_breakpoints.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

class LuxButton extends StatelessWidget {
  const LuxButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.outline = false,
    this.fullWidth,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool outline;
  final bool? fullWidth;

  @override
  Widget build(BuildContext context) {
    final tokens = luxThemeTokensOf(context);
    final tablet = luxIsTablet(context);
    final expand = fullWidth ?? !tablet;
    final iconSize = tablet ? 16.0 : 18.0;
    final hPad = tablet ? 18.0 : 22.0;
    final vPad = tablet ? 10.0 : 14.0;
    final labelStyle = TextStyle(
      fontWeight: outline ? FontWeight.w700 : FontWeight.w800,
      fontSize: tablet ? 13 : null,
    );

    final Widget button;
    if (outline) {
      button = OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: tokens.accent,
          side: BorderSide(color: tokens.accent.withValues(alpha: 0.45)),
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const StadiumBorder(),
        ),
        icon: Icon(icon ?? Icons.arrow_forward_rounded, size: iconSize),
        label: Text(label, style: labelStyle),
      );
    } else {
      button = FilledButton.icon(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: tokens.accent,
          foregroundColor: tokens.bg,
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
          elevation: tablet ? 4 : 8,
          shadowColor: tokens.glow.withValues(alpha: 0.7),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const StadiumBorder(),
        ),
        icon: Icon(icon ?? Icons.arrow_forward_rounded, size: iconSize),
        label: Text(label, style: labelStyle),
      );
    }

    if (expand) {
      return SizedBox(width: double.infinity, child: button);
    }
    return Align(alignment: Alignment.centerLeft, child: button);
  }
}

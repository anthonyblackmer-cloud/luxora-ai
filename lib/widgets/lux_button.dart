import 'package:flutter/material.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

class LuxButton extends StatelessWidget {
  const LuxButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.outline = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool outline;

  @override
  Widget build(BuildContext context) {
    if (outline) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: LuxColors.gold,
          side: BorderSide(color: LuxColors.gold.withValues(alpha: 0.45)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: const StadiumBorder(),
        ),
        icon: Icon(icon ?? Icons.arrow_forward_rounded, size: 18),
        label: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
      );
    }

    return FilledButton.icon(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: LuxColors.gold,
        foregroundColor: LuxColors.bg,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        elevation: 8,
        shadowColor: LuxColors.gold.withValues(alpha: 0.45),
        shape: const StadiumBorder(),
      ),
      icon: Icon(icon ?? Icons.arrow_forward_rounded, size: 18),
      label: Text(label, style: const TextStyle(fontWeight: FontWeight.w800)),
    );
  }
}

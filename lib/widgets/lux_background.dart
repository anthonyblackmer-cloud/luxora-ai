import 'package:flutter/material.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

class LuxBackground extends StatelessWidget {
  const LuxBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1C1917), LuxColors.bg, LuxColors.bg],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -80,
            left: -40,
            child: _orb(LuxColors.gold.withValues(alpha: 0.18), 200),
          ),
          Positioned(
            top: 120,
            right: -60,
            child: _orb(LuxColors.sunset.withValues(alpha: 0.12), 160),
          ),
          Positioned(
            bottom: 80,
            left: -30,
            child: _orb(LuxColors.ocean.withValues(alpha: 0.1), 140),
          ),
          child,
        ],
      ),
    );
  }

  Widget _orb(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [BoxShadow(color: color, blurRadius: 80, spreadRadius: 20)],
      ),
    );
  }
}

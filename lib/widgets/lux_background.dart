import 'package:flutter/material.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

class LuxBackground extends StatelessWidget {
  const LuxBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final tokens = luxThemeTokensOf(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [tokens.bgSecondary, tokens.bg, tokens.bg],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -80,
            left: -40,
            child: _orb(tokens.accent.withValues(alpha: 0.2), 200),
          ),
          Positioned(
            top: 120,
            right: -60,
            child: _orb(tokens.orbSecondary, 160),
          ),
          Positioned(
            bottom: 80,
            left: -30,
            child: _orb(tokens.orbTertiary, 140),
          ),
          Material(
            color: Colors.transparent,
            child: child,
          ),
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

import 'package:flutter/material.dart';

/// Staggered fade + slide reveal for cinematic paywall sections.
class PaywallReveal extends StatefulWidget {
  const PaywallReveal({
    super.key,
    required this.index,
    required this.child,
    this.delayPerIndex = const Duration(milliseconds: 90),
    this.duration = const Duration(milliseconds: 650),
    this.offsetY = 24,
  });

  final int index;
  final Widget child;
  final Duration delayPerIndex;
  final Duration duration;
  final double offsetY;

  @override
  State<PaywallReveal> createState() => _PaywallRevealState();
}

class _PaywallRevealState extends State<PaywallReveal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _slide = Tween<Offset>(
      begin: Offset(0, widget.offsetY / 400),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    Future<void>.delayed(
      Duration(milliseconds: 120 + widget.index * widget.delayPerIndex.inMilliseconds),
      () {
        if (mounted) _controller.forward();
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(position: _slide, child: widget.child),
    );
  }
}

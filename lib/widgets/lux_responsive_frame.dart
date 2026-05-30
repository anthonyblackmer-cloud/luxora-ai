import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:luxora_ai/theme/lux_breakpoints.dart';

/// Keeps primary tab content phone-width on tablet without breaking shell taps.
///
/// Uses symmetric horizontal inset + full height — not [Center]/[Align], which
/// can shrink the navigation shell and misalign hit targets on iPad.
class LuxResponsiveFrame extends StatelessWidget {
  const LuxResponsiveFrame({
    super.key,
    required this.child,
    this.fullBleed = false,
  });

  final Widget child;
  final bool fullBleed;

  @override
  Widget build(BuildContext context) {
    if (fullBleed || !luxIsTablet(context)) {
      return child;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxContentWidth = luxContentMaxWidth(context)
            .clamp(0.0, constraints.maxWidth)
            .toDouble();
        final sideInset =
            math.max(0.0, (constraints.maxWidth - maxContentWidth) / 2);

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: sideInset),
          child: SizedBox(
            width: constraints.maxWidth - sideInset * 2,
            height: constraints.maxHeight,
            child: child,
          ),
        );
      },
    );
  }
}

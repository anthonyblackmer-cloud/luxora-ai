import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Clamps negative [MediaQueryData.viewInsets] on web (engine can assert during
/// keyboard dismiss if the browser reports a bad visual viewport).
Widget webViewportGuard(BuildContext context, Widget? child) {
  if (child == null) {
    return const SizedBox.shrink();
  }
  if (!kIsWeb) {
    return child;
  }

  final mq = MediaQuery.of(context);
  final insets = mq.viewInsets;
  final hasNegative = insets.left < 0 ||
      insets.top < 0 ||
      insets.right < 0 ||
      insets.bottom < 0;
  if (!hasNegative) {
    return child;
  }

  return MediaQuery(
    data: mq.copyWith(
      viewInsets: EdgeInsets.only(
        left: insets.left < 0 ? 0 : insets.left,
        top: insets.top < 0 ? 0 : insets.top,
        right: insets.right < 0 ? 0 : insets.right,
        bottom: insets.bottom < 0 ? 0 : insets.bottom,
      ),
    ),
    child: child,
  );
}

/// Safe bottom inset for manual padding (web keyboard quirks).
double webSafeViewInsetBottom(BuildContext context) {
  return MediaQuery.viewInsetsOf(context).bottom.clamp(0.0, double.infinity);
}

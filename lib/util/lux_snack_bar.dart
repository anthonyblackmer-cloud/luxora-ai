import 'package:flutter/material.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Readable floating snack bars that sit above the bottom tab bar.
abstract final class LuxSnackBar {
  /// Space above [NavigationBar] so text is not hidden on the black tab strip.
  static const navClearance = 92.0;

  static void show(
    BuildContext context, {
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
    Duration duration = const Duration(seconds: 5),
    bool replaceExisting = true,
  }) {
    final messenger = ScaffoldMessenger.of(context);
    if (replaceExisting) {
      messenger.clearSnackBars();
    }

    final tokens = luxThemeTokensOf(context);
    final bottom = MediaQuery.paddingOf(context).bottom;

    messenger.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: tokens.textPrimary,
            fontWeight: FontWeight.w500,
            height: 1.35,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: tokens.isLight
            ? tokens.surface
            : const Color(0xFF292524),
        elevation: 10,
        duration: duration,
        showCloseIcon: true,
        closeIconColor: tokens.accent,
        margin: EdgeInsets.fromLTRB(16, 0, 16, bottom + navClearance),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(
            color: tokens.accent.withValues(alpha: 0.35),
          ),
        ),
        action: actionLabel != null && onAction != null
            ? SnackBarAction(
                label: actionLabel,
                onPressed: onAction,
                textColor: tokens.accent,
              )
            : null,
      ),
    );
  }

  static void dismissAll(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
  }
}

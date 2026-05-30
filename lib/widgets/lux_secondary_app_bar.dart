import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Back navigation for full-screen routes opened from the More hub.
class LuxSecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LuxSecondaryAppBar({
    super.key,
    required this.title,
    this.fallbackRoute = '/more',
  });

  final String title;
  final String fallbackRoute;

  static void pop(BuildContext context, {String fallbackRoute = '/more'}) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(fallbackRoute);
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    return AppBar(
      backgroundColor: tokens.appBarScrim,
      surfaceTintColor: Colors.transparent,
      elevation: tokens.isLight ? 0.5 : 0,
      scrolledUnderElevation: tokens.isLight ? 1 : 0,
      automaticallyImplyLeading: false,
      foregroundColor: tokens.textPrimary,
      iconTheme: IconThemeData(color: tokens.textPrimary, size: 24),
      title: Text(
        title,
        style: TextStyle(
          color: tokens.textPrimary,
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        tooltip: l.commonClose,
        onPressed: () => pop(context, fallbackRoute: fallbackRoute),
      ),
    );
  }
}

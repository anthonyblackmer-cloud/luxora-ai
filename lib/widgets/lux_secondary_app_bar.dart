import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';

/// Back navigation for full-screen routes opened from the More hub.
class LuxSecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LuxSecondaryAppBar({
    super.key,
    required this.title,
    this.fallbackRoute = '/more',
  });

  final String title;
  final String fallbackRoute;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(title),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        tooltip: l.commonClose,
        onPressed: () {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go(fallbackRoute);
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/tampa_bay/tampa_bay_mood_route.dart';
import 'package:luxora_ai/services/tampa_bay_concierge_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Horizontal mood route picker — Tampa Bay pack only.
class TampaBayMoodRoutesPanel extends StatelessWidget {
  const TampaBayMoodRoutesPanel({
    super.key,
    this.onRouteSelected,
  });

  final void Function(TampaBayMoodRoute route)? onRouteSelected;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    final routes = TampaBayMoodRouteService.routesForActive();
    if (routes.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Text(
            l.tampaBayMoodRoutesTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: tokens.textPrimary,
            ),
          ),
        ),
        SizedBox(
          height: 132,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: routes.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, i) {
              final route = routes[i];
              return GestureDetector(
                onTap: () => onRouteSelected?.call(route),
                child: Container(
                  width: 220,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        tokens.accent.withValues(alpha: 0.14),
                        tokens.bgSecondary,
                      ],
                    ),
                    border: Border.all(
                      color: tokens.accent.withValues(alpha: 0.22),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        route.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: tokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        l.miamiMoodRouteStart(route.bestStartTime),
                        style: TextStyle(
                          fontSize: 12,
                          color: tokens.textMuted,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        route.moodTags.take(3).join(' · '),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          color: tokens.accent.withValues(alpha: 0.85),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

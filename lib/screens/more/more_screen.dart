import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/weather_concierge_launcher.dart';
import 'package:luxora_ai/settings/luxora_language_catalog.dart';
import 'package:luxora_ai/state/luxora_app_state.dart';
import 'package:luxora_ai/theme/lux_breakpoints.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/more/luxora_more_grid_tile.dart';
import 'package:luxora_ai/widgets/more_destination_picker.dart';
import 'package:luxora_ai/widgets/settings/luxora_language_picker_sheet.dart';
import 'package:luxora_ai/widgets/settings/luxora_settings_sheet.dart';

/// Secondary destinations — Discipline-style premium grid + grouped lists.
class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final theme = Theme.of(context);
    final tokens = luxThemeTokensOf(context);
    final appState = LuxoraAppState.of(context);
    final contentWidth = luxEffectiveContentWidth(context);
    final gridColumns = luxMoreGridCrossAxisCount(contentWidth - 40);
    final gridAspect = luxMoreGridChildAspectRatio(contentWidth - 40);
    final compactTiles = luxIsTablet(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0, 0.38, 0.72, 1.0],
          colors: [
            tokens.bg,
            Color.lerp(tokens.bg, tokens.accent, 0.04)!,
            Color.lerp(tokens.bg, tokens.accent, 0.02)!,
            tokens.bgSecondary.withValues(alpha: 0.94),
          ],
        ),
      ),
      child: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 12, 22, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l.morePageTitle,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.42,
                        height: 1.02,
                        color: tokens.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      l.morePageSubtitle,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: tokens.textMuted,
                        fontWeight: FontWeight.w600,
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 16, 22, 8),
                child: Text(
                  l.moreSectionTravelTools,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2.2,
                    color: tokens.accent.withValues(alpha: 0.85),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridColumns,
                  mainAxisSpacing: compactTiles ? 12 : 14,
                  crossAxisSpacing: compactTiles ? 12 : 14,
                  childAspectRatio: gridAspect,
                ),
                delegate: SliverChildListDelegate.fixed([
                  LuxoraMoreGridTile(
                    animationIndex: 0,
                    compact: compactTiles,
                    icon: Icons.hotel_rounded,
                    title: l.navStays,
                    subtitle: l.moreCardHotelsSub,
                    onTap: () => context.push('/stays'),
                  ),
                  LuxoraMoreGridTile(
                    animationIndex: 1,
                    compact: compactTiles,
                    icon: Icons.diamond_rounded,
                    title: l.navGems,
                    subtitle: l.moreCardGemsSub,
                    onTap: () => context.push('/gems'),
                  ),
                  LuxoraMoreGridTile(
                    animationIndex: 2,
                    compact: compactTiles,
                    icon: Icons.confirmation_number_rounded,
                    title: l.ticketSavingsTitle,
                    subtitle: l.moreCardTicketsSub,
                    onTap: () => context.push('/ticket-savings'),
                  ),
                  LuxoraMoreGridTile(
                    animationIndex: 3,
                    compact: compactTiles,
                    icon: Icons.wb_sunny_rounded,
                    title: l.weatherConciergeTitle,
                    subtitle: l.moreCardWeatherSub,
                    onTap: () => WeatherConciergeLauncher.open(context),
                  ),
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 28, 22, 10),
                child: Text(
                  l.moreSectionAccount,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2.2,
                    color: tokens.accent.withValues(alpha: 0.85),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: MoreDestinationPicker()),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              sliver: SliverList(
                delegate: SliverChildListDelegate.fixed([
                  LuxoraMoreListTile(
                    compact: compactTiles,
                    icon: Icons.person_outline_rounded,
                    title: l.moreCardProfileTitle,
                    subtitle: l.moreCardProfileSub,
                    onTap: () => context.push('/onboarding'),
                  ),
                  const SizedBox(height: 10),
                  LuxoraMoreListTile(
                    compact: compactTiles,
                    icon: Icons.favorite_border_rounded,
                    title: l.savedFavoritesTitle,
                    subtitle: l.moreCardFavoritesSub,
                    onTap: () => context.push('/saved-favorites'),
                  ),
                  const SizedBox(height: 10),
                  LuxoraMoreListTile(
                    compact: compactTiles,
                    icon: Icons.notifications_none_rounded,
                    title: l.moreCardNotificationsTitle,
                    subtitle: l.moreCardNotificationsSub,
                    onTap: () => _showNotifications(context),
                  ),
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 28, 22, 10),
                child: Text(
                  l.moreSectionApp,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2.2,
                    color: tokens.accent.withValues(alpha: 0.85),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              sliver: SliverList(
                delegate: SliverChildListDelegate.fixed([
                  LuxoraMoreListTile(
                    compact: compactTiles,
                    icon: Icons.grid_view_rounded,
                    title: l.settings,
                    subtitle: l.moreCardSettingsSub,
                    onTap: () => LuxoraSettingsSheet.show(context),
                  ),
                  const SizedBox(height: 10),
                  LuxoraMoreListTile(
                    compact: compactTiles,
                    icon: Icons.language_rounded,
                    title: l.language,
                    subtitle: LuxoraLanguageCatalog.displayName(appState.locale),
                    onTap: () => LuxoraLanguagePickerSheet.show(context),
                  ),
                  const SizedBox(height: 10),
                  LuxoraMoreListTile(
                    compact: compactTiles,
                    icon: Icons.auto_stories_outlined,
                    title: l.storyTitle,
                    subtitle: l.moreCardAboutSub,
                    onTap: () => context.push('/story'),
                  ),
                  const SizedBox(height: 10),
                  LuxoraMoreListTile(
                    compact: compactTiles,
                    icon: Icons.help_outline_rounded,
                    title: l.helpCenterTitle,
                    subtitle: l.moreCardHelpSub,
                    onTap: () => _showHelp(context),
                  ),
                  const SizedBox(height: 10),
                  LuxoraMoreListTile(
                    compact: compactTiles,
                    icon: Icons.handshake_outlined,
                    title: l.partnerOffersTitle,
                    subtitle: l.moreCardPartnersSub,
                    onTap: () => context.push('/partner-offers'),
                  ),
                  const SizedBox(height: 10),
                  LuxoraMoreListTile(
                    compact: compactTiles,
                    icon: Icons.view_timeline_rounded,
                    title: l.navTimeline,
                    subtitle: l.moreCardItinerarySub,
                    onTap: () => context.push('/itinerary'),
                  ),
                ]),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }

  void _showNotifications(BuildContext context) {
    final tokens = luxThemeTokensOf(context);
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: luxThemeTokensOf(ctx).bgSecondary,
        title: Text(
          context.l10n.moreCardNotificationsTitle,
          style: TextStyle(color: tokens.textPrimary),
        ),
        content: Text(
          context.l10n.notificationsComingSoon,
          style: TextStyle(color: tokens.textMuted),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(context.l10n.commonClose),
          ),
        ],
      ),
    );
  }

  void _showHelp(BuildContext context) {
    final tokens = luxThemeTokensOf(context);
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: luxThemeTokensOf(ctx).bgSecondary,
        title: Text(
          context.l10n.helpCenterTitle,
          style: TextStyle(color: tokens.textPrimary),
        ),
        content: Text(
          context.l10n.helpCenterBody,
          style: TextStyle(color: tokens.textMuted, height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(context.l10n.commonClose),
          ),
        ],
      ),
    );
  }
}

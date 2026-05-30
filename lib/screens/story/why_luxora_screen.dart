import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_background.dart';
import 'package:luxora_ai/widgets/lux_button.dart';

class WhyLuxoraScreen extends StatelessWidget {
  const WhyLuxoraScreen({super.key});
  static const _founderImageAsset = 'assets/images/founder.png';

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final titleStyle = Theme.of(context).textTheme.headlineSmall;

    return LuxBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/');
              }
            },
          ),
          title: Text(
            l.storyTitle,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: LuxColors.stone300.withValues(alpha: 0.95),
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
          children: [
            _FounderHero(),
            const SizedBox(height: 28),
            Text(
              l.storyHeading,
              style: titleStyle?.copyWith(fontSize: 26),
            ),
            const SizedBox(height: 12),
            _BodyText(l.storyProblemLead),
            const SizedBox(height: 20),
            _SectionTitle(l.storyJumpingBetween),
            const SizedBox(height: 10),
            ..._fragmentedSources(l).map((t) => _Bullet(t)),
            const SizedBox(height: 8),
            _BodyText(l.storyProblemTail),
            const SizedBox(height: 24),
            const _GoldDivider(),
            const SizedBox(height: 24),
            _BodyText(l.storyDifferentLead),
            const SizedBox(height: 8),
            GlassCard(
              glow: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l.storyNotPlannerTitle,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: LuxColors.gold.withValues(alpha: 0.9),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    l.storyNotPlannerBody,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _ContrastRow(
              insteadOf: l.storyInsteadQuestion,
              weAsk: l.storyFeelQuestion,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _moodExamples(l)
                  .map(
                    (m) => Chip(
                      label: Text(m),
                      backgroundColor: LuxColors.gold.withValues(alpha: 0.12),
                      side: BorderSide(
                        color: LuxColors.gold.withValues(alpha: 0.35),
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: LuxColors.cream,
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 12),
            _BodyText(l.storyMoodBuildLine),
            const SizedBox(height: 24),
            const _GoldDivider(),
            const SizedBox(height: 24),
            _SectionTitle(l.storyFloridaFirstTitle),
            const SizedBox(height: 8),
            _BodyText(l.storyFloridaFirstLead),
            const SizedBox(height: 10),
            ..._orlandoWhyBullets(l).map((t) => _Bullet(t)),
            const SizedBox(height: 24),
            const _GoldDivider(),
            const SizedBox(height: 24),
            _SectionTitle(l.storyVisionTitle),
            const SizedBox(height: 8),
            _BodyText(l.storyVisionLead),
            const SizedBox(height: 10),
            ..._visionPillars(l).map((t) => _Bullet(t)),
            const SizedBox(height: 16),
            GlassCard(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.auto_awesome_rounded,
                    color: LuxColors.gold.withValues(alpha: 0.9),
                    size: 22,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      l.storyVisionCard,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.45,
                        color: LuxColors.stone300.withValues(alpha: 0.98),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const _GoldDivider(),
            const SizedBox(height: 24),
            _SectionTitle(l.storyLongTermTitle),
            const SizedBox(height: 10),
            ..._longTermOpportunity(l).map((t) => _Bullet(t)),
            const SizedBox(height: 32),
            LuxButton(
              label: l.landingBegin,
              icon: Icons.arrow_forward_rounded,
              onPressed: () => context.push('/onboarding'),
            ),
            const SizedBox(height: 12),
            LuxButton(
              label: l.landingTalk,
              outline: true,
              icon: Icons.chat_bubble_rounded,
              onPressed: () => context.go('/discover'),
            ),
          ],
        ),
      ),
    );
  }
}

class _FounderHero extends StatelessWidget {
  const _FounderHero();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 4 / 5,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              WhyLuxoraScreen._founderImageAsset,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              errorBuilder: (_, _, _) => Container(
                color: const Color(0xFF1C1917),
                child: const Center(
                  child: Icon(Icons.person_rounded, size: 64, color: LuxColors.stone500),
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.15),
                    Colors.black.withValues(alpha: 0.05),
                    Colors.black.withValues(alpha: 0.75),
                  ],
                  stops: const [0.0, 0.45, 1.0],
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l.storyHeroBadge,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.5,
                      color: LuxColors.gold.withValues(alpha: 0.9),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    l.storyHeroCreator,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l.storyHeroSubtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: LuxColors.stone300.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 1.25,
      ),
    );
  }
}

class _BodyText extends StatelessWidget {
  const _BodyText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        height: 1.5,
        color: LuxColors.stone300,
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: LuxColors.gold.withValues(alpha: 0.85),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                height: 1.45,
                color: LuxColors.stone400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GoldDivider extends StatelessWidget {
  const _GoldDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: LuxColors.gold.withValues(alpha: 0.35),
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '◆',
            style: TextStyle(
              fontSize: 10,
              color: LuxColors.gold.withValues(alpha: 0.6),
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: LuxColors.gold.withValues(alpha: 0.35),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

class _ContrastRow extends StatelessWidget {
  const _ContrastRow({
    required this.insteadOf,
    required this.weAsk,
  });

  final String insteadOf;
  final String weAsk;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l.storyInsteadOfAsking,
          style: TextStyle(fontSize: 12, color: LuxColors.stone500),
        ),
        const SizedBox(height: 4),
        Text(
          insteadOf,
          style: TextStyle(
            fontSize: 15,
            fontStyle: FontStyle.italic,
            color: LuxColors.stone500.withValues(alpha: 0.9),
            decoration: TextDecoration.lineThrough,
            decorationColor: LuxColors.stone500.withValues(alpha: 0.5),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          l.storyAppAsks,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: LuxColors.gold.withValues(alpha: 0.85),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          weAsk,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 1.3,
            color: LuxColors.cream,
          ),
        ),
      ],
    );
  }
}

List<String> _fragmentedSources(AppLocalizations l) => [
      l.storySourceGoogleMaps,
      l.storySourceTikTok,
      l.storySourceInstagram,
      l.storySourceTravelBlogs,
      l.storySourceRestaurantApps,
      l.storySourceWeatherApps,
      l.storySourceTicketSites,
      l.storySourceTop10,
    ];

List<String> _moodExamples(AppLocalizations l) => [
      l.conciergePromptRomantic,
      l.conciergePromptWellness,
      l.conciergePromptFamily,
      l.conciergePromptHiddenLuxury,
      l.styleLessCrowded,
      l.styleSlowMornings,
      l.styleNatureHeavy,
    ];

List<String> _orlandoWhyBullets(AppLocalizations l) => [
      l.storyBulletMarket,
      l.storyBulletAudience,
      l.storyBulletOptions,
      l.storyBulletRepeat,
      l.storyBulletLogisticsGap,
    ];

List<String> _visionPillars(AppLocalizations l) => [
      l.storyPillarAiItinerary,
      l.storyPillarMoodPlanning,
      l.storyPillarLiveDiscovery,
      l.storyPillarHiddenGems,
      l.storyPillarRouting,
      l.storyPillarWeatherSunset,
      l.storyPillarPremiumUx,
    ];

List<String> _longTermOpportunity(AppLocalizations l) => [
      l.storyOpportunityMultilingual,
      l.storyOpportunityAffiliate,
      l.storyOpportunityInventory,
      l.storyOpportunitySubscriptions,
      l.storyOpportunityScale,
    ];

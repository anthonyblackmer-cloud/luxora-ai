import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/l10n/luxora_l10n_helpers.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/partner_sponsorship_service.dart';
import 'package:luxora_ai/services/paywall_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/attraction_detail_sheet.dart';
import 'package:luxora_ai/widgets/city_destination_picker.dart';
import 'package:luxora_ai/widgets/lux_background.dart';
import 'package:luxora_ai/widgets/lux_button.dart';
import 'package:luxora_ai/widgets/partner_sponsor_badge.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late String _cityId;

  @override
  void initState() {
    super.initState();
    _cityId = CityPackRegistry.instance.active.cityId;
  }

  Future<void> _enterApp() async {
    final unlocked = await PaywallService.showPaywall(context, cityId: _cityId);
    if (!mounted) return;
    if (unlocked) context.go('/discover');
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final display = Theme.of(context).textTheme.displayLarge;
    final tokens = luxThemeTokensOf(context);

    return LuxBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l.landingBadge,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3,
                          color: LuxColors.gold.withValues(alpha: 0.9),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              tokens.accent.withValues(alpha: 0.15),
                              tokens.bgSecondary.withValues(alpha: 0.08),
                            ],
                          ),
                          border: Border.all(
                            color: tokens.accent.withValues(alpha: 0.25),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l.landingTitle1,
                              style: display?.copyWith(
                                fontSize: 44,
                                color: tokens.textPrimary,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withValues(alpha: 0.5),
                                    blurRadius: 12,
                                  ),
                                ],
                              ),
                            ),
                            ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                colors: [
                                  tokens.textPrimary,
                                  tokens.accent,
                                  tokens.accentSecondary,
                                ],
                              ).createShader(bounds),
                              child: Text(
                                l.landingTitle2,
                                style: display?.copyWith(
                                  fontSize: 44,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        l.landingSubtitle,
                        style: TextStyle(
                          fontSize: 17,
                          height: 1.45,
                          color: LuxColors.stone300.withValues(alpha: 0.95),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CityDestinationPicker(
                        label: l.landingCityLabel,
                        selectedCityId: _cityId,
                        onChanged: (id) => setState(() => _cityId = id),
                      ),
                      const Spacer(),
                      LuxButton(
                        label: l.landingBegin,
                        icon: Icons.arrow_forward_rounded,
                        onPressed: () =>
                            context.push('/onboarding?city=$_cityId'),
                      ),
                      const SizedBox(height: 12),
                      LuxButton(
                        label: l.landingTalk,
                        outline: true,
                        icon: Icons.auto_awesome_rounded,
                        onPressed: _enterApp,
                      ),
                      const SizedBox(height: 12),
                      LuxButton(
                        label: l.landingWhy,
                        outline: true,
                        icon: Icons.favorite_outline_rounded,
                        onPressed: () => context.push('/story'),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Icon(Icons.auto_awesome,
                              size: 16,
                              color: LuxColors.gold.withValues(alpha: 0.8)),
                          const SizedBox(width: 8),
                          Text(
                            l.landingValues,
                            style:
                                TextStyle(fontSize: 12, color: LuxColors.stone500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l.landingRegionBadge,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.5,
                          color: LuxColors.gold.withValues(alpha: 0.75),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l.landingRegionTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      FeaturedPartnerSection(
                        title: l.featuredCityHomeTitle,
                        subtitle: l.featuredCityHomeSubtitle,
                        items: PartnerSponsorshipService.featuredForCityHome(),
                        onItemTap: (item) {
                          if (item.place == null) return;
                          showAttractionDetailSheet(context, place: item.place!);
                        },
                        onCtaTap: (item) =>
                            PartnerSponsorshipService.openSponsorCta(
                          item.sponsorship,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: floridaCategoriesL10n(l)
                            .map(
                              (c) => Chip(
                                label: Text(c),
                                backgroundColor:
                                    Colors.white.withValues(alpha: 0.06),
                                side: BorderSide(
                                  color: Colors.white.withValues(alpha: 0.1),
                                ),
                                labelStyle: const TextStyle(
                                  color: LuxColors.stone300,
                                  fontSize: 13,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/data/florida_experiences.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/lux_background.dart';
import 'package:luxora_ai/widgets/lux_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final display = Theme.of(context).textTheme.displayLarge;

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
                        'FLORIDA · ORLANDO MVP',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3,
                          color: LuxColors.gold.withValues(alpha: 0.9),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'The vacation',
                        style: display?.copyWith(fontSize: 44),
                      ),
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [LuxColors.cream, LuxColors.gold, LuxColors.sunset],
                        ).createShader(bounds),
                        child: Text(
                          'already started.',
                          style: display?.copyWith(
                            fontSize: 44,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Luxora AI is your emotionally intelligent concierge — '
                        'hidden gems, rooftop sunsets, and moments designed to feel '
                        'unforgettable before you even pack.',
                        style: TextStyle(
                          fontSize: 17,
                          height: 1.45,
                          color: LuxColors.stone300.withValues(alpha: 0.95),
                        ),
                      ),
                      const Spacer(),
                      LuxButton(
                        label: 'Begin your journey',
                        icon: Icons.arrow_forward_rounded,
                        onPressed: () => context.push('/onboarding'),
                      ),
                      const SizedBox(height: 12),
                      LuxButton(
                        label: 'Talk to Luxora',
                        outline: true,
                        icon: Icons.auto_awesome_rounded,
                        onPressed: () => context.go('/concierge'),
                      ),
                      const SizedBox(height: 12),
                      LuxButton(
                        label: 'Why we’re building this',
                        outline: true,
                        icon: Icons.favorite_outline_rounded,
                        onPressed: () => context.push('/story'),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Icon(Icons.auto_awesome,
                              size: 16, color: LuxColors.gold.withValues(alpha: 0.8)),
                          const SizedBox(width: 8),
                          Text(
                            'Memories · Emotion · Escape · Connection',
                            style: TextStyle(fontSize: 12, color: LuxColors.stone500),
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
                        'Launch region',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.5,
                          color: LuxColors.gold.withValues(alpha: 0.75),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Orlando & Florida — curated for feeling',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: floridaCategories
                            .map(
                              (c) => Chip(
                                label: Text(c),
                                backgroundColor: Colors.white.withValues(alpha: 0.06),
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

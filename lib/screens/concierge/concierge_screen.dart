import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/luxora_l10n_helpers.dart';
import 'package:luxora_ai/services/concierge_session_memory.dart';
import 'package:luxora_ai/services/trip_profile_storage.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/settings/luxora_settings_sheet.dart';

class ConciergeScreen extends StatefulWidget {
  const ConciergeScreen({super.key});

  @override
  State<ConciergeScreen> createState() => _ConciergeScreenState();
}

class _ConciergeScreenState extends State<ConciergeScreen> {
  final _messages = <({bool user, String text})>[];
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  final _memory = ConciergeSessionMemory();
  String? _tripFeel;
  List<String> _stylePrefs = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final profile = await TripProfileStorage().load();
    final prefs = await _memory.load();
    if (!mounted) return;
    final welcome = AppLocalizations.of(context).conciergeWelcome;
    setState(() {
      _tripFeel = profile?.tripFeel;
      _stylePrefs = prefs;
      _messages.add((user: false, text: welcome));
    });
  }

  Future<void> _addStylePref(String pref) async {
    await _memory.add(pref);
    final updated = await _memory.load();
    if (!mounted) return;
    setState(() => _stylePrefs = updated);
  }

  Future<void> _removeStylePref(String pref) async {
    await _memory.remove(pref);
    final updated = await _memory.load();
    if (!mounted) return;
    setState(() => _stylePrefs = updated);
  }

  void _dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (kIsWeb) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
  }

  void _send(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;
    _dismissKeyboard();
    final inferred = ConciergeSessionMemory.preferenceFromUserMessage(trimmed);
    if (inferred != null) {
      unawaited(_addStylePref(inferred));
    }
    setState(() {
      _messages.add((user: true, text: trimmed));
      _controller.clear();
    });
    _scrollToEnd();
    Future.delayed(const Duration(milliseconds: 550), () {
      if (!mounted) return;
      setState(() => _messages.add((user: false, text: _mockReply(trimmed))));
      _scrollToEnd();
    });
  }

  void _scrollToEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOut,
      );
    });
  }

  String _styleMemoryLine() {
    if (_stylePrefs.isEmpty) return '';
    return ' I’m honoring your style: ${_stylePrefs.join(' · ')}.';
  }

  String _mockReply(String prompt) {
    final lower = prompt.toLowerCase();
    final feel = _tripFeel != null && _tripFeel!.isNotEmpty
        ? ' I’m shaping this around your trip feel: “$_tripFeel”.'
        : '';
    final style = _styleMemoryLine();

    if (lower.contains('romantic')) {
      return 'Picture a slow spa morning, a hidden spring at noon, and a rooftop table timed for golden hour — not 7PM on a schedule, but a sunset when you’re ready.$feel$style Shall I add this to your timeline and surface a few Gems locals don’t share?';
    }
    if (lower.contains('wellness') || lower.contains('reset')) {
      return 'I’ll build a restorative arc: citrus spa ritual, quiet spring float, and an early night with soft luxury — zero packed transfers.$feel$style Want crowd-light Gems only?';
    }
    if (lower.contains('family') || lower.contains('magic')) {
      return 'Family magic with adult pacing: a softer park rhythm, a spring dip everyone loves, and dinners where nobody melts down.$feel$style I’ll keep a rainy-day backup in your Feed.';
    }
    if (lower.contains('hidden') || lower.contains('luxury')) {
      return 'I’ll lean on our Gems layer — alley courtyards, north-trail springs, and tables without street signage.$feel$style The Feed can handle what’s trending if you want one viral night.';
    }
    if (lower.contains('foodie')) {
      return 'Foodie adventure: rooftops, chef counters, and one splurge night where the city feels golden.$feel$style I’ll sequence drive times so you’re hungry, not rushed.';
    }
    if (lower.contains('disney') || lower.contains('after-dark')) {
      return 'After-dark wonder with fewer crowds — emotional pacing, not marathon miles.$feel$style I’ll pair it with a quiet Gem morning so the trip breathes.';
    }
    if (lower.contains('adventure')) {
      return 'Adventure with elegance: eco paddle, island energy, one bold day trip — still premium, never gritty.$feel$style Map routes will optimize drive time when we go live.';
    }
    return 'I’m curating a flow of moments across Florida — anticipation built in, stress left out.$feel$style Try Gems for secrets or Feed for what’s buzzing right now.';
  }

  Future<void> _showStyleRefineSheet(AppLocalizations l) async {
    await showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      backgroundColor: const Color(0xFF12100F),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 42,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.22),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                l.conciergeStyleMemory,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final s in styleMemoryCanonicalPrefs)
                    FilterChip(
                      label: Text(localizeStylePref(l, s)),
                      selected: _stylePrefs.contains(s),
                      onSelected: _stylePrefs.contains(s)
                          ? (_) => _removeStylePref(s)
                          : (_) => _addStylePref(s),
                      selectedColor: LuxColors.gemAccent.withValues(alpha: 0.2),
                      backgroundColor: Colors.white.withValues(alpha: 0.04),
                      checkmarkColor: LuxColors.gemAccent,
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final prompts = conciergePromptChipsL10n(l);
    final primaryPrompts = [
      prompts[0], // Romantic
      prompts[1], // Wellness
      prompts[2], // Family
      prompts[6], // Adventure
    ];
    final activeStylePreview = _stylePrefs.take(5).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l.conciergeBrand,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3,
                          color: LuxColors.gold.withValues(alpha: 0.85),
                        ),
                      ),
                      Text(
                        l.conciergeTitle,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      if (_tripFeel != null && _tripFeel!.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          l.conciergeTripFeel(_tripFeel!),
                          style: const TextStyle(
                            color: LuxColors.stone500,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                IconButton(
                  tooltip: l.settings,
                  onPressed: () => LuxoraSettingsSheet.show(context),
                  icon: Icon(
                    Icons.settings_outlined,
                    color: LuxColors.gold.withValues(alpha: 0.9),
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white.withValues(alpha: 0.06),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.07),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
              ),
              child: Text(
                'Welcome to Luxora — your emotionally intelligent Florida companion.\nWhat kind of experience are you craving today?',
                style: TextStyle(
                  fontSize: 15,
                  height: 1.42,
                  color: LuxColors.stone300.withValues(alpha: 0.96),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l.conciergeQuickPrompts,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: LuxColors.stone500.withValues(alpha: 0.9),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 122,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: primaryPrompts.length,
                separatorBuilder: (_, index) => const SizedBox(width: 10),
                itemBuilder: (context, i) {
                  final chip = primaryPrompts[i];
                  return SizedBox(
                    width: 176,
                    child: InkWell(
                      onTap: () => _send(chip.prompt),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            colors: [
                              LuxColors.gold.withValues(alpha: 0.15),
                              Colors.white.withValues(alpha: 0.03),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border: Border.all(
                            color: LuxColors.gold.withValues(alpha: 0.35),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: LuxColors.gold.withValues(alpha: 0.07),
                              blurRadius: 14,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              switch (i) {
                                0 => Icons.favorite_rounded,
                                1 => Icons.spa_rounded,
                                2 => Icons.family_restroom_rounded,
                                _ => Icons.explore_rounded,
                              },
                              color: LuxColors.gold.withValues(alpha: 0.95),
                              size: 20,
                            ),
                            Text(
                              chip.label,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _showStyleRefineSheet(l),
                    icon: const Icon(Icons.tune_rounded, size: 18),
                    label: const Text('Refine My Style'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: LuxColors.cream,
                      side: BorderSide(
                        color: LuxColors.gemAccent.withValues(alpha: 0.42),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      backgroundColor: Colors.white.withValues(alpha: 0.03),
                    ),
                  ),
                ),
              ],
            ),
            if (activeStylePreview.isNotEmpty) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (final s in activeStylePreview)
                    InputChip(
                      label: Text(localizeStylePref(l, s)),
                      onDeleted: () => _removeStylePref(s),
                      labelStyle: const TextStyle(fontSize: 11),
                      deleteIcon: const Icon(Icons.close, size: 14),
                      backgroundColor: LuxColors.gemSurface.withValues(alpha: 0.86),
                      side: BorderSide(
                        color: LuxColors.gemAccent.withValues(alpha: 0.35),
                      ),
                    ),
                  if (_stylePrefs.length > activeStylePreview.length)
                    Chip(
                      label: Text('+${_stylePrefs.length - activeStylePreview.length}'),
                      backgroundColor: Colors.white.withValues(alpha: 0.04),
                    ),
                ],
              ),
            ],
            const SizedBox(height: 10),
            Expanded(
              child: GlassCard(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 132,
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: _messages.length,
                        itemBuilder: (context, i) {
                          final m = _messages[i];
                          return Align(
                            alignment: m.user
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.sizeOf(context).width * 0.78,
                              ),
                              decoration: BoxDecoration(
                                color: m.user
                                    ? LuxColors.gold.withValues(alpha: 0.18)
                                    : Colors.white.withValues(alpha: 0.08),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                m.text,
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.4,
                                  color: m.user
                                      ? LuxColors.cream
                                      : LuxColors.stone300,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    TextField(
                      controller: _controller,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Describe the feeling you want your trip to have...',
                        hintStyle: TextStyle(
                          color: LuxColors.stone500.withValues(alpha: 0.72),
                          fontSize: 16,
                        ),
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: 0.07),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                          borderSide: BorderSide(
                            color: LuxColors.gold.withValues(alpha: 0.2),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                          borderSide: BorderSide(
                            color: LuxColors.gold.withValues(alpha: 0.22),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                          borderSide: BorderSide(
                            color: LuxColors.gold.withValues(alpha: 0.55),
                            width: 1.2,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.send_rounded,
                            color: LuxColors.gold,
                          ),
                          onPressed: () => _send(_controller.text),
                        ),
                      ),
                      onSubmitted: _send,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

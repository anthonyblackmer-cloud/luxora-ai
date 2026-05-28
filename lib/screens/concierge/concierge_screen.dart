import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luxora_ai/data/concierge_prompts.dart';
import 'package:luxora_ai/services/concierge_session_memory.dart';
import 'package:luxora_ai/services/trip_profile_storage.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';

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
    _load();
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
    setState(() {
      _tripFeel = profile?.tripFeel;
      _stylePrefs = prefs;
      _messages.add((
        user: false,
        text:
            'Welcome to Luxora — your emotionally intelligent Florida companion.\n\n'
            'Choose a prompt below, or describe the feeling you want your trip to create.',
      ));
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'LUXORA',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 3,
                color: LuxColors.gold.withValues(alpha: 0.85),
              ),
            ),
            Text(
              'Concierge',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            if (_tripFeel != null && _tripFeel!.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                'Trip feel: “$_tripFeel”',
                style: const TextStyle(color: LuxColors.stone500, fontSize: 13),
              ),
            ],
            const SizedBox(height: 12),
            Expanded(
              child: GlassCard(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Expanded(
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
                    const SizedBox(height: 8),
                    Text(
                      'Quick prompts',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: LuxColors.stone500.withValues(alpha: 0.95),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 36,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: conciergePromptChips.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 8),
                        itemBuilder: (context, i) {
                          final chip = conciergePromptChips[i];
                          return ActionChip(
                            label: Text(chip.label),
                            labelStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            backgroundColor:
                                LuxColors.gold.withValues(alpha: 0.12),
                            side: BorderSide(
                              color: LuxColors.gold.withValues(alpha: 0.35),
                            ),
                            onPressed: () => _send(chip.prompt),
                          );
                        },
                      ),
                    ),
                    if (_stylePrefs.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Remembering for this trip',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: LuxColors.gemAccent.withValues(alpha: 0.9),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: _stylePrefs
                            .map(
                              (p) => InputChip(
                                label: Text(p),
                                labelStyle: const TextStyle(fontSize: 11),
                                deleteIcon: const Icon(Icons.close, size: 14),
                                onDeleted: () => _removeStylePref(p),
                                backgroundColor:
                                    LuxColors.gemSurface.withValues(alpha: 0.9),
                                side: BorderSide(
                                  color:
                                      LuxColors.gemAccent.withValues(alpha: 0.35),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                    const SizedBox(height: 10),
                    Text(
                      'Style memory',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: LuxColors.stone500.withValues(alpha: 0.95),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        for (final s in styleMemorySuggestions)
                          FilterChip(
                            label: Text(s, style: const TextStyle(fontSize: 11)),
                            selected: _stylePrefs.contains(s),
                            onSelected: _stylePrefs.contains(s)
                                ? (_) => _removeStylePref(s)
                                : (_) => _addStylePref(s),
                            selectedColor:
                                LuxColors.gemAccent.withValues(alpha: 0.2),
                            backgroundColor: Colors.white.withValues(alpha: 0.04),
                            checkmarkColor: LuxColors.gemAccent,
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText:
                            'Describe the feeling you want your trip to create…',
                        hintStyle: TextStyle(
                          color: LuxColors.stone500.withValues(alpha: 0.8),
                        ),
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: 0.06),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
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

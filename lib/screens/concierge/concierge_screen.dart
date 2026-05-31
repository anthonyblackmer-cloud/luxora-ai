import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/data/concierge_prompts.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/luxora_l10n_helpers.dart';
import 'package:luxora_ai/models/concierge/concierge_trip_context.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/concierge_ai_service.dart';
import 'package:luxora_ai/services/concierge_context_builder.dart';
import 'package:luxora_ai/services/concierge_conversation_archive.dart';
import 'package:luxora_ai/services/concierge_itinerary_sync.dart';
import 'package:luxora_ai/services/concierge_local_responder.dart';
import 'package:luxora_ai/services/concierge_session_memory.dart';
import 'package:luxora_ai/services/concierge_ticket_sync.dart';
import 'package:luxora_ai/services/concierge_trip_save_sync.dart';
import 'package:luxora_ai/services/concierge_voice_service.dart';
import 'package:luxora_ai/services/trip_profile_storage.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/util/concierge_agenda_chat_format.dart';
import 'package:luxora_ai/util/lux_snack_bar.dart';
import 'package:luxora_ai/util/concierge_ai_user_message.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/concierge/concierge_voice_settings_sheet.dart';
import 'package:luxora_ai/widgets/luxora_moment_chips.dart';
import 'package:luxora_ai/widgets/settings/luxora_premium_sheet_shell.dart';

class ConciergeScreen extends StatefulWidget {
  const ConciergeScreen({super.key});

  @override
  State<ConciergeScreen> createState() => _ConciergeScreenState();
}

class _ConciergeScreenState extends State<ConciergeScreen> {
  final _messages = <({bool user, String text})>[];
  final _apiHistory = <ConciergeChatMessage>[];
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  final _memory = ConciergeSessionMemory();
  String? _tripFeel;
  TripProfile? _profile;
  List<String> _stylePrefs = [];
  bool _isThinking = false;
  bool _voiceListening = false;
  bool _voiceStarting = false;
  bool _voiceReleaseQueued = false;
  bool _voiceFinishing = false;
  bool _voiceProcessing = false;
  bool _luxoraSpeaking = false;
  String _voicePartial = '';
  String? _lastItinerarySourceMessage;
  final _voice = ConciergeVoiceService.instance;

  @override
  void initState() {
    super.initState();
    unawaited(_voice.initialize());
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  @override
  void dispose() {
    unawaited(_cancelVoiceInput());
    unawaited(_voice.stopSpeaking());
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final profile = await TripProfileStorage().load();
    final prefs = await _memory.load();
    final lastVisit = await _memory.lastVisit();
    if (!mounted) return;
    final l = AppLocalizations.of(context);
    final recall = _recallLine(l, profile, prefs, returning: lastVisit != null);
    setState(() {
      _profile = profile;
      _tripFeel = profile?.tripFeel;
      _stylePrefs = prefs;
      _messages.add((user: false, text: l.conciergeWelcome));
      if (recall != null) {
        _messages.add((user: false, text: recall));
      }
      if (!ConciergeAiService.isConfigured) {
        _messages.add((
          user: false,
          text: l.conciergeLocalTryPlanning,
        ));
      }
    });
    unawaited(_memory.markVisited());
  }

  /// Builds a personalized recall bubble for returning travelers — surfacing
  /// the style prefs and trip feel the concierge has remembered. Returns null
  /// for first-time visitors or when there's nothing to recall.
  String? _recallLine(
    AppLocalizations l,
    TripProfile? profile,
    List<String> prefs, {
    required bool returning,
  }) {
    if (!returning) return null;
    final parts = <String>[];
    if (prefs.isNotEmpty) {
      final pretty = prefs.map((p) => localizeStylePref(l, p)).join(' · ');
      parts.add(l.conciergeRecallStyle(pretty));
    }
    final feel = profile?.tripFeel;
    if (feel != null && feel.trim().isNotEmpty) {
      parts.add(l.conciergeRecallFeelLine(feel.trim()));
    }
    if (parts.isEmpty) return null;
    return '${l.conciergeRecallReturning} ${parts.join(' ')}';
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

  void _resetVoiceUi() {
    _voiceListening = false;
    _voiceStarting = false;
    _voiceFinishing = false;
    _voiceProcessing = false;
    _voiceReleaseQueued = false;
    _voicePartial = '';
  }

  Future<void> _speakLuxora(String text) async {
    if (kIsWeb || !mounted) return;
    final locale = Localizations.localeOf(context).languageCode;
    if (mounted) setState(() => _luxoraSpeaking = true);
    await _voice.speak(
      text,
      languageCode: locale,
      onComplete: () {
        if (mounted) setState(() => _luxoraSpeaking = false);
      },
    );
  }

  Future<void> _interruptLuxoraSpeech() async {
    await _voice.stopSpeaking();
    if (mounted) setState(() => _luxoraSpeaking = false);
  }

  Future<void> _startVoiceInput(AppLocalizations l) async {
    if (_isThinking || _voiceFinishing) return;
    if (_luxoraSpeaking) {
      await _interruptLuxoraSpeech();
    }
    if (!mounted) return;
    if (_voiceListening || _voiceStarting || _voiceProcessing) return;

    final locale = Localizations.localeOf(context).languageCode;
    final messenger = ScaffoldMessenger.of(context);
    _voiceStarting = true;
    _voiceReleaseQueued = false;
    if (mounted) {
      setState(() {
        _voiceListening = true;
        _voicePartial = '';
      });
    }
    try {
      final started = await _voice.startListening(
        languageCode: locale,
        onPartial: (partial) {
          if (!mounted) return;
          setState(() => _voicePartial = partial);
        },
        onSessionEnded: () {
          if (!mounted || _voiceFinishing || !_voiceListening) return;
          if (_voicePartial.trim().isNotEmpty) {
            unawaited(_finishVoiceInput());
          }
        },
      );
      if (!mounted) return;
      if (!started) {
        setState(_resetVoiceUi);
        LuxSnackBar.show(context, message: l.conciergeVoiceSoon);
        return;
      }
      if (_voiceReleaseQueued) {
        unawaited(_finishVoiceInput());
      }
    } finally {
      _voiceStarting = false;
    }
  }

  Future<void> _finishVoiceInput() async {
    if (_voiceFinishing) return;
    if (!_voiceListening && _voicePartial.trim().isEmpty) return;

    _voiceFinishing = true;
    _voiceReleaseQueued = false;
    final heard = _voicePartial.trim();

    if (mounted) {
      setState(() {
        _voiceListening = false;
        _voiceProcessing = heard.isNotEmpty;
      });
    }

    try {
      final text =
          (await _voice.stopListeningAndTakeResult(fallback: heard)) ?? heard;
      if (!mounted) return;
      setState(() {
        _voiceProcessing = false;
        _voicePartial = '';
      });
      if (text.trim().isEmpty) {
        if (mounted) setState(_resetVoiceUi);
        LuxSnackBar.show(
          context,
          message: AppLocalizations.of(context).conciergeVoiceNoSpeech,
        );
        return;
      }
      HapticFeedback.lightImpact();
      await _send(text, fromVoice: true);
    } finally {
      _voiceFinishing = false;
      if (mounted) setState(_resetVoiceUi);
    }
  }

  Future<void> _cancelVoiceInput() async {
    if (!_voiceListening || _voiceFinishing) return;
    _voiceFinishing = true;
    try {
      await _voice.cancelListening();
      if (!mounted) return;
      setState(_resetVoiceUi);
    } finally {
      _voiceFinishing = false;
    }
  }

  void _onVoicePointerDown(AppLocalizations l) {
    if (_isThinking || _voiceFinishing) return;
    if (_voiceListening || _voiceStarting || _voiceProcessing) return;
    if (_luxoraSpeaking) {
      unawaited(_interruptLuxoraSpeech().then((_) {
        if (mounted) _startVoiceInput(l);
      }));
      return;
    }
    unawaited(_startVoiceInput(l));
  }

  void _onVoicePointerRelease() {
    if (_voiceStarting) {
      _voiceReleaseQueued = true;
      return;
    }
    if (!_voiceListening) return;
    // iOS often fires cancel instead of up; always submit on release.
    unawaited(_finishVoiceInput());
  }

  Future<void> _send(String text, {bool fromVoice = false}) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty || _isThinking) return;
    if (!fromVoice) {
      HapticFeedback.selectionClick();
    }
    _dismissKeyboard();
    final l = AppLocalizations.of(context);
    final inferred = ConciergeSessionMemory.preferenceFromUserMessage(trimmed);
    if (inferred != null) {
      unawaited(_addStylePref(inferred));
    }
    setState(() {
      _messages.add((user: true, text: trimmed));
      _controller.clear();
      _isThinking = true;
    });
    _scrollToEnd();

    if (!ConciergeAiService.isConfigured) {
      final locale = Localizations.localeOf(context).languageCode;
      final local = await ConciergeLocalResponder.respond(
        l: l,
        userMessage: trimmed,
        profile: _profile,
        localeName: locale,
      );
      if (!mounted) return;
      setState(() {
        _isThinking = false;
        _messages.add((user: false, text: local.reply));
        final sync = local.sync;
        if (sync != null) {
          _profile = sync.profile;
          _tripFeel = sync.profile.tripFeel;
          _lastItinerarySourceMessage = trimmed;
        }
      });
      if (local.sync != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          LuxSnackBar.show(
            context,
            message: l.conciergeAgendaUpdatedSnack,
            actionLabel: l.conciergeViewAgendaOnMap,
            onAction: () => context.go('/agenda'),
          );
        });
      }
      if (fromVoice) unawaited(_speakLuxora(local.reply));
      _scrollToEnd();
      return;
    }

    _apiHistory.add(ConciergeChatMessage(role: 'user', content: trimmed));

    try {
      final locale = Localizations.localeOf(context).languageCode;
      final contextPayload = ConciergeContextBuilder.build(
        profile: _profile,
        stylePrefs: _stylePrefs,
        localeCode: locale,
      );
      final reply = await ConciergeAiService.chat(
        messages: List<ConciergeChatMessage>.from(_apiHistory),
        context: contextPayload,
      );
      _apiHistory.add(ConciergeChatMessage(role: 'assistant', content: reply));
      if (!mounted) return;
      final planningMessage = ConciergeAgendaChatFormat.resolvePlanningMessage(
        currentUserMessage: trimmed,
        assistantReply: reply,
        history: [
          for (final msg in _apiHistory)
            (role: msg.role, content: msg.content),
        ],
        lastSyncedPlanningMessage: _lastItinerarySourceMessage,
        tripFeel: _profile?.tripFeel,
      );
      final promisedSync =
          ConciergeAgendaChatFormat.assistantPromisedAgendaSync(reply);
      final shouldSync = ConciergeTripSaveSync.shouldRebuildItinerary(
            planningMessage,
          ) ||
          promisedSync;
      final sync = shouldSync
          ? await ConciergeItinerarySync.applyAfterChat(
              userMessage: planningMessage,
              profile: _profile,
              forceRebuild: promisedSync &&
                  !ConciergeTripSaveSync.shouldRebuildItinerary(
                    planningMessage,
                  ),
            )
          : null;
      if (sync != null) {
        _lastItinerarySourceMessage = planningMessage;
      }
      if (!mounted) return;
      var ticketDeals = sync?.attachedDeals ?? const [];
      if (ticketDeals.isEmpty && ConciergeTicketSync.wantsTicketHelp(trimmed)) {
        final cityId = (_profile?.cityId.isNotEmpty ?? false)
            ? _profile!.cityId
            : 'orlando';
        ticketDeals = await ConciergeTicketSync.enrichActivePlanWithDeals(
          userMessage: trimmed,
          cityId: cityId,
          profile: _profile,
        );
      }
      ConciergeTripSaveResult? saveResult;
      if (ConciergeTripSaveSync.wantsSaveTrip(trimmed)) {
        saveResult = await ConciergeTripSaveSync.saveCurrentTrip(
          profile: sync?.profile ?? _profile,
          plan: sync?.plan,
          localeName: locale,
          l: l,
        );
      }
      String? savedTripsSummary;
      if (ConciergeTripSaveSync.wantsListSavedTrips(trimmed)) {
        savedTripsSummary = await ConciergeTripSaveSync.listSavedTripsSummary(
          l: l,
          cityId: _profile?.cityId,
        );
      }
      if (!mounted) return;
      final wantsAgendaDetail =
          ConciergeAgendaChatFormat.wantsAgendaDetailInChat(trimmed);
      var displayReply = reply;
      if (sync != null) {
        if (wantsAgendaDetail) {
          final agendaText =
              ConciergeAgendaChatFormat.formatAgendaForChat(sync.plan);
          if (agendaText.isNotEmpty) {
            displayReply = '$reply\n\n$agendaText';
          }
        } else {
          displayReply = ConciergeAgendaChatFormat.condenseAssistantReply(
            reply,
            fallback: l.conciergeItinerarySynced,
          );
        }
      } else if (ConciergeAgendaChatFormat.assistantPromisedAgendaSync(reply)) {
        displayReply = l.conciergeAgendaSyncFailed;
      }
      if (!mounted) return;
      setState(() {
        _isThinking = false;
        _messages.add((user: false, text: displayReply));
        if (sync != null) {
          _profile = sync.profile;
          _tripFeel = sync.profile.tripFeel;
          final agendaDealsChat = ConciergeTicketSync.agendaSavingsChat(
            l,
            sync.plan,
            profile: sync.profile,
          );
          final showDealsInChat = wantsAgendaDetail ||
              ConciergeTicketSync.wantsTicketHelp(trimmed);
          if (showDealsInChat && agendaDealsChat.isNotEmpty) {
            _messages.add((user: false, text: agendaDealsChat));
          }
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            if (!mounted) return;
            var snackMessage = l.conciergeAgendaUpdatedSnack;
            if (!showDealsInChat && agendaDealsChat.isNotEmpty) {
              snackMessage = '$snackMessage\n${l.conciergeAgendaDealsSnack}';
            }
            LuxSnackBar.show(
              context,
              message: snackMessage,
              actionLabel: l.conciergeViewAgendaOnMap,
              onAction: () => context.go('/agenda'),
            );
            await Future<void>.delayed(const Duration(milliseconds: 1200));
            if (!mounted) return;
            await _archiveAndStartFreshThread(
              l,
              summary: ConciergeItinerarySync.timelineSnapshot(
                sync.flow,
                plan: sync.plan,
              ),
              showSnackBar: false,
            );
          });
        }
        if (saveResult != null) {
          _messages.add((user: false, text: saveResult.chatMessage));
        }
        if (savedTripsSummary != null) {
          _messages.add((user: false, text: savedTripsSummary));
        }
        if (ticketDeals.isNotEmpty &&
            ConciergeTicketSync.wantsTicketHelp(trimmed)) {
          _messages.add((
            user: false,
            text: ConciergeTicketSync.chatSummary(
              l,
              ticketDeals,
              profile: _profile,
            ),
          ));
        }
      });
      if (fromVoice) unawaited(_speakLuxora(displayReply));
    } on ConciergeAiException catch (e) {
      if (!mounted) return;
      final msg = conciergeAiUserMessage(l, e);
      setState(() {
        _isThinking = false;
        _apiHistory.removeLast();
        _messages.add((user: false, text: msg.chatText));
      });
      if (fromVoice) unawaited(_speakLuxora(msg.voiceText));
    } catch (_) {
      if (!mounted) return;
      final msg = conciergeAiUserMessage(l, Exception());
      setState(() {
        _isThinking = false;
        _apiHistory.removeLast();
        _messages.add((user: false, text: msg.chatText));
      });
      if (fromVoice) unawaited(_speakLuxora(msg.voiceText));
    } finally {
      if (mounted && _isThinking) {
        setState(() => _isThinking = false);
      }
    }
    _scrollToEnd();
  }

  Future<void> _archiveAndStartFreshThread(
    AppLocalizations l, {
    String summary = '',
    bool showSnackBar = true,
  }) async {
    if (_messages.isEmpty && _apiHistory.isEmpty) return;
    await ConciergeConversationArchive.instance.archiveThread(
      messages: List.from(_messages),
      apiHistory: List.from(_apiHistory),
      summary: summary,
    );
    if (!mounted) return;
    setState(() {
      _messages
        ..clear()
        ..add((user: false, text: l.conciergeFreshThread));
      _apiHistory.clear();
    });
    _scrollToEnd();
    if (showSnackBar && mounted) {
      LuxSnackBar.show(
        context,
        message: l.conciergeThreadArchivedSnack,
      );
    }
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

  String _greeting(AppLocalizations l) {
    final hour = DateTime.now().hour;
    if (hour < 12) return l.conciergeGreetingMorning;
    if (hour < 18) return l.conciergeGreetingAfternoon;
    return l.conciergeGreetingEvening;
  }

  Future<void> _showStyleRefineSheet(AppLocalizations l) async {
    final t = luxThemeTokensOf(context);
    await showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      backgroundColor: t.bgSecondary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (ctx) {
        final t = luxThemeTokensOf(ctx);
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
                    color: t.borderSubtle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      l.conciergeStyleMemory,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  LuxSheetCloseButton(
                    color: t.textPrimary,
                    background: t.panelFill,
                  ),
                ],
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
                      backgroundColor: t.panelFill,
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
    final t = luxThemeTokensOf(context);
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: GlassCard(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                child: ListView(
                  controller: _scrollController,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.only(bottom: 8),
                  children: [
                    ..._buildIntroSection(
                      l,
                      t,
                      primaryPrompts,
                      activeStylePreview,
                    ),
                    for (var i = 0; i < _messages.length; i++)
                      _buildMessageBubble(context, t, _messages[i]),
                    if (_isThinking)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: t.panelFill,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            l.conciergeThinking,
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: t.textMuted,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              style: TextStyle(
                color: t.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: l.conciergeInputHint,
                hintStyle: TextStyle(
                  color: t.textMuted.withValues(alpha: 0.72),
                  fontSize: 16,
                ),
                filled: true,
                fillColor: t.panelFill,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                  borderSide: BorderSide(
                    color: t.accent.withValues(alpha: 0.2),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                  borderSide: BorderSide(
                    color: t.accent.withValues(alpha: 0.22),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                  borderSide: BorderSide(
                    color: t.accent.withValues(alpha: 0.55),
                    width: 1.2,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.send_rounded,
                    color: _isThinking
                        ? t.textMuted.withValues(alpha: 0.4)
                        : t.accent,
                  ),
                  onPressed:
                      _isThinking ? null : () => _send(_controller.text),
                ),
              ),
              onSubmitted: _isThinking ? null : _send,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildIntroSection(
    AppLocalizations l,
    LuxThemeTokens t,
    List<ConciergePromptChip> primaryPrompts,
    List<String> activeStylePreview,
  ) {
    return [
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
                    color: t.accent.withValues(alpha: 0.85),
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
                    style: TextStyle(
                      color: t.textMuted,
                      fontSize: 13,
                    ),
                  ),
                ],
              ],
            ),
          ),
          IconButton(
            tooltip: l.conciergeNewConversationTooltip,
            onPressed: _apiHistory.isEmpty
                ? null
                : () => unawaited(_archiveAndStartFreshThread(l)),
            icon: Icon(
              Icons.add_comment_outlined,
              color: t.accent.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
      const SizedBox(height: 14),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
        decoration: BoxDecoration(
          color: t.panelFill,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: t.borderSubtle),
        ),
        child: Text(
          '${_greeting(l)} ${l.conciergeWelcomeWarm}',
          style: TextStyle(
            fontSize: 15,
            height: 1.42,
            color: t.textMuted.withValues(alpha: 0.96),
          ),
        ),
      ),
      const SizedBox(height: 14),
      LuxoraMomentChips(onMomentSelected: _send),
      const SizedBox(height: 12),
      Row(
        children: [
          Expanded(
            child: Listener(
              behavior: HitTestBehavior.opaque,
              onPointerDown: (_) => _onVoicePointerDown(l),
              onPointerUp: (_) => _onVoicePointerRelease(),
              onPointerCancel: (_) => _onVoicePointerRelease(),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: (_voiceListening ||
                          _voiceProcessing ||
                          _luxoraSpeaking)
                      ? t.accent.withValues(alpha: 0.12)
                      : null,
                  border: Border.all(
                    color: (_voiceListening ||
                            _voiceProcessing ||
                            _luxoraSpeaking)
                        ? t.accent.withValues(alpha: 0.55)
                        : t.accent.withValues(alpha: 0.25),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_voiceProcessing)
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: t.accent.withValues(alpha: 0.9),
                            ),
                          )
                        else
                          Icon(
                            _voiceListening
                                ? Icons.graphic_eq_rounded
                                : _luxoraSpeaking
                                    ? Icons.volume_up_rounded
                                    : Icons.mic_rounded,
                            size: 18,
                            color: t.accent.withValues(alpha: 0.9),
                          ),
                        const SizedBox(width: 8),
                        Text(
                          _voiceProcessing
                              ? l.conciergeVoiceProcessing
                              : _voiceListening
                                  ? l.conciergeVoiceListening
                                  : _luxoraSpeaking
                                      ? l.conciergeVoiceSpeaking
                                      : l.conciergeVoiceHold,
                          style: TextStyle(
                            fontSize: 13,
                            color: t.textMuted,
                          ),
                        ),
                      ],
                    ),
                    if (_voiceListening && !_voiceProcessing) ...[
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          _voicePartial.isEmpty
                              ? l.conciergeVoiceRelease
                              : _voicePartial,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.3,
                            color: _voicePartial.isEmpty
                                ? t.textMuted.withValues(alpha: 0.8)
                                : t.textPrimary,
                          ),
                        ),
                      ),
                      if (_voicePartial.isNotEmpty) ...[
                        const SizedBox(height: 6),
                        TextButton(
                          onPressed: _voiceFinishing
                              ? null
                              : () => unawaited(_finishVoiceInput()),
                          child: Text(l.conciergeVoiceSend),
                        ),
                      ],
                    ],
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            tooltip: l.conciergeVoiceSettingsTitle,
            onPressed: () => ConciergeVoiceSettingsSheet.show(context),
            style: IconButton.styleFrom(
              backgroundColor: t.panelFill,
              foregroundColor: t.accent,
              side: BorderSide(color: t.accent.withValues(alpha: 0.25)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.record_voice_over_rounded),
          ),
        ],
      ),
      const SizedBox(height: 16),
      Text(
        l.conciergeQuickPrompts,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
          color: t.textMuted.withValues(alpha: 0.9),
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 122,
        child: IgnorePointer(
          ignoring: _isThinking,
          child: Opacity(
            opacity: _isThinking ? 0.45 : 1,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: primaryPrompts.length,
              separatorBuilder: (_, index) => const SizedBox(width: 10),
              itemBuilder: (context, i) {
                final chip = primaryPrompts[i];
                return SizedBox(
                  width: 176,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _send(chip.prompt),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            colors: [
                              t.accent.withValues(alpha: 0.15),
                              t.panelFill,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border: Border.all(
                            color: t.accent.withValues(alpha: 0.35),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: t.accent.withValues(alpha: 0.07),
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
                              color: t.accent.withValues(alpha: 0.95),
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
                  ),
                );
              },
            ),
          ),
        ),
      ),
      const SizedBox(height: 12),
      OutlinedButton.icon(
        onPressed: () => _showStyleRefineSheet(l),
        icon: const Icon(Icons.tune_rounded, size: 18),
        label: Text(l.conciergeRefineStyle),
        style: OutlinedButton.styleFrom(
          foregroundColor: t.textPrimary,
          side: BorderSide(
            color: LuxColors.gemAccent.withValues(alpha: 0.42),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          backgroundColor: t.panelFill,
        ),
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
                backgroundColor: t.panelFill,
              ),
          ],
        ),
      ],
      const SizedBox(height: 16),
    ];
  }

  Widget _buildMessageBubble(
    BuildContext context,
    LuxThemeTokens t,
    ({bool user, String text}) message,
  ) {
    return Align(
      alignment: message.user ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.78,
        ),
        decoration: BoxDecoration(
          color: message.user
              ? t.accent.withValues(alpha: 0.18)
              : t.panelFill,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            fontSize: 14,
            height: 1.4,
            color: message.user ? t.textPrimary : t.textMuted,
          ),
        ),
      ),
    );
  }
}

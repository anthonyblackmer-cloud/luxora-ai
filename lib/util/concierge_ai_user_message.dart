import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/services/concierge_ai_service.dart';

/// User-facing concierge errors (chat + short voice line).
class ConciergeAiUserMessage {
  const ConciergeAiUserMessage({
    required this.chatText,
    required this.voiceText,
  });

  final String chatText;
  final String voiceText;
}

ConciergeAiUserMessage conciergeAiUserMessage(
  AppLocalizations l,
  Object error,
) {
  if (error is ConciergeAiException) {
    return switch (error.kind) {
      ConciergeAiFailureKind.notConfigured => ConciergeAiUserMessage(
          chatText: l.conciergeAiNotConfigured,
          voiceText: l.conciergeAiErrorVoice,
        ),
      ConciergeAiFailureKind.openAiKeyMissing => ConciergeAiUserMessage(
          chatText: l.conciergeAiOpenAiNotReady,
          voiceText: l.conciergeAiErrorVoice,
        ),
      ConciergeAiFailureKind.functionNotFound => ConciergeAiUserMessage(
          chatText: l.conciergeAiFunctionNotFound(error.functionSlug ?? ''),
          voiceText: l.conciergeAiErrorVoice,
        ),
      ConciergeAiFailureKind.unauthorized => ConciergeAiUserMessage(
          chatText: l.conciergeAiAuthFailed,
          voiceText: l.conciergeAiErrorVoice,
        ),
      ConciergeAiFailureKind.network => ConciergeAiUserMessage(
          chatText: l.conciergeAiError,
          voiceText: l.conciergeAiErrorVoice,
        ),
      ConciergeAiFailureKind.unknown => ConciergeAiUserMessage(
          chatText: l.conciergeAiError,
          voiceText: l.conciergeAiErrorVoice,
        ),
    };
  }
  return ConciergeAiUserMessage(
    chatText: l.conciergeAiError,
    voiceText: l.conciergeAiErrorVoice,
  );
}

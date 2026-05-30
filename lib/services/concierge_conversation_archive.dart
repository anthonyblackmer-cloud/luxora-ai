import 'dart:convert';

import 'package:luxora_ai/models/concierge/concierge_trip_context.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _archiveKey = 'luxora_concierge_archived_threads_v1';
const _maxArchived = 20;

/// A archived Concierge thread (UI + model history snapshot).
class ConciergeArchivedThread {
  const ConciergeArchivedThread({
    required this.archivedAt,
    required this.summary,
    required this.messages,
    required this.apiHistory,
  });

  final DateTime archivedAt;
  final String summary;
  final List<ConciergeArchivedMessage> messages;
  final List<ConciergeChatMessage> apiHistory;

  Map<String, dynamic> toJson() => {
        'archivedAt': archivedAt.toIso8601String(),
        'summary': summary,
        'messages': [for (final m in messages) m.toJson()],
        'apiHistory': [
          for (final m in apiHistory) {'role': m.role, 'content': m.content},
        ],
      };

  static ConciergeArchivedThread fromJson(Map<String, dynamic> json) {
    return ConciergeArchivedThread(
      archivedAt: DateTime.parse(json['archivedAt'] as String),
      summary: json['summary'] as String? ?? '',
      messages: [
        for (final raw in (json['messages'] as List<dynamic>? ?? const []))
          if (raw is Map<String, dynamic>)
            ConciergeArchivedMessage.fromJson(raw),
      ],
      apiHistory: [
        for (final raw in (json['apiHistory'] as List<dynamic>? ?? const []))
          if (raw is Map<String, dynamic>)
            ConciergeChatMessage(
              role: raw['role'] as String? ?? 'user',
              content: raw['content'] as String? ?? '',
            ),
      ],
    );
  }
}

class ConciergeArchivedMessage {
  const ConciergeArchivedMessage({required this.user, required this.text});

  final bool user;
  final String text;

  Map<String, dynamic> toJson() => {'user': user, 'text': text};

  static ConciergeArchivedMessage fromJson(Map<String, dynamic> json) =>
      ConciergeArchivedMessage(
        user: json['user'] as bool? ?? false,
        text: json['text'] as String? ?? '',
      );
}

/// Persists past Concierge threads locally before starting a fresh one.
class ConciergeConversationArchive {
  ConciergeConversationArchive._();

  static final ConciergeConversationArchive instance =
      ConciergeConversationArchive._();

  Future<void> archiveThread({
    required List<({bool user, String text})> messages,
    required List<ConciergeChatMessage> apiHistory,
    String summary = '',
  }) async {
    if (messages.isEmpty && apiHistory.isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    final existing = _readAll(prefs);
    existing.insert(
      0,
      ConciergeArchivedThread(
        archivedAt: DateTime.now(),
        summary: summary.trim(),
        messages: [
          for (final m in messages)
            ConciergeArchivedMessage(user: m.user, text: m.text),
        ],
        apiHistory: List<ConciergeChatMessage>.from(apiHistory),
      ),
    );
    while (existing.length > _maxArchived) {
      existing.removeLast();
    }
    await prefs.setString(
      _archiveKey,
      jsonEncode([for (final t in existing) t.toJson()]),
    );
  }

  Future<List<ConciergeArchivedThread>> loadArchived() async {
    final prefs = await SharedPreferences.getInstance();
    return _readAll(prefs);
  }

  List<ConciergeArchivedThread> _readAll(SharedPreferences prefs) {
    try {
      final raw = prefs.getString(_archiveKey);
      if (raw == null) return [];
      final decoded = jsonDecode(raw) as List<dynamic>;
      return [
        for (final item in decoded)
          if (item is Map<String, dynamic>)
            ConciergeArchivedThread.fromJson(item),
      ];
    } catch (_) {
      return [];
    }
  }
}

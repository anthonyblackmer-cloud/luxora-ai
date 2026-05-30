import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:luxora_ai/models/concierge/concierge_trip_context.dart';
import 'package:luxora_ai/services/supabase_config.dart';

/// Calls the Supabase Edge Function that proxies OpenAI for concierge chat.
abstract final class ConciergeAiService {
  static const _timeout = Duration(seconds: 45);

  static bool get isConfigured => SupabaseConfig.isConfigured;

  static Uri get _endpoint => Uri.parse(
        '${SupabaseConfig.url.replaceAll(RegExp(r'/+$'), '')}'
        '/functions/v1/${SupabaseConfig.conciergeFunction}',
      );

  static Map<String, String> get _headers {
    final headers = <String, String>{
      'apikey': SupabaseConfig.anonKey,
      'Content-Type': 'application/json',
    };
    // Publishable keys are not JWTs — gateway auth uses apikey when verify_jwt is off.
    if (!SupabaseConfig.usesPublishableKey) {
      headers['Authorization'] = 'Bearer ${SupabaseConfig.anonKey}';
    }
    return headers;
  }

  static Future<String> chat({
    required List<ConciergeChatMessage> messages,
    required ConciergeTripContext context,
  }) async {
    if (!isConfigured) {
      throw ConciergeAiException.notConfigured();
    }

    final response = await http
        .post(
          _endpoint,
          headers: _headers,
          body: jsonEncode({
            'messages': messages.map((m) => m.toJson()).toList(),
            'context': context.toJson(),
          }),
        )
        .timeout(_timeout);

    Map<String, dynamic> body;
    try {
      body = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (_) {
      throw ConciergeAiException(
        'Invalid response from concierge service (${response.statusCode})',
      );
    }

    if (response.statusCode >= 400) {
      final err = body['error'] as String? ?? 'Request failed';
      throw ConciergeAiException(err);
    }

    final reply = body['reply'] as String?;
    if (reply == null || reply.trim().isEmpty) {
      throw ConciergeAiException('Empty reply from concierge service');
    }
    return reply.trim();
  }
}

class ConciergeAiException implements Exception {
  ConciergeAiException(this.message);

  factory ConciergeAiException.notConfigured() => ConciergeAiException(
        'Concierge AI is not configured. Add SUPABASE_URL and '
        'SUPABASE_ANON_KEY — see docs/CONCIERGE_AI.md.',
      );

  final String message;

  @override
  String toString() => message;
}

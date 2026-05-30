import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:luxora_ai/models/concierge/concierge_trip_context.dart';
import 'package:luxora_ai/services/supabase_config.dart';

enum ConciergeAiFailureKind {
  notConfigured,
  openAiKeyMissing,
  functionNotFound,
  unauthorized,
  network,
  unknown,
}

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

    http.Response response;
    try {
      response = await http
          .post(
            _endpoint,
            headers: _headers,
            body: jsonEncode({
              'messages': messages.map((m) => m.toJson()).toList(),
              'context': context.toJson(),
            }),
          )
          .timeout(_timeout);
    } on Exception {
      throw ConciergeAiException.network();
    }

    Map<String, dynamic> body;
    try {
      body = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (_) {
      throw ConciergeAiException(
        kind: ConciergeAiFailureKind.unknown,
        message:
            'Invalid response from concierge service (${response.statusCode})',
      );
    }

    if (response.statusCode >= 400) {
      final err = body['error'] as String? ?? 'Request failed';
      throw ConciergeAiException.fromHttp(
        statusCode: response.statusCode,
        error: err,
        functionSlug: SupabaseConfig.conciergeFunction,
      );
    }

    final reply = body['reply'] as String?;
    if (reply == null || reply.trim().isEmpty) {
      throw ConciergeAiException(
        kind: ConciergeAiFailureKind.unknown,
        message: 'Empty reply from concierge service',
      );
    }
    return reply.trim();
  }
}

class ConciergeAiException implements Exception {
  ConciergeAiException({
    required this.kind,
    required this.message,
    this.functionSlug,
  });

  factory ConciergeAiException.notConfigured() => ConciergeAiException(
        kind: ConciergeAiFailureKind.notConfigured,
        message: 'SUPABASE_URL or SUPABASE_ANON_KEY missing from build',
      );

  factory ConciergeAiException.network() => ConciergeAiException(
        kind: ConciergeAiFailureKind.network,
        message: 'Network timeout reaching concierge service',
      );

  factory ConciergeAiException.fromHttp({
    required int statusCode,
    required String error,
    required String functionSlug,
  }) {
    final lower = error.toLowerCase();
    if (statusCode == 503 && lower.contains('openai_api_key')) {
      return ConciergeAiException(
        kind: ConciergeAiFailureKind.openAiKeyMissing,
        message: error,
      );
    }
    if (statusCode == 401 || statusCode == 403) {
      return ConciergeAiException(
        kind: ConciergeAiFailureKind.unauthorized,
        message: error,
      );
    }
    if (statusCode == 404 ||
        lower.contains('not found') ||
        lower.contains('function not found')) {
      return ConciergeAiException(
        kind: ConciergeAiFailureKind.functionNotFound,
        message: error,
        functionSlug: functionSlug,
      );
    }
    return ConciergeAiException(
      kind: ConciergeAiFailureKind.unknown,
      message: error,
    );
  }

  final ConciergeAiFailureKind kind;
  final String message;
  final String? functionSlug;

  @override
  String toString() => message;
}

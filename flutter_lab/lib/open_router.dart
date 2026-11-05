import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_key.dart';

Future<String> getOpenRouterResponse(String userInput) async {
  final safeInput = userInput.trim();
  if (safeInput.isEmpty) {
    throw Exception('Le message ne peut pas être vide.');
  }

  const endpoint = 'https://openrouter.ai/api/v1/chat/completions';

  final headers = {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json',
    'HTTP-Referer': 'https://localhost',
    'X-Title': 'Flutter Lab',
  };

  final body = jsonEncode({
    'model': 'openai/gpt-4o-mini',
    'messages': [
      {'role': 'user', 'content': safeInput},
    ],
    'max_tokens': 250,
    'temperature': 0.7,
  });

  final response = await http.post(
    Uri.parse(endpoint),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final choices = data['choices'] as List<dynamic>? ?? const [];

    if (choices.isEmpty) {
      throw Exception('Réponse vide de l’API OpenRouter.');
    }

    final firstChoice = choices.first as Map<String, dynamic>;

    final message = firstChoice['message'];
    if (message is Map<String, dynamic>) {
      final content = message['content'];
      if (content is String && content.trim().isNotEmpty) {
        return content.trim();
      }
      if (content is List) {
        final text = content
            .map((item) => item is Map ? item['text']?.toString() ?? '' : '')
            .join();
        if (text.trim().isNotEmpty) {
          return text.trim();
        }
      }
    }

    final legacyText = firstChoice['text'];
    if (legacyText is String && legacyText.trim().isNotEmpty) {
      return legacyText.trim();
    }

    throw Exception('Le format de réponse ne correspond pas à celui attendu.');
  }

  throw Exception(
    'Erreur OpenRouter (${response.statusCode}): ${response.body}',
  );
}

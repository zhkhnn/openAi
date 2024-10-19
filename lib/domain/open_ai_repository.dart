import 'dart:convert';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:open_ai/utils/keys.dart';
import 'package:http/http.dart' as http;

class OpenAiRepository {
  final OpenAI _openAI;

  OpenAiRepository()
      : _openAI = OpenAI.instance.build(
          token: OPEN_API_KEY,
          baseOption: HttpSetup(
            receiveTimeout: const Duration(seconds: 5),
          ),
        );

  Future<String?> sendMessageWithSSE(String text) async {
    try {
      checkAvailableModels();

      final request = ChatCompleteText(
        model: ChatModelFromValue(model: 'gpt-3.5-turbo-0125'),
        messages: [
          Map.of({"role": "user", "content": text}),
        ],
      );

      final response = await _openAI.onChatCompletion(request: request);
      print('RESPONSE ${response}');
      if (response != null) {
        print('RESPONSE ${response}');
        return response.choices[0].message?.content
            .trim(); // Extract the answer
      } else {
        print('No response from OpenAI.');
        throw Exception("No response from OpenAI.");
      }
    } catch (e) {
      print('Failed to fetch response from OpenAI: $e');
      throw Exception("Failed to fetch response from OpenAI: $e");
    }
  }

  Future<void> checkAvailableModels() async {
    const apiKey = OPEN_API_KEY;
    final url = Uri.parse('https://api.openai.com/v1/models');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $apiKey',
      },
    );

    if (response.statusCode == 200) {
      final models = jsonDecode(response.body);
      print('Available models: $models');
    } else {
      print('Failed to fetch models. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }
}

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class OpenAiRepository {
  final OpenAI _openAI;

  OpenAiRepository(String apiKey)
      : _openAI = OpenAI.instance.build(
          token: apiKey,
          baseOption: HttpSetup(
            receiveTimeout: const Duration(seconds: 20),
            connectTimeout: const Duration(seconds: 20),
          ),
        );

  Stream<String> sendMessageWithSSE(String message) {
    final request = CompleteText(
      prompt: message,
      maxTokens: 200,
      model: TextDavinci3Model(),
    );

    return _openAI.onCompletionSSE(request: request).map((response) {
      return response.choices.last.text;
    });
  }

// Future<String> getResponse();
}

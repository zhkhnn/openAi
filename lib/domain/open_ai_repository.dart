import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:open_ai/utils/keys.dart';

class OpenAiRepository {
  final OpenAI _openAI;

  OpenAiRepository()
      : _openAI = OpenAI.instance.build(
          token: OPEN_API_KEY,
          baseOption: HttpSetup(
            receiveTimeout: const Duration(seconds: 5),
          ),
        );

  Future<String> sendMessageWithSSE(String message) async {
    final request = CompleteText(
      prompt: message,
      maxTokens: 200,
      model: ModelFromValue(model: 'gpt-4-0613'),
    );

    String result = '';

    await for (var response in _openAI.onCompletionSSE(request: request)) {
      result += response.choices.last.text;
    }

    return result.trim();
  }

// Future<String> getResponse();
}

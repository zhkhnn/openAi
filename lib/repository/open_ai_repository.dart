import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:open_ai/utils/keys.dart';

class OpenAiRepository {
  final OpenAI _openAI = OpenAI.instance.build(
    token: OPEN_API_KEY,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  Future<String?> sendMessageWithSSE(String text) async {
    try {
      final request = ChatCompleteText(
        model: Gpt4oMiniChatModel(),
        messages: [
          Map.of({
            "role": "user",
            "content": text,
          }),
        ],
        maxToken: 200,
      );

      final response = await _openAI.onChatCompletion(request: request);
      if (response != null) {
        return response.choices[0].message?.content
            .trim(); // Extract the answer
      } else {
        throw Exception("No response from OpenAI.");
      }
    } catch (e) {
      throw Exception("Failed to fetch response from OpenAI: $e");
    }
  }
}

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

  Future<String?> sendMessageWithSSE(String text) async {
    try {
      final request = ChatCompleteText(
        model: GptTurboChatModel(),
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

  Future<String> uploadMedia(String filePath) async {
    return Future.delayed(const Duration(seconds: 2), () => filePath);
  }
}

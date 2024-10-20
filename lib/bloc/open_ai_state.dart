import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/chat_message.dart';

part 'open_ai_state.freezed.dart';

@freezed
class OpenAiState with _$OpenAiState {
  const factory OpenAiState({
    @Default(OpenAiInitial()) OpenAiStatus mainStatus,
    @Default([]) List<ChatMessage> messages,
    ChatMessage? request,
    String? errorMessage,
    @Default(null) ChatMessage? response,
  }) = _OpenAiState;
}

@freezed
class OpenAiStatus with _$OpenAiStatus {
  const factory OpenAiStatus.initial() = OpenAiInitial;

  const factory OpenAiStatus.success() = OpenAiSuccess;

  const factory OpenAiStatus.failure() = OpenAiFailure;

  const factory OpenAiStatus.loading() = OpenAiLoading;
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/message.dart';

part 'open_ai_state.freezed.dart';

@freezed
class OpenAiState with _$OpenAiState {
  const factory OpenAiState({
    @Default(null) Message? message,
  }) = _OpenAiState;
}

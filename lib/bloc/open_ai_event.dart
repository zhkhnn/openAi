sealed class OpenAiEvent {}

class OpenAiStarted extends OpenAiEvent {}

class OpenAiResponseFetched extends OpenAiEvent {}

class OpenAiRequestChanged extends OpenAiEvent {}

class OpenAiMediaUploaded extends OpenAiEvent {}

class OpenAiRequestSubmitted extends OpenAiEvent {
  final String text;

  OpenAiRequestSubmitted(this.text);
}

class OpenAiMediaSelected extends OpenAiEvent {}

class OpenAiErrorOccurred extends OpenAiEvent {
  final String error;

  OpenAiErrorOccurred(this.error);
}

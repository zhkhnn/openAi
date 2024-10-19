sealed class OpenAiEvent {}

class OpenAiStarted extends OpenAiEvent {}

class OpenAiResponseFetched extends OpenAiEvent {
  final String answer;

  OpenAiResponseFetched(this.answer);
}

class OpenAiRequestChanged extends OpenAiEvent {
  final String request;

  OpenAiRequestChanged(this.request);
}

class OpenAiMediaUploaded extends OpenAiEvent {
  final String filePath;

  OpenAiMediaUploaded(this.filePath);
}

class OpenAiRequestSubmitted extends OpenAiEvent {
  final String text;

  OpenAiRequestSubmitted(this.text);
}

class OpenAiMediaSelected extends OpenAiEvent {}

class OpenAiErrorOccurred extends OpenAiEvent {
  final String error;

  OpenAiErrorOccurred(this.error);
}

class OpenAiCameraOpened extends OpenAiEvent {}

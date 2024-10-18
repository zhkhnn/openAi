sealed class OpenAiEvent {}

class OpenAiStarted extends OpenAiEvent {}

class OpenAiResponseFetched extends OpenAiEvent {}

class OpenAiRequestChanged extends OpenAiEvent {}

class OpenAiMediaUploaded extends OpenAiEvent {}

class OpenAiRequestSubmitted extends OpenAiEvent {}

class OpenAiMediaSelected extends OpenAiEvent {}

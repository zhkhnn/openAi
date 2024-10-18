import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:open_ai/bloc/open_ai_event.dart';

import '../domain/message.dart';
import '../domain/open_ai_repository.dart';
import '../utils/base_bloc.dart';
import 'open_ai_state.dart';

@injectable
class OpenAiBloc extends BaseBloc<OpenAiEvent, OpenAiState> {
  OpenAiBloc(this.repository) : super(const OpenAiState()) {
    _setupHandlers();
    add(OpenAiStarted());
  }

  final OpenAiRepository repository;

  void _setupHandlers() {
    on<OpenAiStarted>(_initialize);
    on<OpenAiResponseFetched>(_responseFetched);
    on<OpenAiRequestChanged>(_requestChanged);
    on<OpenAiMediaUploaded>(_mediaUploaded);
    on<OpenAiRequestSubmitted>(_requestSubmitted);
    on<OpenAiMediaSelected>(_mediaSelected);
    on<OpenAiErrorOccurred>(_onErrorOccurred);
  }

  Future<void> _initialize(
    OpenAiStarted event,
    Emitter<OpenAiState> emit,
  ) async {
    emit(
      state.copyWith(
        mainStatus: const OpenAiInitial(),
      ),
    );
  }

  Future<void> _responseFetched(
    OpenAiResponseFetched event,
    Emitter<OpenAiState> emit,
  ) async {
    emit(
      state.copyWith(
        mainStatus: const OpenAiLoading(),
      ),
    );
  }

  Future<void> _requestChanged(
    OpenAiRequestChanged event,
    Emitter<OpenAiState> emit,
  ) async {}

  Future<void> _mediaUploaded(
    OpenAiMediaUploaded event,
    Emitter<OpenAiState> emit,
  ) async {}

  Future<void> _requestSubmitted(
    OpenAiRequestSubmitted event,
    Emitter<OpenAiState> emit,
  ) async {
    emit(
      state.copyWith(
        mainStatus: const OpenAiLoading(),
      ),
    );

    try {
      final response = await repository.sendMessageWithSSE(event.text);

      final newMessage = Message(text: response.toString(), mediaUrl: "");

      emit(
        state.copyWith(
          mainStatus: const OpenAiSuccess(),
          messages: List.of(state.messages)..add(newMessage),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          mainStatus: const OpenAiFailure(),
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _mediaSelected(
    OpenAiMediaSelected event,
    Emitter<OpenAiState> emit,
  ) async {}

  Future<void> _onErrorOccurred(
    OpenAiErrorOccurred event,
    Emitter<OpenAiState> emit,
  ) async {
    emit(
      state.copyWith(
        mainStatus: const OpenAiFailure(),
        errorMessage: event.error,
      ),
    );
  }
}

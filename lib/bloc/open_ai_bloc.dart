import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:open_ai/bloc/open_ai_event.dart';

import '../base_bloc.dart';
import 'open_ai_state.dart';

@injectable
class OpenAiBloc extends BaseBloc<OpenAiEvent, OpenAiState> {
  OpenAiBloc() : super(const OpenAiState()) {
    _setupHandlers();
    add(OpenAiStarted());
  }

  void _setupHandlers() {
    on<OpenAiStarted>(_initialize);
    on<OpenAiResponseFetched>(_responseFetched);
    on<OpenAiRequestChanged>(_requestChanged);
    on<OpenAiMediaUploaded>(_mediaUploaded);
    on<OpenAiRequestSubmitted>(_requestSubmitted);
    on<OpenAiMediaSelected>(_mediaSelected);
  }

  Future<void> _initialize(
    OpenAiStarted event,
    Emitter<OpenAiState> emit,
  ) async {}

  Future<void> _responseFetched(
    OpenAiResponseFetched event,
    Emitter<OpenAiState> emit,
  ) async {}

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
  ) async {}

  Future<void> _mediaSelected(
    OpenAiMediaSelected event,
    Emitter<OpenAiState> emit,
  ) async {}
}

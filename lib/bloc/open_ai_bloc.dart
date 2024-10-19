import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:open_ai/bloc/open_ai_event.dart';

import '../domain/chat_message.dart';
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
  final ImagePicker _picker = ImagePicker();

  void _setupHandlers() {
    on<OpenAiStarted>(_initialize);
    on<OpenAiResponseFetched>(_responseFetched);
    on<OpenAiRequestChanged>(_requestChanged);
    on<OpenAiMediaUploaded>(_mediaUploaded);
    on<OpenAiRequestSubmitted>(_requestSubmitted);
    on<OpenAiMediaSelected>(_mediaSelected);
    on<OpenAiErrorOccurred>(_onErrorOccurred);
    on<OpenAiCameraOpened>(_onCameraOpened);
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

    final receivedAnswer =
        ChatMessage(text: event.answer, mediaUrl: "", isUser: false);

    emit(
      state.copyWith(
        messages: List.of(state.messages)..add(receivedAnswer),
        mainStatus: const OpenAiSuccess(),
      ),
    );
  }

  Future<void> _requestChanged(
    OpenAiRequestChanged event,
    Emitter<OpenAiState> emit,
  ) async {
    emit(
      state.copyWith(
        mainStatus: const OpenAiLoading(),
      ),
    );

    emit(
      state.copyWith(
        request: ChatMessage(
          text: event.request,
          mediaUrl: '',
          isUser: true,
        ),
        mainStatus: const OpenAiSuccess(),
      ),
    );
  }

  Future<void> _mediaUploaded(
    OpenAiMediaUploaded event,
    Emitter<OpenAiState> emit,
  ) async {
    emit(
      state.copyWith(
        mainStatus: const OpenAiLoading(),
      ),
    );

    try {
      final mediaUrl = await repository.uploadMedia(event.filePath);

      final mediaMessage = ChatMessage(
        text: "📷 Image sent",
        mediaUrl: mediaUrl,
        isUser: true,
      );

      emit(
        state.copyWith(
          messages: List.of(state.messages)..add(mediaMessage),
          mainStatus: const OpenAiSuccess(),
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

  Future<void> _requestSubmitted(
    OpenAiRequestSubmitted event,
    Emitter<OpenAiState> emit,
  ) async {
    emit(
      state.copyWith(
        mainStatus: const OpenAiLoading(),
      ),
    );

    final userMessage =
        ChatMessage(text: event.text, mediaUrl: "", isUser: true);
    emit(
      state.copyWith(
        messages: List.of(state.messages)..add(userMessage),
        mainStatus: const OpenAiSuccess(),
      ),
    );

    try {
      final response = await repository.sendMessageWithSSE(event.text);
      add(OpenAiResponseFetched(response ?? ''));
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
  ) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null && result.files.isNotEmpty) {
        String filePath = result.files.first.path!;
        add(OpenAiMediaUploaded(filePath));
      }
    } catch (e) {
      add(OpenAiErrorOccurred(e.toString()));
    }
  }

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

  Future<void> _onCameraOpened(
      OpenAiCameraOpened event, Emitter<OpenAiState> emit) async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        final newMessage = ChatMessage(
          text: "Фото сделано: ${image.path}",
          mediaUrl: image.path,
          isUser: true,
        );

        emit(
          state.copyWith(
            messages: List.of(state.messages)..add(newMessage),
            mainStatus: const OpenAiSuccess(),
          ),
        );
      } else {
        emit(state.copyWith(mainStatus: const OpenAiSuccess()));
      }
    } catch (e) {
      emit(
        state.copyWith(
          mainStatus: const OpenAiFailure(),
          errorMessage: e.toString(),
        ),
      );
    }
  }
}

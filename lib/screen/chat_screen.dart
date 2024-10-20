import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:open_ai/bloc/open_ai_bloc.dart';
import 'package:open_ai/bloc/open_ai_event.dart';
import 'package:open_ai/bloc/open_ai_state.dart';
import 'package:open_ai/utils/context_injection.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../widgets/media_pop_up.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isSentButtonVisible = false;

  @override
  void initState() {
    super.initState();

    _textController.addListener(() {
      setState(() {
        isSentButtonVisible = _textController.text.isNotEmpty;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 500),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.di<OpenAiBloc>(),
      child: MaterialApp(
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Center(
                child: Text(
                  'Чат',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            body: BlocConsumer<OpenAiBloc, OpenAiState>(
              listener: (context, state) {
                state.mainStatus.maybeWhen(
                  orElse: () {},
                  failure: () {
                    Flushbar(
                      title: state.errorMessage,
                      duration: const Duration(seconds: 3),
                    );
                  },
                );
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemCount: state.messages.length,
                        itemBuilder: (context, index) {
                          if (_scrollController.hasClients) {
                            _scrollController.jumpTo(
                                _scrollController.position.maxScrollExtent);
                          }
                          final message = state.messages[index];
                          final isUserMessage = message.isUser;
                          return Align(
                            alignment: isUserMessage == true
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              decoration: BoxDecoration(
                                color: isUserMessage == true
                                    ? Colors.grey[300]
                                    : Colors.green,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  isUserMessage == true
                                      ? const Icon(Icons.person)
                                      : const Icon(Icons.flaky_outlined),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  if (message.mediaUrl!.isNotEmpty)
                                    Image.file(
                                      File(message.mediaUrl ?? ''),
                                      width: 150,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  if (isUserMessage == true)
                                    Expanded(
                                      child: Text(
                                        message.text,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        maxLines: null,
                                        softWrap: true,
                                      ),
                                    )
                                  else
                                    Expanded(
                                      child: AnimatedTextKit(
                                        animatedTexts: [
                                          TypewriterAnimatedText(
                                            message.text,
                                            textStyle: const TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                            ),
                                            speed: const Duration(
                                                milliseconds: 30),
                                          ),
                                        ],
                                        isRepeatingAnimation: false,
                                        displayFullTextOnTap: true,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                color: Colors.grey,
                              ),
                              child: TextField(
                                controller: _textController,
                                onChanged: (text) {
                                  context.read<OpenAiBloc>().add(
                                        OpenAiRequestChanged(text),
                                      );
                                },
                                minLines: 1,
                                maxLines: 8,
                                decoration: InputDecoration(
                                  suffixIconColor: Colors.green[900],
                                  suffixIcon: state.mainStatus is OpenAiLoading
                                      ? const LoadingIndicator(
                                          indicatorType:
                                              Indicator.ballPulseSync,
                                          colors: [Colors.white],
                                          strokeWidth: 2,
                                        )
                                      : isSentButtonVisible
                                          ? IconButton(
                                              icon: const Icon(Icons.send),
                                              onPressed: () {
                                                if (_textController
                                                    .text.isNotEmpty) {
                                                  context
                                                      .read<OpenAiBloc>()
                                                      .add(
                                                        OpenAiRequestSubmitted(
                                                            _textController
                                                                .text),
                                                      );
                                                  _textController.clear();
                                                }
                                                FocusScope.of(context)
                                                    .requestFocus(FocusNode());
                                              },
                                            )
                                          : null,
                                  border: InputBorder.none,
                                  hintText: 'Введите текст..',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  isCollapsed: true,
                                  alignLabelWithHint: true,
                                  labelStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                                iconColor: Colors.green[900],
                                backgroundColor: Colors.grey,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return SizedBox(
                                      height: 120,
                                      child: MediaPopUp(
                                        onCamera: () {
                                          context.read<OpenAiBloc>().add(
                                                OpenAiCameraOpened(),
                                              );
                                          Navigator.pop(context);
                                        },
                                        onFiles: () {
                                          context.read<OpenAiBloc>().add(
                                                OpenAiMediaSelected(),
                                              );
                                          Navigator.pop(context);
                                        },
                                      ),
                                    );
                                  },
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24),
                                    ),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.green[900],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

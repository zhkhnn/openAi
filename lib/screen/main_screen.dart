import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_ai/bloc/open_ai_bloc.dart';
import 'package:open_ai/bloc/open_ai_event.dart';
import 'package:open_ai/bloc/open_ai_state.dart';
import 'package:open_ai/utils/get_it_instance.dart';

import '../widgets/media_pop_up.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _textController = TextEditingController();
  bool isSentButtonVisible = false;

  @override
  void initState() {
    super.initState();

    _textController.addListener(() {
      setState(() {
        isSentButtonVisible = _textController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.di<OpenAiBloc>(),
      child: MaterialApp(
        home: SafeArea(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
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
                          message:
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                          duration: const Duration(seconds: 3),
                        );
                      });
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.messages.length,
                          itemBuilder: (context, index) {
                            final message = state.messages[index];
                            final isUserMessage = message == state.response;
                            return Align(
                              alignment: isUserMessage
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                decoration: BoxDecoration(
                                  color: isUserMessage
                                      ? Colors.grey[300]
                                      : Colors.green,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    isUserMessage
                                        ? const Icon(Icons.person)
                                        : const Icon(Icons.flaky_outlined),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SelectableText(
                                      message.text,
                                      style: const TextStyle(
                                        color: Colors.black,
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
                                  decoration: const InputDecoration(
                                    hintText: 'Введите текст..',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    isCollapsed: true,
                                    labelText: 'Введите текст..',
                                    alignLabelWithHint: true,
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    hintStyle: TextStyle(
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
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.7,
                                          child: MediaPopUp(
                                            onCamera: () {
                                              context
                                                  .read<OpenAiBloc>()
                                                  .add(OpenAiCameraOpened());
                                            },
                                            onFiles: () {
                                              context
                                                  .read<OpenAiBloc>()
                                                  .add(OpenAiMediaSelected());
                                            },
                                          ));
                                    },
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24),
                                      ),
                                    ),
                                  );
                                },
                                child: const Icon(Icons.camera_alt_rounded),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            if (isSentButtonVisible)
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.center,
                                  ),
                                  onPressed: () {
                                    if (_textController.text.isNotEmpty) {
                                      context.read<OpenAiBloc>().add(
                                            OpenAiRequestSubmitted(
                                                _textController.text),
                                          );
                                      _textController.clear();
                                      FocusScope.of(context).unfocus();
                                    }
                                  },
                                  child: const Icon(Icons.arrow_forward),
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
      ),
    );
  }
}

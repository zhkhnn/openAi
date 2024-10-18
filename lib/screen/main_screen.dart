import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_ai/bloc/open_ai_bloc.dart';
import 'package:open_ai/bloc/open_ai_state.dart';
import 'package:open_ai/get_it_instance.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.di<OpenAiBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Чат'),
        ),
        body: BlocBuilder<OpenAiBloc, OpenAiState>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Введите текст..',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
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
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Icon(Icons.camera_alt_rounded),
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:open_ai/screen/chat_screen.dart';
import 'package:open_ai/utils/set_up_dependencies.dart';

void main() {
  setupDependencies();
  runApp(const ChatScreen());
}

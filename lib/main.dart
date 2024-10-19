import 'package:flutter/material.dart';
import 'package:open_ai/screen/main_screen.dart';
import 'package:open_ai/utils/set_up_dependencies.dart';

void main() {
  setupDependencies();
  runApp(const MainScreen());
}

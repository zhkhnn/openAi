import 'package:flutter/material.dart';
import 'package:open_ai/screen/main_screen.dart';
import '../utils/get_it_instance.dart';

void main() {
  setupDependencies();
  runApp(const MainScreen());
}

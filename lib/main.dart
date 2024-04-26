import 'package:flutter/material.dart';
import 'package:todo_app/features/auth/pages/login.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:todo_app/features/todo/todo.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const LoginPage(),
      home: const TodoPage(),
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
    );
  }
}

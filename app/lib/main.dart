import 'package:flutter/material.dart';
import 'package:sign_in/sign_in.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: SignInPage())),
    );
  }
}

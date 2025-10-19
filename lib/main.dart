import 'package:app_canchitas_2025/presentation/auth/pages/signup.dart';
import 'package:app_canchitas_2025/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage()
    );
  }
}
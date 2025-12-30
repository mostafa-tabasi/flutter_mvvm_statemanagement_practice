import 'package:flutter/material.dart';
import 'package:flutter_mvvm_statemanagement_practice/widgets/error_message.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorMessage(errorText: "errorText", retryFunction: () {}),
    );
  }
}

import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  // final String title;
    // ForgotPasswordScreen(this.title, {super.key})
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Forgot Password"),),);
  }
}
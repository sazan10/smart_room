import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  // final String title;
    // DashboardScreen(this.title, {super.key})
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Dashboard"),),);
  }
}
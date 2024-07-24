import 'package:flutter/material.dart';
import 'package:practica1/widgets/appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarWidget(),
      body: const Center(
        child: const Text("home"),
      ),
    );
  }
}

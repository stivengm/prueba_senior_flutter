import 'package:flutter/material.dart';

class LoaderApp extends StatelessWidget {
  const LoaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
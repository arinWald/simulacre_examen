import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int correctAnswers;
  final int wrongAnswers;

  const ResultScreen({
    Key? key,
    required this.correctAnswers,
    required this.wrongAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultats"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Encerts: $correctAnswers"),
          Text("Errors: $wrongAnswers"),
        ],
      ),
    );
  }
}

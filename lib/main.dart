import 'package:flutter/material.dart';
import 'package:simulacre_examen/screens/question_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Qüestionari App',
      home: QuestionScreen(),
    );
  }
}

import 'dart:convert';
import 'package:flutter/services.dart';
import 'question.dart';

Future<List<Question>> llegirDades() async {
  final jsonText = await rootBundle.loadString("assets/questions.json");
  final List<dynamic> rawPreguntes = json.decode(jsonText);

  List<Question> preguntes = [];
  for (var rawPregunta in rawPreguntes) {
    preguntes.add(
      Question(
        enunciat: rawPregunta['enunciat'],
        opcions: List<String>.from(rawPregunta['opcions']),
        correctOptionIndex: rawPregunta['correctOptionIndex'],
      ),
    );
  }

  return preguntes;
}

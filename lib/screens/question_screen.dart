// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:simulacre_examen/question.dart';
import 'result_screen.dart'; // Importa la nova pantalla
import 'package:simulacre_examen/json_reader.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late List<Question> questions = [];
  int currentIndex = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    questions = await llegirDades();
    setState(() {});
  }

  void answerQuestion(int selectedOptionIndex) {
    if (selectedOptionIndex == questions[currentIndex].correctOptionIndex) {
      // Respota correcta
      correctAnswers++;
    } else {
      // Respota incorrecta
      wrongAnswers++;
    }

    // Avançar a la següent pregunta
    setState(() {
      currentIndex++;
    });

    // Comprovar si s'han contestat totes les preguntes
    if (currentIndex == questions.length) {
      // Redirigir a la pantalla de resultats
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            correctAnswers: correctAnswers,
            wrongAnswers: wrongAnswers,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      // Pots mostrar un indicador de càrrega o qualsevol altra cosa mentre es carreguen les preguntes
      return Scaffold(
        appBar: AppBar(
          title: const Text("Question"),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Question"),
      ),
      body: Column(
        children: [
          Text(
              "Pregunta ${currentIndex + 1}: ${currentIndex < questions.length ? questions[currentIndex].enunciat : 'Totes les preguntes han estat contestades'}"),
          Column(
            children: currentIndex < questions.length
                ? List.generate(
                    questions[currentIndex].opcions.length,
                    (index) => RadioListTile(
                      title: Text(questions[currentIndex].opcions[index]),
                      value: index,
                      groupValue: null,
                      onChanged: (value) => answerQuestion(value ?? -1),
                    ),
                  )
                : [const Text("Totes les preguntes han estat contestades")],
          ),
        ],
      ),
    );
  }
}

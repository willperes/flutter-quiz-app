import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  int activeScreen = 0;
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 1;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 2;
      });
    }
  }

  void handleRestartQuiz() {
    setState(() {
      activeScreen = 0;
      selectedAnswers = [];
    });
  }

  Widget getCurrentScreen() {
    switch (activeScreen) {
      case 1:
        return QuestionsScreen(
          onSelectAnswer: chooseAnswer,
        );
      case 2:
        return ResultsScreen(
          chosenAnswers: selectedAnswers,
          onRestartQuiz: handleRestartQuiz,
        );
      default:
        return StartScreen(switchScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.indigo.shade900, Colors.indigo.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: getCurrentScreen(),
        ),
      ),
    );
  }
}

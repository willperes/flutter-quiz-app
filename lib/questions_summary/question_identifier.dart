import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {required this.questionNumber, required this.isCorrectAnswer, super.key});

  final int questionNumber;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        width: 30,
        margin: const EdgeInsets.only(right: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isCorrectAnswer ? Colors.green[400] : Colors.red[400],
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(questionNumber.toString(),
            style: GoogleFonts.lato(
              color: Colors.indigo.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            )));
  }
}

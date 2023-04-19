import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/questions_summary/question_identifier.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({required this.questionData, super.key});

  final Map<String, Object> questionData;

  @override
  Widget build(BuildContext context) {
    final bool isCorrectAnswer =
        questionData['user_answer'] == questionData['correct_answer'];

    final bool isLastItem =
        ((questionData['question_index'] as int) + 1) == questions.length;

    return Container(
      margin: EdgeInsets.only(bottom: isLastItem ? 0 : 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            questionNumber: (questionData['question_index'] as int) + 1,
            isCorrectAnswer: isCorrectAnswer,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questionData['question'] as String,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.blue[100],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  questionData['correct_answer'] as String,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: Colors.green[400],
                  ),
                ),
                Text(
                  questionData['user_answer'] as String,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: isCorrectAnswer ? Colors.blue[100] : Colors.red[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

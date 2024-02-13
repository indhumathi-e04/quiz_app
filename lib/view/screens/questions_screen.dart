import 'package:flutter/material.dart';
import 'package:quiz/view/widgets/questions.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Questions(questionNumber: 1),
        ],
      ),
    ));
  }
}

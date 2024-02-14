import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';
import 'package:quiz/view/widgets/custom_widgets/custom_button.dart';

import 'package:quiz/view/widgets/subject_questions.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({
    required this.sectionTitle,
    required this.questionsCount,
    super.key,
  });
  final int questionsCount;
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Questions"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CustomButton(
          buttonWidth: 320,
          buttonHeight: 32,
          isLoading: false,
          onPressed: () {
            // bool isFormValid = _formKey.currentState!.validate();
            // if (isFormValid) {
            //   Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (context) => SectionsScreen(
            //         sectionCount: sectionCount,
            //       ),
            //     ),
            //   );
            // }
          },
          buttonText: "Proceed",
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(UIConstants.defaultPadding),
          child: Column(
            children: [
              SubjectQuestions(
                subjectTitle: sectionTitle,
              )
            ],
          ),
        ));
  }
}

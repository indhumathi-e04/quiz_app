import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';

import 'package:quiz/view/widgets/custom_widgets/custom_button.dart';
import 'package:quiz/view/widgets/subjects.dart';

class SubjectScreen extends StatelessWidget {
  SubjectScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          size: UIConstants.defaultHeight,
        ),
        title: Text(
          "Subjects > NEET - 2024",
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            horizontal: UIConstants.defaultHeight * 2,
            vertical: UIConstants.defaultHeight * 2),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Subjects(
                subjectTitle: "Subject - 1",
              ),
              const SizedBox(
                height: UIConstants.defaultHeight,
              ),
              Subjects(
                subjectTitle: "Subject - 2",
              ),
              const SizedBox(
                height: UIConstants.defaultHeight,
              ),
              Subjects(
                subjectTitle: "Subject - 3",
              ),
              CustomButton(
                isLoading: false,
                onPressed: () {
                  if (!formKey.currentState!.validate()) {}
                },
                buttonText: "Submit",
              )
            ],
          ),
        ),
      ),
    );
  }
}

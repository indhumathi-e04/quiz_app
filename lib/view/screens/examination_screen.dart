import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';

import 'package:quiz/view/widgets/custom_widgets/custom_button.dart';
import 'package:quiz/view/widgets/examinations.dart';

class ExaminationScreen extends StatefulWidget {
  const ExaminationScreen({super.key});

  @override
  State<ExaminationScreen> createState() => _ExaminationScreenState();
}

class _ExaminationScreenState extends State<ExaminationScreen> {
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
          "Examinations",
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
                Examinations(),
                const SizedBox(
                  height: UIConstants.defaultHeight,
                ),
                CustomButton(
                  isLoading: false,
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {}
                  },
                  buttonText: "Submit",
                )
              ]),
        ),
      ),
    );
  }
}

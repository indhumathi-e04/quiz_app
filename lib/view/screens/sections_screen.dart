import "package:flutter/material.dart";
import "package:quiz/view/screens/questions_screen.dart";
import "package:quiz/view/widgets/custom_widgets/custom_button.dart";

import "../../constants/ui_constants.dart";
import "../widgets/sections.dart";

class SectionsScreen extends StatelessWidget {
  SectionsScreen({
    required this.sectionCount,
    super.key,
  });
  final int sectionCount;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Sections sections = const Sections();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sections",
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomButton(
        buttonWidth: 320,
        buttonHeight: 32,
        isLoading: false,
        onPressed: () {
          bool isFormValid = _formKey.currentState!.validate();
          // if (isFormValid) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => QuestionScreen(
          //         questionsCount: sections.questionCount,
          //       ),
          //     ),
          //   );
          // }
        },
        buttonText: "Proceed",
      ),
      body: Form(
        key: _formKey,
        child: ListView.separated(
          padding: const EdgeInsets.all(UIConstants.defaultHeight * 2),
          itemCount: sectionCount,
          separatorBuilder: (context, index) => const SizedBox(
            height: UIConstants.defaultHeight,
          ),
          itemBuilder: (context, index) => Sections(
            sectionsTitle: "Section-${index + 1}",
          ),
        ),
      ),
    );
  }
}

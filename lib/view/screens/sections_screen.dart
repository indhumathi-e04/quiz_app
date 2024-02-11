import "package:flutter/material.dart";
import "package:quiz/constants/ui_constants.dart";

import "package:quiz/view/widgets/custom_button.dart";

import "package:quiz/view/widgets/sections.dart";

class SectionsScreen extends StatelessWidget {
  SectionsScreen({super.key});
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
          "Sections",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: UIConstants.defaultHeight * 2,
            vertical: UIConstants.defaultHeight * 2,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Sections(
                  sectionsTitle: "Section - 1",
                ),
                const SizedBox(
                  height: UIConstants.defaultHeight,
                ),
                Sections(
                  sectionsTitle: "Section - 2",
                ),
                const SizedBox(
                  height: UIConstants.defaultHeight,
                ),
                CustomButton(
                  isLoading: false,
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {}
                  },
                  buttonText: "Proceed",
                )
              ],
            ),
          )),
    );
  }
}

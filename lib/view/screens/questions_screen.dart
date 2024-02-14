import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';
import 'package:quiz/models/sections_model.dart';
import 'package:quiz/view/widgets/custom_widgets/custom_button.dart';

import 'package:quiz/view/widgets/question_panel.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({
    required this.sectionModelList,
    super.key,
  });

  final List<SectionsModel> sectionModelList;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          bool isFormValid = _formKey.currentState!.validate();
          if (isFormValid) {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => SectionsScreen(
            //       sectionCount: sectionCount,
            //     ),
            //   ),
            // );
          }
        },
        buttonText: "Proceed",
      ),
      body: Form(
        key: _formKey,
        child: ListView.separated(
          padding: const EdgeInsets.all(
            UIConstants.defaultHeight * 2,
          ),
          itemCount: sectionModelList.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: UIConstants.defaultHeight,
          ),
          itemBuilder: (context, index) => QuestionPanel(
            sectionTitle: sectionModelList[index].sectionTitle ?? "",
            questionCount: sectionModelList[index].questionCount ?? 0,
          ),
        ),
      ),
    );
  }
}

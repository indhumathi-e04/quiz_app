import "package:flutter/material.dart";
import "package:quiz/models/sections_model.dart";
import "package:quiz/view/widgets/custom_widgets/custom_button.dart";

import "../../constants/ui_constants.dart";
import "../widgets/sections.dart";
import "questions_screen.dart";

class SectionsScreen extends StatefulWidget {
  const SectionsScreen({
    required this.sectionCount,
    super.key,
  });
  final int sectionCount;

  @override
  State<SectionsScreen> createState() => _SectionsScreenState();
}

class _SectionsScreenState extends State<SectionsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<SectionsModel> sectionsModelList = [];

  @override
  void initState() {
    super.initState();
    sectionsModelList.addAll(
      List.generate(
        widget.sectionCount,
        (index) => SectionsModel(),
      ),
    );
  }

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
          if (isFormValid) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => QuestionScreen(
                  sectionModelList: sectionsModelList,
                ),
              ),
            );
          }
        },
        buttonText: "Proceed",
      ),
      body: Form(
        key: _formKey,
        child: ListView.separated(
          padding: const EdgeInsets.all(UIConstants.defaultHeight * 2),
          itemCount: widget.sectionCount,
          separatorBuilder: (context, index) => const SizedBox(
            height: UIConstants.defaultHeight,
          ),
          itemBuilder: (context, index) => Sections(
            sectionsTitle: "Section-${index + 1}",
            sectionsModel: sectionsModelList[index],
          ),
        ),
      ),
    );
  }
}

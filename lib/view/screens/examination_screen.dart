import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';

import 'package:quiz/view/widgets/custom_widgets/custom_button.dart';
import 'package:quiz/view/widgets/custom_widgets/custom_dropdownfield.dart';
import 'package:quiz/view/widgets/custom_widgets/custom_textformfield.dart';

class ExaminationScreen extends StatefulWidget {
  const ExaminationScreen({super.key});

  @override
  State<ExaminationScreen> createState() => _ExaminationScreenState();
}

class _ExaminationScreenState extends State<ExaminationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<DropDownFieldChoices> examCategoryList = [
    DropDownFieldChoices(id: 1, value: "school"),
    DropDownFieldChoices(id: 2, value: "College"),
    DropDownFieldChoices(id: 1, value: "primary")
  ];
  Exam exam = Exam();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Examinations",
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomButton(
        isLoading: false,
        onPressed: () {
          bool isFormValid = _formKey.currentState!.validate();
          if (isFormValid) {}
        },
        buttonText: "Submit",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(
          UIConstants.defaultPadding * 2,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomDropDownField(
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultHeight * 2,
                ),
                dropdownLabelText: "Exam Category",
                items: examCategoryList,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      exam.examCategory = value.id;
                    });
                  }
                },
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Choose Exam Category";
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultHeight * 2,
                ),
                labelText: "Exam Name",
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Please enter Exam Name";
                  } else {
                    if (value.trim().isEmpty) {
                      return "Field is required. Please enter Exam Name";
                    } else {
                      return null;
                    }
                  }
                },
              ),
              CustomTextFormField(
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultHeight * 2,
                ),
                labelText: "Exam Icon",
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Please enter exam icon";
                  } else {
                    if (value.trim().isEmpty) {
                      return "Field is required. Please enter exam icon";
                    } else {
                      return null;
                    }
                  }
                },
              ),
              CustomTextFormField(
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultHeight * 2,
                ),
                labelText: "Official website",
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Please enter official website";
                  } else {
                    if (value.trim().isEmpty) {
                      return "Field is required. Please enter offocial website";
                    } else {
                      return null;
                    }
                  }
                },
              ),
              CustomTextFormField(
                labelText: "Organizer",
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Please enter organizer";
                  } else {
                    if (value.trim().isEmpty) {
                      return "Field is required. Please enter organizer";
                    } else {
                      return null;
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Exam {
  int? examCategory;
}

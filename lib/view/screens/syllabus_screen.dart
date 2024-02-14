import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';
import 'package:quiz/models/syllabus_model.dart';
import 'package:quiz/view/screens/subject_screen.dart';

import 'package:quiz/view/widgets/custom_widgets/custom_button.dart';
import 'package:quiz/view/widgets/custom_widgets/custom_dropdownfield.dart';
import 'package:quiz/view/widgets/custom_widgets/custom_textformfield.dart';

class SyllabusScreen extends StatefulWidget {
  const SyllabusScreen({super.key});

  @override
  State<SyllabusScreen> createState() => _SyllabusScreenState();
}

class _SyllabusScreenState extends State<SyllabusScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<SyllabusModel> syllabusModelList = [];

  final List<DropDownFieldChoices> examCategoryList = [
    DropDownFieldChoices(id: 1, value: "school"),
    DropDownFieldChoices(id: 2, value: "College"),
    DropDownFieldChoices(id: 3, value: "primary")
  ];
  final List<DropDownFieldChoices> examName = [
    DropDownFieldChoices(id: 1, value: "NEET"),
    DropDownFieldChoices(id: 2, value: "JEE"),
    DropDownFieldChoices(id: 3, value: "TNPSC")
  ];
  SyllabusModel syllabus = SyllabusModel();
  int subjectCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Syllabus",
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomButton(
        isLoading: false,
        onPressed: () {
          bool isFormValid = _formKey.currentState!.validate();
          if (isFormValid) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SubjectScreen(
                  subjectCount: subjectCount,
                ),
              ),
            );
          }
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
                      syllabus.examCategory = value.id;
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
              CustomDropDownField(
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultHeight * 2,
                ),
                dropdownLabelText: "Exam Name",
                items: examName,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      syllabus.examName = value.id;
                    });
                  }
                },
                validator: (value) {
                  if (value == null) {
                    return "Field is require.Choose exam name";
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                onChanged: (value) {
                  setState(() {
                    syllabus.examYear = int.parse(value);
                  });
                },
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultHeight * 2,
                ),
                labelText: "Exam Year",
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Please enter exam year";
                  } else {
                    if (value.trim().isEmpty) {
                      return "Field is required. Please enter exam year";
                    } else {
                      return null;
                    }
                  }
                },
              ),
              CustomTextFormField(
                onChanged: (value) {
                  setState(() {
                    syllabus.syllabusLink = value;
                  });
                },
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultHeight * 2,
                ),
                labelText: "Official Syllabus Link",
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Please enter syllabus link";
                  } else {
                    if (value.trim().isEmpty) {
                      return "Field is required. Please enter syllabus link";
                    } else {
                      return null;
                    }
                  }
                },
              ),
              CustomTextFormField(
                onChanged: (value) {
                  subjectCount = int.parse(value);
                },
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultHeight * 2,
                ),
                labelText: "Subjects",
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Please enter subject count";
                  } else {
                    if (value.trim().isEmpty) {
                      return "Field is required. Please enter subject count";
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

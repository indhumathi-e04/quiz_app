import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';
import 'package:quiz/view/widgets/custom_dropdownfield.dart';
import 'package:quiz/view/widgets/custom_textformfield.dart';

class Syllabus extends StatefulWidget {
  Syllabus({super.key});
  ExamName examName = ExamName();

  @override
  State<Syllabus> createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 682,
      child: Column(
        children: [
          CustomTextFormField(
            labelText: "Exam Category",
            validator: (value) {
              if (value == null) {
                return "Field is required. Please enter password";
              } else {
                if (value.trim().isEmpty) {
                  return "Field is required. Please enter password";
                } else {
                  return null;
                }
              }
            },
          ),
          const SizedBox(
            height: UIConstants.defaultHeight * 2,
          ),
          CustomDropDownField(
            dropdownLabelText: "Exam Name",
            items: const ["NEET", "JEE"],
            value: widget.examName.examName,
            onChanged: (value) {
              setState(() {
                widget.examName.examName = value as String?;
              });
            },
            validator: (value) {
              if (value == null) {
                return "Field is required";
              }
              return null;
            },
          ),
          const SizedBox(
            height: UIConstants.defaultHeight * 2,
          ),
          CustomTextFormField(
            labelText: "Exam Year",
            validator: (value) {
              if (value == null) {
                return "Field is required. Please enter password";
              } else {
                if (value.trim().isEmpty) {
                  return "Field is required. Please enter password";
                } else {
                  return null;
                }
              }
            },
          ),
          const SizedBox(
            height: UIConstants.defaultHeight * 2,
          ),
          CustomTextFormField(
            labelText: "Official Syllabus Link",
            validator: (value) {
              if (value == null) {
                return "Field is required. Please enter password";
              } else {
                if (value.trim().isEmpty) {
                  return "Field is required. Please enter password";
                } else {
                  return null;
                }
              }
            },
          ),
          const SizedBox(
            height: UIConstants.defaultHeight * 2,
          ),
          CustomTextFormField(
            labelText: "Subjects",
            validator: (value) {
              if (value == null) {
                return "Field is required. Please enter password";
              } else {
                if (value.trim().isEmpty) {
                  return "Field is required. Please enter password";
                } else {
                  return null;
                }
              }
            },
          )
        ],
      ),
    );
  }
}

class ExamName {
  String? examName;
}

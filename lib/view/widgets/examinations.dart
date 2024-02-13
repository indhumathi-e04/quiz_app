import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';
import 'package:quiz/view/widgets/custom_widgets/custom_dropdownfield.dart';
import 'package:quiz/view/widgets/custom_widgets/custom_textformfield.dart';

class Examinations extends StatefulWidget {
  Examinations({super.key});
  Exam exam = Exam();

  @override
  State<Examinations> createState() => _ExaminationsState();
}

class _ExaminationsState extends State<Examinations> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 682,
      //color: Colors.blueGrey,
      child: Column(
        children: [
          CustomDropDownField(
            dropdownLabelText: "Exam Category",
            items: [DropDownFieldChoices(id: 1, value: "school")],
            onChanged: (value) {
              setState(() {
                widget.exam.examCategory = value as String?;
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
            labelText: "Exam Name",
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
            labelText: "Exam Icon",
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
            labelText: "Official website",
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
            labelText: "Organizer",
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

class Exam {
  String? examCategory;
}

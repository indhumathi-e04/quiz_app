import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';
import 'package:quiz/view/widgets/custom_dropdownfield.dart';
import 'package:quiz/view/widgets/custom_textformfield.dart';
import 'package:quiz/view/widgets/options.dart';

class Questions extends StatefulWidget {
  Questions({required this.questionNumber, super.key});
  int questionNumber;
  QuestionType questionType = QuestionType();

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int i, bool _) {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.zero,
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (context, isExpanded) {
            return Container(
              height: 56,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: UIConstants.defaultBorderRadius,
                color: Colors.blueGrey,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: UIConstants.defaultPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Question - + widget.questionnumber")],
              ),
            );
          },
          isExpanded: isExpanded,
          body: Container(
            height: 1054,
            width: 300,
            padding: const EdgeInsets.symmetric(
                horizontal: UIConstants.defaultHeight),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: UIConstants.defaultBorderRadius,
            ),
            child: Column(
              children: [
                const Text(
                    "Choose the desired question type from the drop-down menu and then add the content of the question accordin to that choice"),
                const SizedBox(
                  height: UIConstants.defaultHeight,
                ),
                CustomDropDownField(
                  dropdownLabelText: "Question Type",
                  items: const [
                    "Multiple Choice(4 Options)",
                    "Fill in the blanks",
                    "True or False"
                  ],
                  value: widget.questionType.questionType,
                  onChanged: (value) {
                    setState(() {
                      widget.questionType.questionType = value as String?;
                    });
                  },
                ),
                const SizedBox(
                  height: UIConstants.defaultHeight,
                ),
                CustomTextFormField(
                  maxlines: 15,
                  labelText: "Question",
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
                Options(optionNumber: "1"),
                Options(optionNumber: "2"),
                Options(optionNumber: "3"),
                Options(optionNumber: "4"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class QuestionType {
  String? questionType;
}

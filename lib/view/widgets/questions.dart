import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';
import 'package:quiz/view/widgets/custom_widgets/custom_dropdownfield.dart';
import 'package:quiz/view/widgets/custom_widgets/custom_multiline_textformfield.dart';

import 'package:quiz/view/widgets/options.dart';

class Questions extends StatefulWidget {
  const Questions({required this.questionTitle, super.key});
  final String questionTitle;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  bool isExpanded = false;
  QuestionType questionType = QuestionType();
  CorrectOptions correctOption = CorrectOptions();
  TrueOrFalse trueOrFalse = TrueOrFalse();
  List<DropDownFieldChoices> questionTypes = [
    DropDownFieldChoices(id: 1, value: "Multiple Choice"),
    DropDownFieldChoices(id: 2, value: "Fill in the blanks"),
    DropDownFieldChoices(id: 3, value: "True or False"),
  ];
  List<DropDownFieldChoices> correctOptions = [
    DropDownFieldChoices(id: 1, value: "1"),
    DropDownFieldChoices(id: 2, value: "2"),
    DropDownFieldChoices(id: 3, value: "3"),
    DropDownFieldChoices(id: 4, value: "4"),
  ];
  List<DropDownFieldChoices> trueOrFalseOption = [
    DropDownFieldChoices(id: 1, value: "True"),
    DropDownFieldChoices(id: 2, value: "False"),
  ];

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
          backgroundColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
          canTapOnHeader: true,
          headerBuilder: (context, isExpanded) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: UIConstants.defaultPadding,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.questionTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            );
          },
          isExpanded: isExpanded,
          body: Padding(
            padding: const EdgeInsets.all(
              UIConstants.defaultPadding,
            ),
            child: Column(
              children: [
                Text(
                  "Choose the desired question type from the drop-down menu and then add the content of the question accordin to that choice",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                CustomDropDownField(
                  margin: const EdgeInsets.symmetric(
                    vertical: UIConstants.defaultMargin * 2,
                  ),
                  dropdownLabelText: "Question Type",
                  items: questionTypes,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        questionType.questionType = value.id;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Field is necessary. Select the question type.";
                    }
                    return null;
                  },
                ),
                CustomMultiLineTextFormField(
                  labelText: "Question",
                  margin: const EdgeInsets.only(
                    bottom: UIConstants.defaultMargin * 2,
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Field is necessary. Enter question.";
                    } else {
                      if (value.trim().isEmpty) {
                        return "Field is necessary. Enter question.";
                      } else {
                        return null;
                      }
                    }
                  },
                ),
                Visibility(
                  visible: questionType.questionType == 1,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) => Options(
                      optionlabel: 'Opions-${index + 1}',
                    ),
                  ),
                ),
                Visibility(
                  visible: questionType.questionType == 1,
                  child: CustomDropDownField(
                    margin: const EdgeInsets.only(
                      bottom: UIConstants.defaultMargin * 2,
                    ),
                    dropdownLabelText: "Correct answer",
                    items: correctOptions,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          correctOption.correctOption = value.id;
                        });
                      }
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Field is necessary. Choose correct option.";
                      }
                      return null;
                    },
                  ),
                ),
                Visibility(
                  visible: questionType.questionType == 2,
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: UIConstants.defaultMargin * 2,
                    ),
                    child: CustomMultiLineTextFormField(
                      labelText: "Correct answer",
                      validator: (value) {
                        if (value == null) {
                          return "Field is necessary. Enter correct answer.";
                        } else {
                          if (value.trim().isEmpty) {
                            return "Field is necessary. Enter correct answer.";
                          } else {
                            return null;
                          }
                        }
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: questionType.questionType == 3,
                  child: CustomDropDownField(
                    margin: const EdgeInsets.only(
                      bottom: UIConstants.defaultMargin * 2,
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Field is necessary. Choose correct option.";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          trueOrFalse.trueOrFalse = value.id;
                        });
                      }
                    },
                    dropdownLabelText: "Correct answer",
                    items: trueOrFalseOption,
                  ),
                ),
                CustomMultiLineTextFormField(
                    validator: (value) {
                      if (value == null) {
                        return "Field is necessary. Enter solution & explanations.";
                      } else {
                        if (value.trim().isEmpty) {
                          return "Field is necessary. Enter solution & explanations.";
                        } else {
                          return null;
                        }
                      }
                    },
                    maxLines: 5,
                    labelText: "Solution & Explanation")
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class QuestionType {
  int? questionType;
}

class CorrectOptions {
  int? correctOption;
}

class TrueOrFalse {
  int? trueOrFalse;
}

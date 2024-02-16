import 'package:flutter/material.dart';
import 'package:quiz/models/questions_model.dart';
import '../widgets/custom_widgets/custom_textformfield.dart';

import '../../constants/ui_constants.dart';
import '../../models/sections_model.dart';
import '../widgets/custom_widgets/custom_elevated_button.dart';
import '../widgets/custom_widgets/custom_dropdownfield.dart';
import '../widgets/custom_widgets/custom_multiline_textformfield.dart';
import '../widgets/question_panel.dart';

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
      floatingActionButton: CustomElevatedButton(
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
            UIConstants.defaultHeight,
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

class SubjectQuestions extends StatefulWidget {
  const SubjectQuestions({
    required this.sectionTitle,
    required this.questionCount,
    super.key,
  });
  final String sectionTitle;
  final int questionCount;

  @override
  State<SubjectQuestions> createState() => _SubjectQuestionsState();
}

class _SubjectQuestionsState extends State<SubjectQuestions> {
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
                  widget.sectionTitle,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            );
          },
          isExpanded: isExpanded,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(
              UIConstants.defaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter each question information in the appropriate field and on the appropriate card. Alternatively, you can upload the document that has every detail related to the question.",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(height: 2),
                ),
                const SizedBox(
                  height: UIConstants.defaultHeight * 0.5,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Download Sample Document",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
                const SizedBox(
                  height: UIConstants.defaultHeight,
                ),
                CustomElevatedButton(
                  buttonWidth: 144,
                  buttonHeight: 32,
                  isLoading: false,
                  onPressed: () {},
                  buttonText: "Upload Document",
                ),
                const SizedBox(
                  height: UIConstants.defaultHeight,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: widget.questionCount,
                  itemBuilder: (context, index) =>
                      Questions(questionTitle: "Question -${index + 1}"),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: UIConstants.defaultHeight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Questions extends StatefulWidget {
  const Questions({required this.questionTitle, super.key});
  final String questionTitle;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  bool isExpanded = false;
  QuestionsModel questionType = QuestionsModel();
  QuestionsModel correctOption = QuestionsModel();
  QuestionsModel trueOrFalse = QuestionsModel();
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
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(height: 2),
                ),
                CustomDropDownField(
                  margin: const EdgeInsets.symmetric(
                    vertical: UIConstants.defaultMargin * 2,
                  ),
                  labelText: "Question Type",
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
                      optionlabel: 'Opions - ${index + 1}',
                    ),
                  ),
                ),
                Visibility(
                  visible: questionType.questionType == 1,
                  child: CustomDropDownField(
                    margin: const EdgeInsets.only(
                      bottom: UIConstants.defaultMargin * 2,
                    ),
                    labelText: "Correct Answer",
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
                      labelText: "Correct Answer",
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
                    labelText: "Correct Answer",
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

class Options extends StatefulWidget {
  const Options({required this.optionlabel, super.key});
  final String optionlabel;

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      margin: const EdgeInsets.only(
        bottom: UIConstants.defaultMargin * 2,
      ),
      labelText: widget.optionlabel,
      validator: (value) {
        if (value == null) {
          return "Field is required. Enter ${widget.optionlabel}";
        } else {
          if (value.trim().isEmpty) {
            return "Field is required. Enter ${widget.optionlabel}";
          } else {
            return null;
          }
        }
      },
    );
  }
}

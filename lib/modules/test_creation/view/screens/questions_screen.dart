import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../../models/question_model.dart';
import '../../../../models/section_model.dart';
import '../../../../view/widgets/custom_widgets/custom_dropdownfield.dart';
import '../../../../view/widgets/custom_widgets/custom_elevated_button.dart';
import '../../../../view/widgets/custom_widgets/custom_multiline_textformfield.dart';
import '../../../../view/widgets/custom_widgets/custom_outlined_button.dart';
import '../../../../view/widgets/custom_widgets/custom_textformfield.dart';
import '../view_model/questions_controller.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({super.key});

  final QuestionsController controller = Get.put<QuestionsController>(
    QuestionsController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questions"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomElevatedButton(
        buttonHeight: 50,
        isLoading: false,
        onPressed: () {
          bool isFormValid =
              controller.formKey.currentState?.validate() ?? false;
          if (isFormValid) {
            controller.formKey.currentState?.save();
          }
        },
        buttonText: "Proceed",
      ),
      body: Form(
        key: controller.formKey,
        child: ListView.separated(
          padding: const EdgeInsets.all(
            UIConstants.defaultHeight,
          ),
          itemCount: controller.testModel.sections?.length ?? 0,
          separatorBuilder: (context, index) => const SizedBox(
            height: UIConstants.defaultHeight,
          ),
          itemBuilder: (context, index) => SectionQuestionPanel(
            section: controller.testModel.sections?[index] ?? SectionModel(),
          ),
        ),
      ),
    );
  }
}

class SectionQuestionPanel extends StatelessWidget {
  const SectionQuestionPanel({
    required this.section,
    super.key,
  });
  final SectionModel section;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ExpansionPanelList(
        expansionCallback: (_, __) {
          section.isExpanded.value = !section.isExpanded.value;
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
                    section.sectionTitle ?? "",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              );
            },
            isExpanded: section.isExpanded.value,
            body: Padding(
              padding: const EdgeInsets.all(
                UIConstants.defaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter each question information in the appropriate field and on the appropriate card. Alternatively, you can upload the document that has every detail related to the question.",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          height: 2,
                        ),
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
                  CustomOutlinedButton(
                    buttonHeight: 40,
                    buttonWidth: UIConstants.defaultWidth * 15,
                    isLoading: false,
                    onPressed: () {},
                    buttonText: "Upload Document",
                  ),
                  const SizedBox(
                    height: UIConstants.defaultHeight,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: section.questions?.length ?? 0,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: UIConstants.defaultHeight,
                    ),
                    itemBuilder: (context, index) => QuestionPanel(
                      questionTitle: "Question -${index + 1}",
                      questionModel:
                          section.questions?[index] ?? QuestionModel(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionPanel extends StatelessWidget {
  const QuestionPanel({
    required this.questionTitle,
    required this.questionModel,
    super.key,
  });
  final String questionTitle;
  final QuestionModel questionModel;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ExpansionPanelList(
        expansionCallback: (_, __) {
          questionModel.isExpanded.value = !questionModel.isExpanded.value;
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
                    questionTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              );
            },
            isExpanded: questionModel.isExpanded.value,
            body: Padding(
              padding: const EdgeInsets.all(
                UIConstants.defaultPadding,
              ),
              child: Column(
                children: [
                  Text(
                    "Choose the desired question type from the drop-down menu and then add the content of the question according to that choice",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          height: 2,
                        ),
                  ),
                  const SizedBox(
                    height: UIConstants.defaultHeight,
                  ),
                  CustomMultiLineTextFormField(
                    labelText: "Question",
                    maxLines: 5,
                    onSaved: (value) {
                      if (value != null) {
                        questionModel.question = value;
                      }
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Field is necessary. Enter the question content.";
                      } else {
                        if (value.trim().isEmpty) {
                          return "Field is necessary. Enter the question content.";
                        } else {
                          return null;
                        }
                      }
                    },
                  ),
                  CustomDropDownField(
                    labelText: "Question Type",
                    items: UIConstants.questionTypes,
                    onSaved: (value) {
                      if (value != null) {
                        questionModel.questionType = value.id;
                      }
                    },
                    onChanged: (value) {
                      if (value != null) {
                        questionModel.selectedQuestionType.value = value.id;
                      }
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Field is necessary. Select the question type.";
                      }
                      return null;
                    },
                  ),
                  Visibility(
                    visible: questionModel.selectedQuestionType.value ==
                            UIConstants.multipleChoice4OptionsId ||
                        questionModel.selectedQuestionType.value ==
                            UIConstants.multipleChoice5OptionsId,
                    child: MultipleChoiceOptions(
                      questionModel: questionModel,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MultipleChoiceOptions extends StatelessWidget {
  const MultipleChoiceOptions({
    required this.questionModel,
    super.key,
  });
  final QuestionModel questionModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomMultiLineTextFormField(
          labelText: "Option-1",
          maxLines: 5,
          onSaved: (value) {
            if (value != null) {
              questionModel.option1 = value;
            }
          },
          validator: (value) {
            if (value == null) {
              return "Field is necessary. Enter the option content.";
            } else {
              if (value.trim().isEmpty) {
                return "Field is necessary. Enter the option content.";
              } else {
                return null;
              }
            }
          },
        ),
        CustomMultiLineTextFormField(
          labelText: "Option-2",
          maxLines: 5,
          onSaved: (value) {
            if (value != null) {
              questionModel.option2 = value;
            }
          },
          validator: (value) {
            if (value == null) {
              return "Field is necessary. Enter the option content.";
            } else {
              if (value.trim().isEmpty) {
                return "Field is necessary. Enter the option content.";
              } else {
                return null;
              }
            }
          },
        ),
        CustomMultiLineTextFormField(
          labelText: "Option-3",
          maxLines: 5,
          onSaved: (value) {
            if (value != null) {
              questionModel.option3 = value;
            }
          },
          validator: (value) {
            if (value == null) {
              return "Field is necessary. Enter the option content.";
            } else {
              if (value.trim().isEmpty) {
                return "Field is necessary. Enter the option content.";
              } else {
                return null;
              }
            }
          },
        ),
        CustomMultiLineTextFormField(
          labelText: "Option-4",
          maxLines: 5,
          onSaved: (value) {
            if (value != null) {
              questionModel.option4 = value;
            }
          },
          validator: (value) {
            if (value == null) {
              return "Field is necessary. Enter the option content.";
            } else {
              if (value.trim().isEmpty) {
                return "Field is necessary. Enter the option content.";
              } else {
                return null;
              }
            }
          },
        ),
        Obx(
          () => Visibility(
            visible: questionModel.selectedQuestionType.value ==
                UIConstants.multipleChoice5OptionsId,
            child: CustomMultiLineTextFormField(
              labelText: "Option-5",
              maxLines: 5,
              onSaved: (value) {
                if (value != null) {
                  questionModel.option5 = value;
                }
              },
              validator: (value) {
                if (value == null) {
                  return "Field is necessary. Enter the option content.";
                } else {
                  if (value.trim().isEmpty) {
                    return "Field is necessary. Enter the option content.";
                  } else {
                    return null;
                  }
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

class FillInTheBlanksCorrectAnswer extends StatelessWidget {
  const FillInTheBlanksCorrectAnswer({
    required this.questionModel,
    super.key,
  });
  final QuestionModel questionModel;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: "Correct Answer",
      onSaved: (value) {
        if (value != null) {
          questionModel.fillInTheBlanksCorrectAnswer = value;
        }
      },
      validator: (value) {
        if (value == null) {
          return "Field is necessary. Enter the correct answer.";
        } else {
          if (value.trim().isEmpty) {
            return "Field is necessary. Enter the correct answer.";
          } else {
            return null;
          }
        }
      },
    );
  }
}

class TrueOrFalseCorrectAnswer extends StatelessWidget {
  const TrueOrFalseCorrectAnswer({
    required this.questionModel,
    super.key,
  });

  final QuestionModel questionModel;

  @override
  Widget build(BuildContext context) {
    return CustomDropDownField(
      labelText: "Correct answer",
      items: UIConstants.trueOrFalseOptions,
      onSaved: (value) {
        if (value != null) {
          questionModel.trueOrFalseCorrectAnswer = value.id;
        }
      },
      validator: (value) {
        if (value == null) {
          return "Field is necessary. Enter the correct answer.";
        } else {
          return null;
        }
      },
    );
  }
}

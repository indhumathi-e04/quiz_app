import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../../models/question_model.dart';
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(UIConstants.defaultPadding),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter each question information in the appropriate field and on the appropriate card. Alternatively, you can upload the document that has every detail related to the question.",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            height: 1.5,
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
                    Text(
                      "Question Numbers",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(
                      height: UIConstants.defaultHeight,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        controller.testModel.sections?.length ?? 0,
                        (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.testModel.sections?[index]
                                      .sectionTitle ??
                                  "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            RichText(
                              text: TextSpan(
                                style: Theme.of(context).textTheme.bodyMedium,
                                children: [
                                  TextSpan(
                                    text:
                                        "Question - ${(controller.testModel.sections?[index].firstQuestionIndex ?? 0) + 1}",
                                  ),
                                  TextSpan(
                                    text: (controller.testModel.sections?[index]
                                                    .lastQuestionIndex ??
                                                0) !=
                                            (controller
                                                    .testModel
                                                    .sections?[index]
                                                    .firstQuestionIndex ??
                                                0)
                                        ? " to  Question - ${(controller.testModel.sections?[index].lastQuestionIndex ?? 0) + 1}"
                                        : "",
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: UIConstants.defaultHeight,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: UIConstants.defaultHeight,
                    ),
                    ...List.generate(
                      controller.testModel.questions?.length ?? 0,
                      (index) => Container(
                        margin: const EdgeInsets.only(
                          bottom: UIConstants.defaultHeight,
                        ),
                        child: QuestionPanel(
                          questionTitle: "Question - ${index + 1}",
                          questionModel:
                              controller.testModel.questions?[index] ??
                                  QuestionModel(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomElevatedButton(
            buttonHeight: 50,
            isLoading: false,
            onPressed: controller.onFormSubmitted,
            buttonText: "Proceed",
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
    return ExpansionTile(
      initiallyExpanded: true,
      maintainState: true,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      title: Text(
        questionTitle,
        style: Theme.of(context).textTheme.displaySmall,
      ),
      children: [
        Text(
          "Choose the desired question type from the drop-down menu and then add the content of the question according to that choice",
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                height: 1.5,
              ),
        ),
        const SizedBox(
          height: UIConstants.defaultHeight,
        ),
        CustomMultiLineTextFormField(
          labelText: "Question",
          initialValue: questionModel.question,
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
          value: questionModel.questionType,
          onSaved: (value) {
            if (value != null) {
              questionModel.questionType = value.id;
            }
          },
          onChanged: (value) {
            if (value != null) {
              questionModel.selectedQuestionType.value = value.id;
              questionModel.multipleChoiceCorrectOption = null;
              questionModel.fillInTheBlanksCorrectAnswer = null;
              questionModel.trueOrFalseCorrectAnswer = null;
            }
          },
          validator: (value) {
            if (value == null) {
              return "Field is necessary. Select the question type.";
            }
            return null;
          },
        ),
        Obx(
          () => Visibility(
            visible: questionModel.selectedQuestionType.value ==
                    UIConstants.multipleChoice4OptionsId ||
                questionModel.selectedQuestionType.value ==
                    UIConstants.multipleChoice5OptionsId,
            child: Column(
              children: [
                MultipleChoiceOptions(
                  questionModel: questionModel,
                ),
                questionModel.selectedQuestionType.value ==
                        UIConstants.multipleChoice5OptionsId
                    ? MultipleChoiceCorrectAnswer5Options(
                        questionModel: questionModel,
                      )
                    : MultipleChoiceCorrectAnswer4Options(
                        questionModel: questionModel,
                      ),
              ],
            ),
          ),
        ),
        Obx(
          () => Visibility(
            visible: questionModel.selectedQuestionType.value ==
                    UIConstants.fillInTheBlanksId ||
                questionModel.selectedQuestionType.value ==
                    UIConstants.digitFillerId,
            child: FillInTheBlanksCorrectAnswer(
              questionModel: questionModel,
            ),
          ),
        ),
        Obx(
          () => Visibility(
            visible: questionModel.selectedQuestionType.value ==
                UIConstants.trueOrFalseId,
            child: TrueOrFalseCorrectAnswer(
              questionModel: questionModel,
            ),
          ),
        ),
        CustomMultiLineTextFormField(
          labelText: "Solution Explanation",
          initialValue: questionModel.solutionExplanation,
          maxLines: 5,
          onSaved: (value) {
            if (value != null) {
              questionModel.solutionExplanation = value;
            }
          },
        ),
      ],
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
          initialValue: questionModel.option1,
          maxLines: 2,
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
          initialValue: questionModel.option2,
          maxLines: 2,
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
          initialValue: questionModel.option3,
          maxLines: 2,
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
          initialValue: questionModel.option4,
          maxLines: 2,
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
              initialValue: questionModel.option5,
              maxLines: 2,
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

class MultipleChoiceCorrectAnswer4Options extends StatelessWidget {
  const MultipleChoiceCorrectAnswer4Options({
    required this.questionModel,
    super.key,
  });

  final QuestionModel questionModel;

  @override
  Widget build(BuildContext context) {
    return CustomDropDownField(
      labelText: "Correct answer",
      items: UIConstants.multipleChoiceCorrectAnswer4Options,
      value: questionModel.multipleChoiceCorrectOption,
      onChanged: (value) {
        if (value != null) {
          questionModel.multipleChoiceCorrectOption = value.id;
        }
      },
      onSaved: (value) {
        if (value != null) {
          questionModel.multipleChoiceCorrectOption = value.id;
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

class MultipleChoiceCorrectAnswer5Options extends StatelessWidget {
  const MultipleChoiceCorrectAnswer5Options({
    required this.questionModel,
    super.key,
  });

  final QuestionModel questionModel;

  @override
  Widget build(BuildContext context) {
    return CustomDropDownField(
      labelText: "Correct answer",
      items: UIConstants.multipleChoiceCorrectAnswer5Options,
      value: questionModel.multipleChoiceCorrectOption,
      onChanged: (value) {
        if (value != null) {
          questionModel.multipleChoiceCorrectOption = value.id;
        }
      },
      onSaved: (value) {
        if (value != null) {
          questionModel.multipleChoiceCorrectOption = value.id;
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
      initialValue: questionModel.fillInTheBlanksCorrectAnswer,
      keyboardType:
          questionModel.selectedQuestionType.value == UIConstants.digitFillerId
              ? const TextInputType.numberWithOptions(
                  signed: true,
                  decimal: true,
                )
              : TextInputType.text,
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
            if (questionModel.selectedQuestionType.value ==
                UIConstants.digitFillerId) {
              try {
                double.parse(value.trim());
                return null;
              } catch (_) {
                return "Enter valid correct answer";
              }
            }
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
      value: questionModel.trueOrFalseCorrectAnswer,
      onChanged: (value) {
        if (value != null) {
          questionModel.trueOrFalseCorrectAnswer = value.id;
        }
      },
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

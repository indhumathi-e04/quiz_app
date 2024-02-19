import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/ui_constants.dart';
import '../../../../../models/question_model.dart';
import '../../../../../models/section_model.dart';
import '../../../../../theme/app_colors.dart';
import '../../../../common/view/widgets/custom_widgets/custom_textformfield.dart';
import '../../view_model/test_attempt_controller.dart';
import 'multiple_choice_option.dart';
import 'true_or_false_option.dart';

class QuestionBody extends StatelessWidget {
  QuestionBody({
    required this.index,
    super.key,
  });

  final int index;
  final TestAttemptController controller = Get.find<TestAttemptController>();

  @override
  Widget build(BuildContext context) {
    SectionModel? currentSection = controller.getSection(index);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(
        UIConstants.defaultPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.1),
                      ),
                      padding: const EdgeInsets.all(UIConstants.defaultPadding),
                      child: Center(
                        child: Text(
                          "${index + 1}",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: UIConstants.defaultHeight,
                    ),
                    Text(
                      "+ ${currentSection?.positiveMarks ?? ""}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppDarkColors.lightGreen
                                    : AppLightColors.green,
                          ),
                    ),
                    const SizedBox(
                      width: UIConstants.defaultHeight,
                    ),
                    Text(
                      "- ${currentSection?.negativeMarks ?? ""}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppDarkColors.red
                                    : AppLightColors.red,
                          ),
                    ),
                  ],
                ),
              ),
              controller.isSolutionView
                  ? (controller.testModel.questions?[index].userChoiceModel
                              .isMarkedForReview?.value ??
                          false)
                      ? const Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                            ),
                            SizedBox(
                              width: UIConstants.defaultHeight * 0.5,
                            ),
                            Text(
                              "Marked for Review",
                            ),
                          ],
                        )
                      : const SizedBox.shrink()
                  : Obx(
                      () => TextButton(
                        onPressed: () {
                          controller.testModel.questions?[index].userChoiceModel
                              .isMarkedForReview?.value = !(controller
                                  .testModel
                                  .questions?[index]
                                  .userChoiceModel
                                  .isMarkedForReview
                                  ?.value ??
                              true);
                        },
                        child: Row(
                          children: [
                            Icon(
                              controller
                                          .testModel
                                          .questions?[index]
                                          .userChoiceModel
                                          .isMarkedForReview
                                          ?.value ??
                                      false
                                  ? Icons.star_rounded
                                  : Icons.star_outline_rounded,
                            ),
                            const SizedBox(
                              width: UIConstants.defaultHeight * 0.5,
                            ),
                            Text(
                              controller
                                          .testModel
                                          .questions?[index]
                                          .userChoiceModel
                                          .isMarkedForReview
                                          ?.value ??
                                      false
                                  ? "Marked for Review"
                                  : "Mark for Review",
                            ),
                          ],
                        ),
                      ),
                    ),
              const SizedBox(
                width: UIConstants.defaultWidth,
              ),
              !controller.isSolutionView
                  ? (controller.testModel.questions?[index].questionType ==
                              UIConstants.multipleChoice4OptionsId ||
                          controller.testModel.questions?[index].questionType ==
                              UIConstants.multipleChoice5OptionsId ||
                          controller.testModel.questions?[index].questionType ==
                              UIConstants.trueOrFalseId)
                      ? TextButton(
                          onPressed: () {
                            controller
                                .testModel.questions?[index].userChoiceModel
                                .clearResponse();
                          },
                          style: ButtonStyle(
                            iconColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).colorScheme.error,
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).colorScheme.error,
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.clear,
                              ),
                              SizedBox(
                                width: UIConstants.defaultHeight * 0.5,
                              ),
                              Text("Clear Response"),
                            ],
                          ),
                        )
                      : const SizedBox.shrink()
                  : const SizedBox.shrink(),
            ],
          ),
          const SizedBox(
            height: UIConstants.defaultHeight,
          ),
          Text(
            controller.testModel.questions?[index].question ?? "",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  height: 1.5,
                ),
          ),
          const SizedBox(
            height: UIConstants.defaultHeight,
          ),
          Visibility(
            visible: controller.testModel.questions?[index].questionType ==
                    UIConstants.multipleChoice4OptionsId ||
                controller.testModel.questions?[index].questionType ==
                    UIConstants.multipleChoice5OptionsId,
            child: MultipleChoiceAnswers(
              questionModel:
                  controller.testModel.questions?[index] ?? QuestionModel(),
              isSolutionView: controller.isSolutionView,
            ),
          ),
          Visibility(
            visible: controller.testModel.questions?[index].questionType ==
                    UIConstants.fillInTheBlanksId ||
                controller.testModel.questions?[index].questionType ==
                    UIConstants.digitFillerId,
            child: FillInTheBlanksAnswer(
              questionModel:
                  controller.testModel.questions?[index] ?? QuestionModel(),
              isSolutionView: controller.isSolutionView,
            ),
          ),
          Visibility(
            visible: controller.testModel.questions?[index].questionType ==
                UIConstants.trueOrFalseId,
            child: TrueOrFalseAnswers(
              questionModel:
                  controller.testModel.questions?[index] ?? QuestionModel(),
              isSolutionView: controller.isSolutionView,
            ),
          ),
        ],
      ),
    );
  }
}

class MultipleChoiceAnswers extends StatelessWidget {
  const MultipleChoiceAnswers({
    required this.questionModel,
    this.isSolutionView = false,
    super.key,
  });

  final QuestionModel questionModel;
  final bool isSolutionView;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          MultipleChoiceOption(
            index: 1,
            value: questionModel.option1 ?? "",
            onOptionSelection: (selectedIndex) {
              questionModel.userChoiceModel.selectedMultipleChoice?.value =
                  selectedIndex;
            },
            isOptionSelected:
                questionModel.userChoiceModel.selectedMultipleChoice?.value ==
                    1,
            isCorrectAnswer: questionModel.multipleChoiceCorrectOption == 1,
            isSolutionView: isSolutionView,
          ),
          MultipleChoiceOption(
            index: 2,
            value: questionModel.option2 ?? "",
            onOptionSelection: (selectedIndex) {
              questionModel.userChoiceModel.selectedMultipleChoice?.value =
                  selectedIndex;
            },
            isOptionSelected:
                questionModel.userChoiceModel.selectedMultipleChoice?.value ==
                    2,
            isCorrectAnswer: questionModel.multipleChoiceCorrectOption == 2,
            isSolutionView: isSolutionView,
          ),
          MultipleChoiceOption(
            index: 3,
            value: questionModel.option3 ?? "",
            onOptionSelection: (selectedIndex) {
              questionModel.userChoiceModel.selectedMultipleChoice?.value =
                  selectedIndex;
            },
            isOptionSelected:
                questionModel.userChoiceModel.selectedMultipleChoice?.value ==
                    3,
            isCorrectAnswer: questionModel.multipleChoiceCorrectOption == 3,
            isSolutionView: isSolutionView,
          ),
          MultipleChoiceOption(
            index: 4,
            value: questionModel.option4 ?? "",
            onOptionSelection: (selectedIndex) {
              questionModel.userChoiceModel.selectedMultipleChoice?.value =
                  selectedIndex;
            },
            isOptionSelected:
                questionModel.userChoiceModel.selectedMultipleChoice?.value ==
                    4,
            isCorrectAnswer: questionModel.multipleChoiceCorrectOption == 4,
            isSolutionView: isSolutionView,
          ),
          Visibility(
            visible: questionModel.questionType ==
                UIConstants.multipleChoice5OptionsId,
            child: MultipleChoiceOption(
              index: 5,
              value: questionModel.option5 ?? "",
              onOptionSelection: (selectedIndex) {
                questionModel.userChoiceModel.selectedMultipleChoice?.value =
                    selectedIndex;
              },
              isOptionSelected:
                  questionModel.userChoiceModel.selectedMultipleChoice?.value ==
                      5,
              isCorrectAnswer: questionModel.multipleChoiceCorrectOption == 5,
              isSolutionView: isSolutionView,
            ),
          ),
        ],
      ),
    );
  }
}

class FillInTheBlanksAnswer extends StatelessWidget {
  const FillInTheBlanksAnswer({
    required this.questionModel,
    this.isSolutionView = false,
    super.key,
  });

  final QuestionModel questionModel;
  final bool isSolutionView;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      isEnabled: isSolutionView ? false : true,
      labelText: "Your answer",
      margin: const EdgeInsets.only(top: UIConstants.defaultMargin),
      keyboardType: questionModel.questionType == UIConstants.digitFillerId
          ? const TextInputType.numberWithOptions(
              signed: true,
              decimal: true,
            )
          : TextInputType.text,
      initialValue: questionModel.userChoiceModel.fillInTheBlanksAnswer,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {
        questionModel.userChoiceModel.fillInTheBlanksAnswer = value.trim();
      },
      validator: (value) {
        if (value != null) {
          if (questionModel.questionType == UIConstants.digitFillerId) {
            try {
              double.parse(value.trim());
              return null;
            } catch (_) {
              return "Please enter only numbers as the answer.\nAllowed formats : 123, -123, 123.123, -123.01";
            }
          }
        }
        return null;
      },
    );
  }
}

class TrueOrFalseAnswers extends StatelessWidget {
  const TrueOrFalseAnswers({
    required this.questionModel,
    this.isSolutionView = false,
    super.key,
  });

  final QuestionModel questionModel;
  final bool isSolutionView;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          TrueOrFalseOption(
            index: 1,
            value: "True",
            onOptionSelection: (selectedIndex) {
              questionModel.userChoiceModel.selectedTrueOrFalseChoice?.value =
                  selectedIndex;
            },
            isOptionSelected: questionModel
                    .userChoiceModel.selectedTrueOrFalseChoice?.value ==
                1,
            isCorrectAnswer: questionModel.trueOrFalseCorrectAnswer == 1,
            isSolutionView: isSolutionView,
          ),
          TrueOrFalseOption(
            index: 0,
            value: "False",
            onOptionSelection: (selectedIndex) {
              questionModel.userChoiceModel.selectedTrueOrFalseChoice?.value =
                  selectedIndex;
            },
            isOptionSelected: questionModel
                    .userChoiceModel.selectedTrueOrFalseChoice?.value ==
                2,
            isCorrectAnswer: questionModel.trueOrFalseCorrectAnswer == 0,
            isSolutionView: isSolutionView,
          ),
        ],
      ),
    );
  }
}

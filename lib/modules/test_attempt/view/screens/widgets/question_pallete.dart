import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/ui_constants.dart';
import '../../../../../models/all_question_states.dart';
import '../../../../../models/user_choice_model.dart';
import '../../view_model/test_attempt_controller.dart';
import 'question_number.dart';

class QuestionPallete extends StatelessWidget {
  QuestionPallete({
    super.key,
  });

  final TestAttemptController controller = Get.find<TestAttemptController>();

  @override
  Widget build(BuildContext context) {
    final AllQuestionStates allQuestionStates = controller.getAllQuestionStates;
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              UIConstants.defaultPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.testModel.testTitle ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(
                  height: UIConstants.defaultHeight,
                ),
                Text(
                  "Click on the section tab to see individual status of the questions",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: controller.testModel.sections?.length ?? 0,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SectionPanel(
                    sectionTitle:
                        controller.testModel.sections?[index].sectionTitle ??
                            "",
                    sectionQuestionCount:
                        controller.testModel.sections?[index].questionCount ??
                            0,
                    previousSectionLastQuestionNumber: index == 0
                        ? 0
                        : (controller.testModel.sections?[index - 1]
                                    .lastQuestionIndex ??
                                0) +
                            1,
                    controller: controller,
                  );
                },
              ),
            ),
          ),
          const Divider(
            height: UIConstants.defaultHeight,
          ),
          Wrap(
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: UIConstants.defaultMargin * 0.5,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  QuestionNumber(
                    questionNumber: allQuestionStates.attempted,
                    questionState: QuestionUserStatus.attempted,
                    onQuestionTapped: () {},
                    isCurrentQuestion: false,
                  ),
                  Text(
                    "Attempted",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  QuestionNumber(
                    questionNumber: allQuestionStates.notAttempted,
                    questionState: QuestionUserStatus.notAttempted,
                    onQuestionTapped: () {},
                    isCurrentQuestion: false,
                  ),
                  Text(
                    "Not Attempted",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  QuestionNumber(
                    questionNumber:
                        allQuestionStates.attemptedAndMarkedForReview,
                    questionState:
                        QuestionUserStatus.attemptedAndMarkedForReview,
                    onQuestionTapped: () {},
                    isCurrentQuestion: false,
                  ),
                  Text(
                    "Attempted & Marked for Review",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  QuestionNumber(
                    questionNumber: allQuestionStates.markedForReview,
                    questionState: QuestionUserStatus.markedForReview,
                    onQuestionTapped: () {},
                    isCurrentQuestion: false,
                  ),
                  Text(
                    "Marked for Review",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  QuestionNumber(
                    questionNumber: controller.currentQuestion + 1,
                    questionState: QuestionUserStatus.notAttempted,
                    onQuestionTapped: () {},
                    isCurrentQuestion: true,
                  ),
                  Text(
                    "Current Question",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SectionPanel extends StatelessWidget {
  const SectionPanel({
    required this.sectionTitle,
    required this.sectionQuestionCount,
    required this.previousSectionLastQuestionNumber,
    required this.controller,
    super.key,
  });

  final String sectionTitle;
  final int sectionQuestionCount;
  final int previousSectionLastQuestionNumber;
  final TestAttemptController controller;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      maintainState: true,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sectionTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: UIConstants.defaultHeight * 0.5,
          ),
          Text(
            "Question Count : $sectionQuestionCount",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      children: [
        Wrap(
          children: List.generate(
            sectionQuestionCount,
            (index) => QuestionNumber(
              questionNumber: index + 1 + previousSectionLastQuestionNumber,
              questionState: controller
                      .testModel
                      .questions?[index + previousSectionLastQuestionNumber]
                      .userChoiceModel
                      .questionUserStatus ??
                  QuestionUserStatus.notAttempted,
              onQuestionTapped: () {
                controller.onQuestionTapped(
                  index + previousSectionLastQuestionNumber,
                );
              },
              isCurrentQuestion: controller.currentQuestion ==
                  index + previousSectionLastQuestionNumber,
            ),
          ),
        ),
      ],
    );
  }
}

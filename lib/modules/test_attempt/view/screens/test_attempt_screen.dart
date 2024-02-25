import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../../models/user_choice_model.dart';
import '../../../../theme/app_colors.dart';
import '../../../common/view/widgets/custom_widgets/custom_elevated_button.dart';
import '../../../common/view/widgets/custom_widgets/custom_outlined_button.dart';
import '../view_model/test_attempt_controller.dart';
import 'widgets/question_body.dart';
import 'widgets/question_pallete.dart';

class TestAttemptScreen extends StatelessWidget {
  TestAttemptScreen({
    super.key,
  });

  final TestAttemptController controller = Get.find<TestAttemptController>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {},
      child: Scaffold(
        key: controller.scaffoldKey,
        appBar: AppBar(
          title: Text(
            controller.testModel.testTitle ?? "",
          ),
          actions: [
            IconButton(
              onPressed: () {
                controller.scaffoldKey.currentState?.openEndDrawer();
              },
              padding: const EdgeInsets.symmetric(
                horizontal: UIConstants.defaultPadding,
              ),
              icon: const Icon(
                Icons.widgets_outlined,
              ),
            ),
          ],
        ),
        endDrawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: QuestionPallete(),
        ),
        body: Column(
          children: [
            controller.isSolutionView
                ? const SizedBox.shrink()
                : Container(
                    padding: const EdgeInsets.all(UIConstants.defaultPadding),
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Icon(
                                Icons.pause_circle_outline,
                              ),
                              SizedBox(
                                width: UIConstants.defaultHeight * 0.5,
                              ),
                              Text(
                                "Pause Test",
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.alarm,
                            ),
                            const SizedBox(
                              width: UIConstants.defaultHeight * 0.5,
                            ),
                            Obx(
                              () => Text(
                                "${controller.timerString} left",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: (value) {
                  controller.currentQuestion = value;
                  controller.removeFocus();
                },
                itemCount: controller.testModel.questions?.length ?? 0,
                itemBuilder: (context, index) => Column(
                  children: [
                    controller.isSolutionView
                        ? Container(
                            padding: const EdgeInsets.all(
                              UIConstants.defaultPadding,
                            ),
                            width: double.maxFinite,
                            color: controller
                                        .testModel
                                        .questions?[index]
                                        .userChoiceModel
                                        .questionEvaluationResult ==
                                    QuestionEvaluationResult.correct
                                ? Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? AppDarkColors.lightGreen
                                    : AppLightColors.green
                                : controller
                                            .testModel
                                            .questions?[index]
                                            .userChoiceModel
                                            .questionEvaluationResult ==
                                        QuestionEvaluationResult.incorrect
                                    ? Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppDarkColors.red
                                        : AppLightColors.red
                                    : Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppDarkColors.yellow
                                        : AppLightColors.yellow,
                            child: Row(
                              children: [
                                Icon(
                                  controller
                                              .testModel
                                              .questions?[index]
                                              .userChoiceModel
                                              .questionEvaluationResult ==
                                          QuestionEvaluationResult.correct
                                      ? Icons.check
                                      : controller
                                                  .testModel
                                                  .questions?[index]
                                                  .userChoiceModel
                                                  .questionEvaluationResult ==
                                              QuestionEvaluationResult.incorrect
                                          ? Icons.clear
                                          : Icons.error_outline_rounded,
                                ),
                                const SizedBox(
                                  width: UIConstants.defaultWidth,
                                ),
                                Text(
                                  controller
                                              .testModel
                                              .questions?[index]
                                              .userChoiceModel
                                              .questionEvaluationResult ==
                                          QuestionEvaluationResult.correct
                                      ? "Great ! Your answer is correct"
                                      : controller
                                                  .testModel
                                                  .questions?[index]
                                                  .userChoiceModel
                                                  .questionEvaluationResult ==
                                              QuestionEvaluationResult.incorrect
                                          ? "Your answer is incorrect"
                                          : "You haven't attempted this question",
                                ),
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                    QuestionBody(
                      index: index,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Theme.of(context).colorScheme.background,
              height: UIConstants.defaultHeight * 6,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(UIConstants.defaultPadding),
                      child: CustomOutlinedButton(
                        buttonText: "Submit Test",
                        onPressed: controller.onSubmitTestTapped,
                        isLoading: false,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(UIConstants.defaultPadding),
                      child: CustomElevatedButton(
                        buttonText: "Save & Next",
                        onPressed: controller.moveToNextQuestion,
                        isLoading: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

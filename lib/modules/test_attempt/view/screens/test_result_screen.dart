import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../../constants/utils.dart';
import '../../../common/view/widgets/custom_widgets/custom_elevated_button.dart';
import '../../../common/view/widgets/custom_widgets/custom_outlined_button.dart';
import '../../../common/view/widgets/linear_progress_bar.dart';
import '../../../common/view/widgets/name_badge.dart';
import '../view_model/test_result_controller.dart';

class TestResultScreen extends StatelessWidget {
  TestResultScreen({super.key});

  final TestResultController controller = Get.find<TestResultController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Results",
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: UIConstants.defaultPadding * 2,
              ),
              child: TextButton(
                onPressed: controller.onSolutionTapped,
                child: const Text(
                  "Solutions",
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(UIConstants.defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "NEET - 2023 Full Length Mock Test",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: UIConstants.defaultHeight * 0.5,
              ),
              const NameBadge(
                name: "Manimaran K V",
                isVerifiedUser: true,
              ),
              const SizedBox(
                height: UIConstants.defaultHeight,
              ),
              ResultCard(
                title: "Scored",
                value:
                    "${controller.testResultModel.securedMarks} / ${controller.testResultModel.totalMarks}",
                icon: Icons.check,
              ),
              const ResultCard(
                title: "Rank",
                value: "10 / 150",
                icon: Icons.star_outline,
              ),
              ResultCard(
                title: "Time Spent",
                value:
                    "${Utils.formattedTimeInHourMinSec(timeInSecond: controller.testResultModel.totalTimeSpent)} / ${Utils.formattedTimeInHourMinSec(timeInSecond: (controller.testModel.timeLimit ?? 0) * 60)}",
                icon: Icons.alarm_outlined,
              ),
              const SizedBox(
                height: UIConstants.defaultHeight,
              ),
              Text(
                "Question Distribution",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: UIConstants.defaultHeight * 2,
              ),
              MultiCircularSlider(
                trackWidth: UIConstants.defaultHeight,
                trackColor: Theme.of(context).colorScheme.tertiary,
                values: [
                  controller.testResultModel.correctAnswersCount /
                      (controller.testModel.questions?.length ?? 1),
                  controller.testResultModel.inCorrectAnswersCount /
                      (controller.testModel.questions?.length ?? 1),
                ],
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
                size: MediaQuery.of(context).size.width,
                progressBarType: MultiCircularSliderType.linear,
                showTotalPercentage: false,
              ),
              const SizedBox(
                height: UIConstants.defaultHeight * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: QuestionDistributionCard(
                      title: "Correct",
                      value: controller.testResultModel.correctAnswersCount
                          .toString(),
                      color: Theme.of(context).colorScheme.primary,
                      textColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  Expanded(
                    child: QuestionDistributionCard(
                      title: "Incorrect",
                      value: controller.testResultModel.inCorrectAnswersCount
                          .toString(),
                      color: Theme.of(context).colorScheme.secondary,
                      textColor: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  Expanded(
                    child: QuestionDistributionCard(
                      title: "UnAttempted",
                      value: controller.testResultModel.unAttemptedCount
                          .toString(),
                      color: Theme.of(context).colorScheme.tertiary,
                      textColor: Theme.of(context).colorScheme.onTertiary,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: UIConstants.defaultHeight * 2,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      buttonText: "Reattempt",
                      onPressed: () {},
                      isLoading: false,
                    ),
                  ),
                  const SizedBox(
                    width: UIConstants.defaultHeight,
                  ),
                  Expanded(
                    child: CustomOutlinedButton(
                      buttonText: "Share Scorecard",
                      onPressed: () {},
                      isLoading: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionDistributionCard extends StatelessWidget {
  const QuestionDistributionCard({
    required this.title,
    required this.value,
    required this.color,
    required this.textColor,
    super.key,
  });
  final String title;
  final String value;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(UIConstants.defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: textColor,
                ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: textColor,
                ),
          ),
        ],
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  const ResultCard({
    required this.title,
    required this.value,
    required this.icon,
    super.key,
  });
  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: UIConstants.defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(UIConstants.defaultPadding),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            ),
            child: Icon(
              icon,
            ),
          ),
          const SizedBox(
            width: UIConstants.defaultHeight * 0.5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

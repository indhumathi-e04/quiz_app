import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../common/view/widgets/custom_widgets/custom_dropdownfield.dart';
import '../../../common/view/widgets/custom_widgets/custom_elevated_button.dart';
import '../../../common/view/widgets/name_badge.dart';
import '../view_model/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController controller = Get.put<HomeController>(
    HomeController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(
            UIConstants.defaultPadding,
          ),
          child: const Placeholder(),
        ),
        title: Container(
          margin: const EdgeInsets.symmetric(
            vertical: UIConstants.defaultPadding * 6,
          ),
          padding: const EdgeInsets.only(
            top: UIConstants.defaultPadding * 2,
          ),
          child: CustomDropDownField(
            labelText: 'Exam Name',
            items: controller.examName,
            value: controller.homeModel.examName,
            onSaved: (value) {
              if (value != null) {
                controller.homeModel.examName = value.id;
              }
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: UIConstants.defaultPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                  width: 15,
                  child: Placeholder(),
                ),
                const SizedBox(
                  height: UIConstants.defaultHeight,
                ),
                Text(
                  "250 coins",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(
          UIConstants.defaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Section(
              title: "Continue Your Progress",
              subtitle: "Keep attempting the tests to make a progress",
              child: SizedBox(
                height: UIConstants.defaultHeight * 6,
                child: PageView.builder(
                  padEnds: true,
                  itemCount: 5,
                  itemBuilder: (context, index) => ResumeTestCard(
                    testDetails: TestDetailsModel(
                      testTitle: "NEET - 2023 Full Length Mock Test",
                      creatorName: "Manimaran K V",
                      isVerified: true,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: UIConstants.defaultHeight * 3,
            ),
            Section(
              title: "Latest Quizzes",
              actionTitle: "View all",
              child: SizedBox(
                height: UIConstants.defaultHeight * 25,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 120 / 240,
                  crossAxisSpacing: UIConstants.defaultMargin,
                  mainAxisSpacing: UIConstants.defaultMargin,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    5,
                    (index) {
                      return LatestQuizCard(
                        testDetails: TestDetailsModel(
                          testTitle: "NEET - 2023 Full Length Mock Test",
                          creatorName: "Manimaran K V",
                          isVerified: true,
                          totalQuestions: 10,
                          timeLimit: 90,
                          attemptsCount: 1500,
                          coins: 10,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: UIConstants.defaultHeight * 3,
            ),
            Section(
              title: "Trending Mock Tests (Exam Level)",
              subtitle:
                  "Attempt exam level tests to keep yourself matched with the exam",
              child: SizedBox(
                height: UIConstants.defaultHeight * 22,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return TrendingMockTestCard(
                      testDetails: TestDetailsModel(
                        testTitle: "NEET - 2023 Full Length Mock Test",
                        creatorName: "Manimaran K V",
                        isVerified: true,
                        totalQuestions: 10,
                        timeLimit: 90,
                        attemptsCount: 1500,
                        coins: 10,
                        totalMarks: 200,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: UIConstants.defaultHeight * 3,
            ),
            Section(
              title: "Attempt Previous Year Question",
              actionTitle: "View all",
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return PreviousYearQuestionsCard(
                    testDetails: TestDetailsModel(
                      testTitle: "NEET - 2023 Full Length Mock Test",
                      creatorName: "Manimaran K V",
                      isVerified: true,
                      totalQuestions: 10,
                      timeLimit: 90,
                      attemptsCount: 1500,
                      coins: 10,
                      totalMarks: 200,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: UIConstants.defaultHeight * 3,
            ),
            Section(
              title: "Subject-wise Tests",
              subtitle:
                  "Try to improve at subjects where you think you're not strong",
              actionTitle: "View all",
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 1,
                crossAxisSpacing: UIConstants.defaultMargin,
                mainAxisSpacing: UIConstants.defaultMargin,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                  6,
                  (index) {
                    return const SubjectWiseTestCard(
                      subject: "Chemistry",
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: UIConstants.defaultHeight * 3,
            ),
            Section(
              title: "Other Related Exams",
              child: SizedBox(
                height: UIConstants.defaultHeight * 10,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return const OtherExamCard(
                      examName: "NEET - UG",
                      testCount: 1000,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LatestQuizCard extends StatelessWidget {
  const LatestQuizCard({
    super.key,
    required this.testDetails,
  });
  final TestDetailsModel testDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        UIConstants.defaultPadding,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.1),
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
          ],
        ),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(
          UIConstants.defaultBorderRadius,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            testDetails.testTitle ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: UIConstants.defaultHeight * 0.5,
          ),
          NameBadge(
            name: testDetails.creatorName ?? "",
            isVerifiedUser: testDetails.isVerified ?? false,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${testDetails.totalQuestions ?? 0} questions",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.5),
                        ),
                  ),
                  const SizedBox(
                    height: UIConstants.defaultHeight * 0.3,
                  ),
                  Text(
                    "${testDetails.coins ?? 0} coins",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.5),
                        ),
                  ),
                  const SizedBox(
                    height: UIConstants.defaultHeight * 0.3,
                  ),
                  Text(
                    "${testDetails.timeLimit ?? 0} minutes",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.5),
                        ),
                  ),
                ],
              ),
              CustomElevatedButton(
                buttonHeight: UIConstants.defaultHeight * 2.5,
                buttonWidth: UIConstants.defaultWidth * 8,
                buttonText: "Attempt",
                onPressed: () {},
                isLoading: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PreviousYearQuestionsCard extends StatelessWidget {
  const PreviousYearQuestionsCard({
    super.key,
    required this.testDetails,
  });
  final TestDetailsModel testDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(UIConstants.defaultPadding),
      margin: const EdgeInsets.only(bottom: UIConstants.defaultMargin),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.05),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(
          UIConstants.defaultBorderRadius,
        ),
      ),
      height: UIConstants.defaultHeight * 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            testDetails.testTitle ?? "",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: UIConstants.defaultHeight * 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NameBadge(
                name: testDetails.creatorName ?? "",
                isVerifiedUser: testDetails.isVerified ?? false,
              ),
              Text(
                "${testDetails.totalQuestions ?? 0} questions",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.5),
                    ),
              ),
              Text(
                "${testDetails.coins ?? 0} coins",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.5),
                    ),
              ),
              Text(
                "${testDetails.attemptsCount ?? 0} attempts",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.5),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TrendingMockTestCard extends StatelessWidget {
  const TrendingMockTestCard({
    super.key,
    required this.testDetails,
  });
  final TestDetailsModel testDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: UIConstants.defaultWidth * 18,
      padding: const EdgeInsets.all(
        UIConstants.defaultPadding,
      ),
      margin: const EdgeInsets.only(
        right: UIConstants.defaultMargin,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.05),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(UIConstants.defaultBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            testDetails.testTitle ?? "",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: UIConstants.defaultHeight * 0.5,
          ),
          NameBadge(
            name: testDetails.creatorName ?? "",
            isVerifiedUser: testDetails.isVerified ?? false,
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(
              UIConstants.defaultPadding,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.1),
              borderRadius: BorderRadius.circular(
                UIConstants.defaultBorderRadius,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Questions",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    Text(
                      (testDetails.totalQuestions ?? 0).toString(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: UIConstants.defaultHeight * 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Marks",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    Text(
                      (testDetails.totalMarks ?? 0).toString(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: UIConstants.defaultHeight * 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Time Limit (minutes)",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    Text(
                      (testDetails.timeLimit ?? 0).toString(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: UIConstants.defaultHeight * 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Coins",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    Text(
                      (testDetails.coins ?? 0).toString(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          CustomElevatedButton(
            buttonHeight: UIConstants.defaultHeight * 3,
            buttonText: "Attempt",
            onPressed: () {},
            isLoading: false,
          ),
        ],
      ),
    );
  }
}

class ResumeTestCard extends StatelessWidget {
  const ResumeTestCard({
    super.key,
    required this.testDetails,
  });
  final TestDetailsModel testDetails;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        UIConstants.defaultPadding,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.05),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(
          UIConstants.defaultBorderRadius,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            testDetails.testTitle ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              NameBadge(
                name: testDetails.creatorName ?? "",
                isVerifiedUser: testDetails.isVerified ?? false,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Resume",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SubjectWiseTestCard extends StatelessWidget {
  const SubjectWiseTestCard({
    super.key,
    required this.subject,
  });
  final String subject;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: UIConstants.defaultHeight * 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Center(
            child: Text(
              subject[0].toUpperCase(),
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
            ),
          ),
        ),
        const SizedBox(
          height: UIConstants.defaultHeight * 0.5,
        ),
        Text(
          subject,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ],
    );
  }
}

class OtherExamCard extends StatelessWidget {
  const OtherExamCard({
    super.key,
    required this.examName,
    required this.testCount,
  });

  final String examName;
  final int? testCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        UIConstants.defaultPadding,
      ),
      margin: const EdgeInsets.only(
        right: UIConstants.defaultMargin,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(
          UIConstants.defaultBorderRadius,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: UIConstants.defaultHeight * 3,
            width: UIConstants.defaultHeight * 3,
            child: Placeholder(),
          ),
          const SizedBox(
            height: UIConstants.defaultHeight,
          ),
          Text(
            examName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
          Text(
            "${testCount ?? 10}+ Tests",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? actionTitle;
  final Function()? onActionPressed;
  final Widget? child;

  const Section({
    super.key,
    required this.title,
    this.subtitle,
    this.actionTitle,
    this.onActionPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _sectionHeader(context),
        const SizedBox(
          height: UIConstants.defaultMargin,
        ),
        child ?? const SizedBox.shrink(),
      ],
    );
  }

  Widget _sectionHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(
              height: UIConstants.defaultHeight * 0.5,
            ),
            Visibility(
              visible: subtitle != null,
              child: Text(
                subtitle ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.5),
                    ),
              ),
            ),
          ],
        ),
        Visibility(
          visible: actionTitle != null,
          child: TextButton(
            onPressed: onActionPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  actionTitle ?? "",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TestDetailsModel {
  int? testId;
  String? testTitle;
  String? creatorName;
  bool? isVerified;
  int? totalQuestions;
  int? timeLimit;
  double? totalMarks;
  double? coins;
  int? attemptsCount;
  String? tag;

  TestDetailsModel({
    this.testId,
    this.testTitle,
    this.creatorName,
    this.isVerified,
    this.totalQuestions,
    this.timeLimit,
    this.totalMarks,
    this.coins,
    this.attemptsCount,
    this.tag,
  });
}

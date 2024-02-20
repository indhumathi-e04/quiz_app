import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../common/view/widgets/custom_widgets/custom_dropdownfield.dart';
import '../../../common/view/widgets/custom_widgets/custom_elevated_button.dart';
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
            Text(
              "Continue Your Progress",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "Keep attempting the tests to make progress",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(
              height: UIConstants.defaultHeight,
            ),
            SizedBox(
              height: 50,
              width: 330,
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((BuildContext context, index) {
                  return const ContinueProgressSlider(
                    examTitle: 'NEET - 2023 Full Length Mock Test',
                    examName: 'Manimaran K V',
                  );
                }),
              ),
            ),
            const SizedBox(
              height: UIConstants.defaultHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Latest Quizzes",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "View all",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            const SizedBox(
              height: UIConstants.defaultHeight,
            ),
            SizedBox(
              height: 250,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 110 / 250,
                crossAxisSpacing: UIConstants.defaultMargin * 2,
                mainAxisSpacing: UIConstants.defaultMargin * 2,
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  5,
                  (index) {
                    return const LatestQuizCard(
                      cardTitle: "NEET - 2023 Full Length NEET",
                      testTitle: "Manimaran K V",
                      numberOfQuestion: 5,
                      minutes: 90,
                      numberOfAttemps: 150,
                      coinsCount: 10,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: UIConstants.defaultHeight,
            ),
            Text(
              "Trending Mock Tests (Exam Level)",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: UIConstants.defaultHeight * 0.5,
            ),
            Text(
              "Attempt exam level tests to keep yourself matched with the exam",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(
              height: UIConstants.defaultHeight,
            ),
            SizedBox(
              height: 172,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return const TrendingMockTest(
                    examTitle: "NEET - 2023 Full Length Mock Test",
                    examName: "Manimaran K V",
                    questionsCount: 200,
                    timeLimit: 20,
                    marks: 300,
                    coins: 150,
                  );
                },
              ),
            ),
            const SizedBox(
              height: UIConstants.defaultHeight,
            ),
            Text(
              "Attempt Previous Year Question",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: UIConstants.defaultHeight * 0.5,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return const PreviousYearQuestionsCard(
                  cardTitle: "NEET - 2023 Full Length Mock Test",
                  testTitle: "Manimaran K V",
                  numberOfAttempts: 150,
                  coinsCount: 10,
                );
              },
            ),
            const SizedBox(
              height: UIConstants.defaultHeight,
            ),
            Text(
              "Subject-wise Tests",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: UIConstants.defaultHeight,
            ),
            SizedBox(
              height: 67,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return const SubjectWiseTests(
                    subjectIcon: "C",
                    subjectName: "Chemistry",
                  );
                },
              ),
            ),
            const SizedBox(
              height: UIConstants.defaultHeight,
            ),
            Text(
              "Other Exams",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: UIConstants.defaultHeight,
            ),
            SizedBox(
              height: 110,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return const OtherExams(examName: "NEET - UG");
                },
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
    required this.cardTitle,
    required this.testTitle,
    required this.numberOfQuestion,
    required this.minutes,
    required this.numberOfAttemps,
    required this.coinsCount,
    super.key,
  });
  final String cardTitle;
  final String testTitle;
  final int numberOfQuestion;
  final int minutes;
  final int numberOfAttemps;
  final int coinsCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(UIConstants.defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        borderRadius: BorderRadius.circular(UIConstants.defaultBorderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Test Series"),
          Text(
            cardTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                testTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                width: UIConstants.defaultHeight * 0.5,
              ),
              Icon(
                Icons.check_circle,
                size: UIConstants.defaultHeight,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$numberOfQuestion Questions",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                "$minutes minutes",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                "$numberOfAttemps attempts",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                "$coinsCount coins",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          CustomElevatedButton(
            buttonHeight: 20,
            buttonWidth: 90,
            buttonText: "Attempt",
            isLoading: false,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class PreviousYearQuestionsCard extends StatelessWidget {
  const PreviousYearQuestionsCard({
    required this.cardTitle,
    required this.testTitle,
    required this.numberOfAttempts,
    required this.coinsCount,
    super.key,
  });
  final String cardTitle;
  final String testTitle;
  final int numberOfAttempts;
  final int coinsCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: UIConstants.defaultWidth,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        borderRadius: BorderRadius.circular(UIConstants.defaultBorderRadius),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: UIConstants.defaultMargin * 0.5,
        horizontal: UIConstants.defaultMargin * 0.5,
      ),
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardTitle,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  height: UIConstants.defaultHeight * 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          testTitle,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(
                          width: UIConstants.defaultWidth * 0.5,
                        ),
                        Icon(
                          Icons.check_circle,
                          size: UIConstants.defaultHeight,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                    Text(
                      "$numberOfAttempts attempts",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      "$coinsCount coins",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TrendingMockTest extends StatelessWidget {
  const TrendingMockTest({
    required this.examTitle,
    required this.examName,
    required this.questionsCount,
    required this.timeLimit,
    required this.marks,
    required this.coins,
    super.key,
  });
  final String examTitle;
  final String examName;
  final int questionsCount;
  final int timeLimit;
  final int marks;
  final int coins;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 147,
      height: 172,
      padding: const EdgeInsets.all(
        UIConstants.defaultPadding,
      ),
      margin: const EdgeInsets.only(
        right: UIConstants.defaultMargin,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        borderRadius: BorderRadius.circular(UIConstants.defaultBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Test Series"),
          Text(
            examTitle,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Row(
            children: [
              Text(
                examName,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(
                width: UIConstants.defaultWidth * 0.5,
              ),
              Icon(
                Icons.check_circle,
                size: UIConstants.defaultHeight,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(
              UIConstants.defaultPadding * 0.5,
            ),
            margin: const EdgeInsets.only(
              bottom: UIConstants.defaultMargin * 0.1,
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(
                UIConstants.defaultBorderRadius,
              ),
            ),
            height: 72,
            width: 127,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Questions",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      questionsCount.toString(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Time Limit",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      questionsCount.toString(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Marks",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      questionsCount.toString(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Coins",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      questionsCount.toString(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomElevatedButton(
            buttonWidth: 127,
            buttonHeight: 20,
            buttonText: "Attempt",
            onPressed: () {},
            isLoading: false,
          ),
        ],
      ),
    );
  }
}

class ContinueProgressSlider extends StatelessWidget {
  const ContinueProgressSlider({
    required this.examName,
    required this.examTitle,
    super.key,
  });
  final String examTitle;
  final String examName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        UIConstants.defaultPadding * 0.5,
      ),
      margin: const EdgeInsets.only(
        right: UIConstants.defaultMargin * 2,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        borderRadius: BorderRadius.circular(
          UIConstants.defaultBorderRadius,
        ),
      ),
      height: 50,
      width: 330,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            examTitle,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                examName,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              CustomElevatedButton(
                buttonHeight: 20,
                buttonWidth: 60,
                buttonText: "Resume",
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

class SubjectWiseTests extends StatelessWidget {
  const SubjectWiseTests({
    required this.subjectIcon,
    required this.subjectName,
    super.key,
  });
  final String subjectName;
  final String subjectIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.symmetric(
              horizontal: UIConstants.defaultHeight * 2),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(subjectIcon),
          ),
        ),
        Text(subjectName),
      ],
    );
  }
}

class OtherExams extends StatelessWidget {
  const OtherExams({
    required this.examName,
    super.key,
  });
  final String examName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: UIConstants.defaultMargin,
      ),
      padding: const EdgeInsets.all(UIConstants.defaultPadding * 2),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        borderRadius: BorderRadius.circular(UIConstants.defaultBorderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 30,
            width: 30,
            child: Placeholder(),
          ),
          Text(
            examName,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "100+ Tests",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}

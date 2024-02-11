import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';
import 'package:quiz/view/widgets/latest_quiz_card.dart';
import 'package:quiz/view/widgets/previous_year_questions_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          height: 30,
          width: 30,
          child: Placeholder(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: UIConstants.defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                  width: 15,
                  child: Placeholder(),
                ),
                const SizedBox(
                  height: UIConstants.defaultHeight * 0.5,
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
        padding: const EdgeInsets.all(UIConstants.defaultPadding),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latest Quizzes",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "View all",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: UIConstants.defaultHeight * 0.5,
          ),
          SizedBox(
            height: 230,
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 100 / 250,
              crossAxisSpacing: UIConstants.defaultMargin * 2,
              mainAxisSpacing: UIConstants.defaultMargin * 2,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                5,
                (index) {
                  return const LatestQuizCard(
                    cardTitle:
                        "NEET - 2023 Full Length NEET - 2023 Full Length",
                    testTitle: "Manimaran K V",
                    numberOfQuestion: 5,
                    minutes: 90,
                    numberOfAttemps: 150,
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: UIConstants.defaultHeight * 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Attempt Previous Year Questions",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "View all",
                ),
              ),
            ],
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
                );
              })
        ]),
      ),
    );
  }
}

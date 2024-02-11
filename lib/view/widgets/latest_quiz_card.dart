import 'package:flutter/material.dart';
import 'package:quiz/view/widgets/custom_button.dart';

import '../../constants/ui_constants.dart';

class LatestQuizCard extends StatelessWidget {
  const LatestQuizCard({
    required this.cardTitle,
    required this.testTitle,
    required this.numberOfQuestion,
    required this.minutes,
    required this.numberOfAttemps,
    super.key,
  });
  final String cardTitle;
  final String testTitle;
  final int numberOfQuestion;
  final int minutes;
  final int numberOfAttemps;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(UIConstants.defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        borderRadius: UIConstants.defaultBorderRadius,
      ),
      child: Row(
        children: [
          const Column(
            children: [
              Text("Test Series"),
              SizedBox(
                height: UIConstants.defaultHeight,
              ),
              SizedBox(
                height: 60,
                width: 60,
                child: Placeholder(),
              )
            ],
          ),
          const SizedBox(
            width: UIConstants.defaultWidth,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cardTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const Spacer(),
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
                const SizedBox(
                  height: UIConstants.defaultHeight * 0.5,
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
                  ],
                ),
                const Spacer(),
                CustomButton(
                  buttonHeight: 20,
                  buttonWidth: 90,
                  buttonText: "Attempt",
                  isLoading: false,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

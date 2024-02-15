import 'package:flutter/material.dart';

import '../../constants/ui_constants.dart';

class PreviousYearQuestionsCard extends StatelessWidget {
  const PreviousYearQuestionsCard(
      {required this.cardTitle,
      required this.testTitle,
      required this.numberOfAttempts,
      super.key});
  final String cardTitle;
  final String testTitle;
  final int numberOfAttempts;

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
          vertical: UIConstants.defaultMargin,
          horizontal: UIConstants.defaultMargin),
      height: 40,
      child: Row(mainAxisSize: MainAxisSize.max, children: [
        const SizedBox(
          width: 20,
          height: 20,
          child: Placeholder(),
        ),
        const SizedBox(
          width: UIConstants.defaultWidth,
        ),
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
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

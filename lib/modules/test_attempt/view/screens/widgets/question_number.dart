import 'package:flutter/material.dart';

import '../../../../../constants/ui_constants.dart';
import '../../../../../models/user_choice_model.dart';
import '../../../../../theme/app_colors.dart';

class QuestionNumber extends StatelessWidget {
  const QuestionNumber({
    required this.questionNumber,
    required this.questionState,
    required this.onQuestionTapped,
    required this.isCurrentQuestion,
    super.key,
  });
  final int questionNumber;
  final QuestionUserStatus questionState;
  final Function() onQuestionTapped;
  final bool isCurrentQuestion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onQuestionTapped();
      },
      child: Stack(
        children: [
          Container(
            height: UIConstants.defaultHeight * 4,
            width: UIConstants.defaultHeight * 4,
            padding: const EdgeInsets.all(UIConstants.defaultPadding * 0.5),
            margin: const EdgeInsets.all(UIConstants.defaultMargin * 0.5),
            decoration: BoxDecoration(
              color: questionState == QuestionUserStatus.attempted ||
                      questionState ==
                          QuestionUserStatus.attemptedAndMarkedForReview
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(
                UIConstants.defaultBorderRadius,
              ),
              border: isCurrentQuestion
                  ? Border.all(
                      color: Theme.of(context).colorScheme.error,
                    )
                  : null,
            ),
            child: Center(
              child: Text(
                questionNumber.toString(),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ),
          Visibility(
            visible: questionState == QuestionUserStatus.markedForReview ||
                questionState == QuestionUserStatus.attemptedAndMarkedForReview,
            child: Icon(
              Icons.star_rate_rounded,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppDarkColors.yellow
                  : AppLightColors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}

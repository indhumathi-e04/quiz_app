import 'package:flutter/material.dart';

import '../../../../../constants/ui_constants.dart';
import '../../../../../theme/app_colors.dart';

class TrueOrFalseOption extends StatelessWidget {
  const TrueOrFalseOption({
    required this.index,
    required this.value,
    required this.onOptionSelection,
    this.isOptionSelected = false,
    this.isCorrectAnswer = false,
    this.isSolutionView = false,
    super.key,
  });

  final int index;
  final String value;
  final Function(int optionIndex) onOptionSelection;
  final bool isOptionSelected;
  final bool isCorrectAnswer;
  final bool isSolutionView;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isSolutionView) {
          onOptionSelection(index);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(
          UIConstants.defaultPadding,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: UIConstants.defaultMargin * 0.5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(UIConstants.defaultBorderRadius),
          color: isSolutionView
              ? isOptionSelected
                  ? isCorrectAnswer
                      ? Theme.of(context).brightness == Brightness.dark
                          ? AppDarkColors.lightGreen
                          : AppLightColors.green
                      : Theme.of(context).brightness == Brightness.dark
                          ? AppDarkColors.red
                          : AppLightColors.red
                  : isCorrectAnswer
                      ? Theme.of(context).brightness == Brightness.dark
                          ? AppDarkColors.lightGreen
                          : AppLightColors.green
                      : Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : Theme.of(context)
                  .colorScheme
                  .primary
                  .withOpacity(isOptionSelected ? 0.3 : 0.1),
        ),
        child: Row(
          children: [
            Flexible(
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      height: 1.5,
                      color: isSolutionView && isOptionSelected
                          ? isCorrectAnswer
                              ? Theme.of(context).brightness == Brightness.dark
                                  ? AppDarkColors.black
                                  : AppLightColors.black
                              : Theme.of(context).brightness == Brightness.dark
                                  ? AppDarkColors.white
                                  : AppLightColors.white
                          : Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

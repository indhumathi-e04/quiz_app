import '../modules/common/view/widgets/custom_widgets/custom_dropdownfield.dart';

class UIConstants {
  static const double defaultHeight = 10;
  static const double defaultWidth = 10;
  static const double defaultPadding = 10;
  static const double defaultMargin = 10;
  static const double defaultBorderRadius = 5;
  static const double defaultIconSize = 15;

  static const int examLevelTestId = 1;
  static const int subjectLevelTestId = 2;
  static const int chapterLevelTestId = 3;

  static final List<DropDownFieldChoices> testTypes = [
    DropDownFieldChoices(
      id: examLevelTestId,
      value: "Exam Level Test",
    ),
    DropDownFieldChoices(
      id: subjectLevelTestId,
      value: "Subject Level Test",
    ),
    DropDownFieldChoices(
      id: chapterLevelTestId,
      value: "Chapter Level Test",
    ),
  ];

  static const int multipleChoice4OptionsId = 1;
  static const int fillInTheBlanksId = 2;
  static const int trueOrFalseId = 3;
  static const int digitFillerId = 4;
  static const int multipleChoice5OptionsId = 5;

  static final List<DropDownFieldChoices> questionTypes = [
    DropDownFieldChoices(
      id: multipleChoice4OptionsId,
      value: "Multiple Choice (4 Options)",
    ),
    DropDownFieldChoices(
      id: fillInTheBlanksId,
      value: "Fill in the blanks",
    ),
    DropDownFieldChoices(
      id: trueOrFalseId,
      value: "True or False",
    ),
    DropDownFieldChoices(
      id: digitFillerId,
      value: "Digit Filler",
    ),
    DropDownFieldChoices(
      id: multipleChoice5OptionsId,
      value: "Multiple Choice (5 Options)",
    ),
  ];

  static final List<DropDownFieldChoices> multipleChoiceCorrectAnswer4Options =
      [
    DropDownFieldChoices(
      id: 1,
      value: "1",
    ),
    DropDownFieldChoices(
      id: 2,
      value: "2",
    ),
    DropDownFieldChoices(
      id: 3,
      value: "3",
    ),
    DropDownFieldChoices(
      id: 4,
      value: "4",
    ),
  ];
  static final List<DropDownFieldChoices> multipleChoiceCorrectAnswer5Options =
      [
    DropDownFieldChoices(
      id: 1,
      value: "1",
    ),
    DropDownFieldChoices(
      id: 2,
      value: "2",
    ),
    DropDownFieldChoices(
      id: 3,
      value: "3",
    ),
    DropDownFieldChoices(
      id: 4,
      value: "4",
    ),
    DropDownFieldChoices(
      id: 5,
      value: "5",
    ),
  ];
  static final List<DropDownFieldChoices> trueOrFalseOptions = [
    DropDownFieldChoices(
      id: 1,
      value: "True",
    ),
    DropDownFieldChoices(
      id: 0,
      value: "False",
    ),
  ];
}

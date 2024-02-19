import 'package:get/get.dart' show RxnInt;

import 'user_choice_model.dart';

class QuestionModel {
  int? questionType;
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? option5;
  int? multipleChoiceCorrectOption;
  String? fillInTheBlanksCorrectAnswer;
  int? trueOrFalseCorrectAnswer;
  String? solutionExplanation;
  int? positiveMarks;
  int? negativeMarks;

  UserChoiceModel userChoiceModel = UserChoiceModel();

  RxnInt selectedQuestionType = RxnInt();

  QuestionModel({
    this.questionType,
    this.question,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.option5,
    this.multipleChoiceCorrectOption,
    this.fillInTheBlanksCorrectAnswer,
    this.trueOrFalseCorrectAnswer,
    this.solutionExplanation,
  });
}

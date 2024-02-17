import 'package:get/get.dart' show BoolExtension, RxBool, RxnInt;

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

  RxBool isExpanded = false.obs;
  RxnInt selectedQuestionType = RxnInt();

  QuestionModel({
    this.questionType,
    this.question,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.option5,
    this.fillInTheBlanksCorrectAnswer,
    this.multipleChoiceCorrectOption,
    this.trueOrFalseCorrectAnswer,
    this.solutionExplanation,
  });
}

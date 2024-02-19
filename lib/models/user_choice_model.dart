import 'package:get/get.dart';

enum QuestionUserStatus {
  attempted,
  notAttempted,
  attemptedAndMarkedForReview,
  markedForReview,
}

enum QuestionEvaluationResult {
  correct,
  incorrect,
  unattempted,
}

class UserChoiceModel {
  int? timeSpent;
  RxBool? isMarkedForReview = false.obs;
  RxnInt? selectedMultipleChoice = RxnInt();
  String? fillInTheBlanksAnswer;
  RxnInt? selectedTrueOrFalseChoice = RxnInt();
  QuestionEvaluationResult? questionEvaluationResult =
      QuestionEvaluationResult.unattempted;

  void clearResponse() {
    selectedMultipleChoice?.value = null;
    fillInTheBlanksAnswer = null;
    selectedTrueOrFalseChoice?.value = null;
  }

  QuestionUserStatus get questionUserStatus {
    if (selectedMultipleChoice?.value != null ||
        (fillInTheBlanksAnswer != null && fillInTheBlanksAnswer!.isNotEmpty) ||
        selectedTrueOrFalseChoice?.value != null) {
      if (isMarkedForReview?.value != null && isMarkedForReview!.value) {
        return QuestionUserStatus.attemptedAndMarkedForReview;
      } else {
        return QuestionUserStatus.attempted;
      }
    } else {
      if (isMarkedForReview?.value != null && isMarkedForReview!.value) {
        return QuestionUserStatus.markedForReview;
      } else {
        return QuestionUserStatus.notAttempted;
      }
    }
  }
}

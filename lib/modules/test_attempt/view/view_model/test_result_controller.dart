import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../../models/question_model.dart';
import '../../../../models/section_model.dart';
import '../../../../models/test_model.dart';
import '../../../../models/user_choice_model.dart';
import '../../../../routes/app_route_constants.dart';
import '../../domain/usecase/test_attempt_usecase.dart';

class TestResultController extends GetxController {
  late final TestModel testModel;
  late final TestResultModel testResultModel;
  final TestAttemptUseCase _useCase;
  TestResultController({required TestAttemptUseCase useCase})
      : _useCase = useCase;
  @override
  void onInit() {
    super.onInit();
    testModel = Get.arguments;
    calculateResult();
  }

  void calculateResult() {
    double totalMarks = 0;
    double securedPositiveMarks = 0;
    double securedNegativeMarks = 0;
    int totalTimeSpent = 0;
    int correctAnswersCount = 0;
    int inCorrectAnswersCount = 0;
    int unAttemptedCount = 0;

    Map<SectionModel, List<QuestionModel>> questionsSectionMap =
        splitQuestionsBasedOnSection();

    questionsSectionMap.forEach(
      (section, questionList) {
        double positiveMarks = section.positiveMarks ?? 0;
        double negativeMarks = section.negativeMarks ?? 0;

        for (QuestionModel question in questionList) {
          QuestionEvaluationResult questionEvaluationResult =
              evaluateQuestion(question);
          question.userChoiceModel.questionEvaluationResult =
              questionEvaluationResult;
          if (questionEvaluationResult == QuestionEvaluationResult.correct) {
            correctAnswersCount += 1;
            securedPositiveMarks += positiveMarks;
          } else if (questionEvaluationResult ==
              QuestionEvaluationResult.incorrect) {
            inCorrectAnswersCount += 1;
            securedNegativeMarks += negativeMarks;
          } else {
            unAttemptedCount += 1;
          }
          totalMarks += positiveMarks;
          totalTimeSpent += question.userChoiceModel.timeSpent ?? 0;
        }
      },
    );
    testResultModel = TestResultModel(
      totalMarks: totalMarks,
      securedMarks: securedPositiveMarks - securedNegativeMarks,
      securedPositiveMarks: securedPositiveMarks,
      securedNegativeMarks: securedNegativeMarks,
      totalTimeSpent: totalTimeSpent,
      correctAnswersCount: correctAnswersCount,
      inCorrectAnswersCount: inCorrectAnswersCount,
      unAttemptedCount: unAttemptedCount,
    );
  }

  Map<SectionModel, List<QuestionModel>> splitQuestionsBasedOnSection() {
    Map<SectionModel, List<QuestionModel>> questionsSectionMap = {};
    for (SectionModel section in testModel.sections ?? []) {
      int firstQuestionIndex = section.firstQuestionIndex ?? 0;
      int lastQuestionIndex = section.lastQuestionIndex ?? 0;
      List<QuestionModel> questionList = (testModel.questions ?? [])
          .sublist(firstQuestionIndex, lastQuestionIndex + 1);
      questionsSectionMap.putIfAbsent(section, () => questionList);
    }
    return questionsSectionMap;
  }

  QuestionEvaluationResult evaluateQuestion(QuestionModel question) {
    if (question.userChoiceModel.questionUserStatus ==
            QuestionUserStatus.attempted ||
        question.userChoiceModel.questionUserStatus ==
            QuestionUserStatus.attemptedAndMarkedForReview) {
      UserChoiceModel userChoice = question.userChoiceModel;
      if (question.questionType == UIConstants.multipleChoice4OptionsId ||
          question.questionType == UIConstants.multipleChoice5OptionsId) {
        int selectedOption = userChoice.selectedMultipleChoice?.value ?? -1;
        int correctOption = question.multipleChoiceCorrectOption ?? -2;
        if (selectedOption == correctOption) {
          return QuestionEvaluationResult.correct;
        }
        return QuestionEvaluationResult.incorrect;
      } else if (question.questionType == UIConstants.fillInTheBlanksId) {
        String userAnswer =
            (userChoice.fillInTheBlanksAnswer ?? "").trim().toLowerCase();
        String correctAnswer = (question.fillInTheBlanksCorrectAnswer ?? "-1")
            .trim()
            .toLowerCase();
        if (userAnswer == correctAnswer) {
          return QuestionEvaluationResult.correct;
        }
        return QuestionEvaluationResult.incorrect;
      } else if (question.questionType == UIConstants.digitFillerId) {
        double userAnswer = double.tryParse(
              (userChoice.fillInTheBlanksAnswer ?? "").trim(),
            ) ??
            -1;
        double correctAnswer = double.tryParse(
              (question.fillInTheBlanksCorrectAnswer ?? "").trim(),
            ) ??
            -2;
        if (userAnswer == correctAnswer) {
          return QuestionEvaluationResult.correct;
        }
        return QuestionEvaluationResult.incorrect;
      } else if (question.questionType == UIConstants.trueOrFalseId) {
        int selectedOption = userChoice.selectedTrueOrFalseChoice?.value ?? -1;
        int correctOption = question.trueOrFalseCorrectAnswer ?? -2;
        if (selectedOption == correctOption) {
          return QuestionEvaluationResult.correct;
        }
        return QuestionEvaluationResult.incorrect;
      } else {
        return QuestionEvaluationResult.unattempted;
      }
    } else {
      return QuestionEvaluationResult.unattempted;
    }
  }

  void navigateToSolutions() {
    Get.toNamed(
      AppRouteConstants.routeTestAttempt,
      arguments: {
        "test_model": testModel,
        "is_solution": true,
      },
    );
  }

  void onSolutionTapped() {
    navigateToSolutions();
  }
}

class TestResultModel {
  double totalMarks;
  double securedMarks;
  double securedPositiveMarks;
  double securedNegativeMarks;
  int totalTimeSpent;
  int correctAnswersCount;
  int inCorrectAnswersCount;
  int unAttemptedCount;

  TestResultModel({
    required this.totalMarks,
    required this.securedMarks,
    required this.securedPositiveMarks,
    required this.securedNegativeMarks,
    required this.totalTimeSpent,
    required this.correctAnswersCount,
    required this.inCorrectAnswersCount,
    required this.unAttemptedCount,
  });
}

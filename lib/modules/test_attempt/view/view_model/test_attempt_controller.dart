import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/utils.dart';
import '../../../../models/all_question_states.dart';
import '../../../../models/question_model.dart';
import '../../../../models/section_model.dart';
import '../../../../models/test_model.dart';
import '../../../../models/user_choice_model.dart';
import '../../../../routes/app_route_constants.dart';
import '../../domain/usecase/test_attempt_usecase.dart';

class TestAttemptController extends GetxController {
  final PageController pageController = PageController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TestAttemptUseCase _useCase;
  TestAttemptController({required TestAttemptUseCase useCase})
      : _useCase = useCase;

  late final Timer _timer;
  int currentQuestion = 0;

  RxString timerString = "00h:00m:00s".obs;
  int timerTick = 0;

  late final TestModel testModel;
  late final bool isSolutionView;

  @override
  void onInit() {
    super.onInit();
    Map<String, dynamic> arguments = Get.arguments;
    testModel = arguments["test_model"];
    isSolutionView = arguments["is_solution"] ?? false;
    prepareTestData();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void startTimer() {
    int allowedTimeInSeconds = (testModel.timeLimit ?? 0) * 60;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        updateTimeSpentOnQuestion();
        timerTick += 1;
        bool isTimeOver = (allowedTimeInSeconds - timerTick) == 0;
        if (isTimeOver) {
          timer.cancel();
          timerString.value = "No time";
        } else {
          timerString.value = Utils.formattedTimeInHourMinSec(
            timeInSecond: allowedTimeInSeconds - timerTick,
          );
        }
      },
    );
  }

  void updateTimeSpentOnQuestion() {
    if (testModel.questions != null) {
      testModel.questions?[currentQuestion].userChoiceModel.timeSpent =
          (testModel.questions?[currentQuestion].userChoiceModel.timeSpent ??
                  0) +
              1;
    }
  }

  void prepareTestData() {
    if (!isSolutionView) {
      startTimer();
    }
    prepareSectionWiseQuestions();
  }

  void prepareSectionWiseQuestions() {
    int totalQuestions = 0;
    int lastSectionlastQuestion = 0;
    for (int i = 0; i < (testModel.sections?.length ?? 0); i++) {
      SectionModel section = testModel.sections?[i] ?? SectionModel();
      totalQuestions += section.questionCount ?? 0;
      if (i == 0) {
        section.firstQuestionIndex = 0;
      } else {
        section.firstQuestionIndex = lastSectionlastQuestion + 1;
      }
      section.lastQuestionIndex = totalQuestions - 1;
      lastSectionlastQuestion = section.lastQuestionIndex ?? 0;
    }
  }

  void moveToNextQuestion() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  void onQuestionTapped(int questionIndex) {
    if (scaffoldKey.currentState?.isEndDrawerOpen ?? true) {
      scaffoldKey.currentState?.closeEndDrawer();
    }
    pageController.jumpToPage(
      questionIndex,
    );
  }

  AllQuestionStates get getAllQuestionStates {
    int attempted = 0;
    int notAttempted = 0;
    int attemptedAndMarkedForReview = 0;
    int markedForReview = 0;

    for (QuestionModel question in testModel.questions ?? []) {
      if (question.userChoiceModel.questionUserStatus ==
          QuestionUserStatus.attempted) {
        attempted += 1;
      } else if (question.userChoiceModel.questionUserStatus ==
          QuestionUserStatus.notAttempted) {
        notAttempted += 1;
      } else if (question.userChoiceModel.questionUserStatus ==
          QuestionUserStatus.attemptedAndMarkedForReview) {
        attemptedAndMarkedForReview += 1;
      } else if (question.userChoiceModel.questionUserStatus ==
          QuestionUserStatus.markedForReview) {
        markedForReview += 1;
      }
    }

    return AllQuestionStates(
      attempted: attempted,
      notAttempted: notAttempted,
      attemptedAndMarkedForReview: attemptedAndMarkedForReview,
      markedForReview: markedForReview,
    );
  }

  SectionModel? getSection(int questionIndex) {
    for (SectionModel section in testModel.sections ?? []) {
      if (questionIndex >= (section.firstQuestionIndex ?? 0) &&
          questionIndex <= (section.lastQuestionIndex ?? 0)) {
        return section;
      }
    }
    return null;
  }

  QuestionModel get getCurrentQuestion =>
      testModel.questions?[currentQuestion] ?? QuestionModel();

  void removeFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void onSubmitTestTapped() {
    Get.offAndToNamed(
      AppRouteConstants.routeTestResult,
      arguments: testModel,
    );
  }
}

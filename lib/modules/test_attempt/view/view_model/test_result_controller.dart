import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../../models/question_model.dart';
import '../../../../models/section_model.dart';
import '../../../../models/test_model.dart';
import '../../../../models/user_choice_model.dart';
import '../../../../routes/app_route_constants.dart';

class TestResultController extends GetxController {
  late final TestModel testModel;
  late final TestResultModel testResultModel;
  @override
  void onInit() {
    super.onInit();
    testModel = Get.arguments;
    calculateResult();
  }

  void calculateResult() {}

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

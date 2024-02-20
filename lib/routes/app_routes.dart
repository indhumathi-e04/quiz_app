import 'package:get/get.dart';

import '../modules/authentication/view/screens/sign_in_screen.dart';
import '../modules/dashboard/view/screens/dashboard_screen.dart';
import '../modules/exam_syllabus_creation/view/screens/chapters_screen.dart';
import '../modules/exam_syllabus_creation/view/screens/exam_creation_screen.dart';
import '../modules/exam_syllabus_creation/view/screens/subject_screen.dart';
import '../modules/exam_syllabus_creation/view/screens/syllabus_screen.dart';
import '../modules/test_attempt/view/screens/test_attempt_screen.dart';
import '../modules/test_attempt/view/screens/test_instructions_screen.dart';
import '../modules/test_attempt/view/screens/test_result_screen.dart';
import '../modules/test_creation/view/screens/questions_screen.dart';
import '../modules/test_creation/view/screens/sections_screen.dart';
import '../modules/test_creation/view/screens/test_creation_screen.dart';
import 'app_route_constants.dart';

class AppRoutes {
  static final List<GetPage> appRoutes = [
    GetPage(
      name: AppRouteConstants.routeTestCreation,
      page: () => TestCreationScreen(),
    ),
    GetPage(
      name: AppRouteConstants.routeSections,
      page: () => SectionsScreen(),
    ),
    GetPage(
      name: AppRouteConstants.routeQuestions,
      page: () => QuestionScreen(),
    ),
    GetPage(
      name: AppRouteConstants.routeExaminations,
      page: () => ExamCreationScreen(),
    ),
    GetPage(
      name: AppRouteConstants.routeSyllabus,
      page: () => SyllabusScreen(),
    ),
    GetPage(
      name: AppRouteConstants.routeSubjects,
      page: () => SubjectScreen(),
    ),
    GetPage(
      name: AppRouteConstants.routeChapters,
      page: () => ChapterScreen(),
    ),
    GetPage(
      name: AppRouteConstants.routeSignIn,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: AppRouteConstants.routeTestInstructions,
      page: () => TestInstructionsScreen(),
    ),
    GetPage(
      name: AppRouteConstants.routeTestAttempt,
      page: () => TestAttemptScreen(),
    ),
    GetPage(
      name: AppRouteConstants.routeTestResult,
      page: () => TestResultScreen(),
    ),
    GetPage(
      name: AppRouteConstants.routeDashboard,
      page: () => DashboardScreen(),
    ),
  ];
}

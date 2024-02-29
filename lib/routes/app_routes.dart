import 'package:get/get.dart';

import '../modules/authentication/data/bindings/authentication_data_bindings.dart';
import '../modules/authentication/domain/bindings/authentication_domain_bindings.dart';
import '../modules/authentication/view/bindings/authentication_view_bindings.dart';
import '../modules/authentication/view/screens/sign_in_screen.dart';
import '../modules/dashboard/data/bindings/dashboard_data_bindings.dart';
import '../modules/dashboard/domain/bindings/dashboard_domain_bindings.dart';

import '../modules/dashboard/view/bindings/dashboard_view_bindings.dart';
import '../modules/dashboard/view/screens/dashboard_screen.dart';
import '../modules/exam_syllabus_creation/data/bindings/exam_syllabus_creation_data_bindings.dart';
import '../modules/exam_syllabus_creation/domain/bindings/exam_syllabus_creation_domain_bindings.dart';
import '../modules/exam_syllabus_creation/view/bindings/chapters_view_bindings.dart';
import '../modules/exam_syllabus_creation/view/bindings/exam_creation_view_bindings.dart';
import '../modules/exam_syllabus_creation/view/bindings/subject_view_bindings.dart';
import '../modules/exam_syllabus_creation/view/bindings/syllabus_view_bindings.dart';
import '../modules/exam_syllabus_creation/view/screens/chapters_screen.dart';
import '../modules/exam_syllabus_creation/view/screens/exam_creation_screen.dart';
import '../modules/exam_syllabus_creation/view/screens/subject_screen.dart';
import '../modules/exam_syllabus_creation/view/screens/syllabus_screen.dart';
import '../modules/test_attempt/data/bindings/test_attempt_data_bindings.dart';
import '../modules/test_attempt/domain/bindings/test_attempt_domain_bindings.dart';
import '../modules/test_attempt/view/bindings/test_attempt_view_bindings.dart';
import '../modules/test_attempt/view/bindings/test_instructions_view_bindings.dart';
import '../modules/test_attempt/view/bindings/test_result_view_bindings.dart';
import '../modules/test_attempt/view/screens/test_attempt_screen.dart';
import '../modules/test_attempt/view/screens/test_instructions_screen.dart';
import '../modules/test_attempt/view/screens/test_result_screen.dart';
import '../modules/test_creation/data/bindings/test_creation_data_bindings.dart';
import '../modules/test_creation/domain/bindings/test_creation_domain_bindings.dart';
import '../modules/test_creation/view/bindings/question_view_bindings.dart';
import '../modules/test_creation/view/bindings/sections_view_bindings.dart';
import '../modules/test_creation/view/bindings/test_creation_view_bindings.dart';
import '../modules/test_creation/view/screens/questions_screen.dart';
import '../modules/test_creation/view/screens/sections_screen.dart';
import '../modules/test_creation/view/screens/test_creation_screen.dart';
import 'app_route_constants.dart';

class AppRoutes {
  static final List<GetPage> appRoutes = [
    GetPage(
      name: AppRouteConstants.routeTestCreation,
      page: () => TestCreationScreen(),
      bindings: [
        TestCreationDataBindings(),
        TestCreationDomainBindings(),
        TestCreationViewBindings(),
      ],
    ),
    GetPage(
      name: AppRouteConstants.routeSections,
      page: () => SectionsScreen(),
      bindings: [
        TestCreationDataBindings(),
        TestCreationDomainBindings(),
        SectionsViewBindings(),
      ],
    ),
    GetPage(
      name: AppRouteConstants.routeQuestions,
      page: () => QuestionScreen(),
      bindings: [
        TestCreationDataBindings(),
        TestCreationDomainBindings(),
        QuestionsViewBindings(),
      ],
    ),
    GetPage(
      name: AppRouteConstants.routeExaminations,
      page: () => ExamCreationScreen(),
      bindings: [
        ExamSyllabusCreationDataBindings(),
        ExamSyllabusCreationDomainBindings(),
        ExamCreationViewBindings(),
      ],
    ),
    GetPage(
      name: AppRouteConstants.routeSyllabus,
      page: () => SyllabusScreen(),
      bindings: [
        ExamSyllabusCreationDataBindings(),
        ExamSyllabusCreationDomainBindings(),
        SyllabusViewBindings(),
      ],
    ),
    GetPage(
      name: AppRouteConstants.routeSubjects,
      page: () => SubjectScreen(),
      bindings: [
        ExamSyllabusCreationDataBindings(),
        ExamSyllabusCreationDomainBindings(),
        SubjectViewBindings(),
      ],
    ),
    GetPage(
      name: AppRouteConstants.routeChapters,
      page: () => ChapterScreen(),
      bindings: [
        ExamSyllabusCreationDataBindings(),
        ExamSyllabusCreationDomainBindings(),
        ChaptersViewBindings(),
      ],
    ),
    GetPage(
      name: AppRouteConstants.routeSignIn,
      page: () => SignInScreen(),
      bindings: [
        AuthenticationDataBindings(),
        AuthenticationDomainBindings(),
        AuthenticationViewBindings(),
      ],
    ),
    GetPage(
      name: AppRouteConstants.routeTestInstructions,
      page: () => TestInstructionsScreen(),
      bindings: [
        TestAttemptDataBindings(),
        TestAttemptDomainBindings(),
        TestInstructionsViewBindings(),
      ],
    ),
    GetPage(
      name: AppRouteConstants.routeTestAttempt,
      page: () => TestAttemptScreen(),
      bindings: [
        TestAttemptDataBindings(),
        TestAttemptDomainBindings(),
        TestAttemptViewBindings(),
      ],
    ),
    GetPage(
      name: AppRouteConstants.routeTestResult,
      page: () => TestResultScreen(),
      bindings: [
        TestAttemptDataBindings(),
        TestAttemptDomainBindings(),
        TestResultViewBindings(),
      ],
    ),
    GetPage(
      name: AppRouteConstants.routeDashboard,
      page: () => DashboardScreen(),
      bindings: [
        DashboardDataBindings(),
        DashboardDomainBindings(),
        DashboardViewBindings(),
      ],
    ),
  ];
}

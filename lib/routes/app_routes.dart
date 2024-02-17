import 'package:get/get.dart';
import 'package:quiz/modules/exam_syllabus_creation/view/screens/chapters_screen.dart';
import 'package:quiz/modules/exam_syllabus_creation/view/screens/examination_screen.dart';
import 'package:quiz/modules/exam_syllabus_creation/view/screens/subject_screen.dart';
import 'package:quiz/modules/exam_syllabus_creation/view/screens/syllabus_screen.dart';

import '../modules/test_creation/view/screens/questions_screen.dart';
import '../modules/test_creation/view/screens/sections_screen.dart';
import '../modules/test_creation/view/screens/test_creation_screen.dart';
import 'route_constants.dart';

class AppRoutes {
  static final List<GetPage> appRoutes = [
    GetPage(
      name: RouteConstants.routeTestCreation,
      page: () => TestCreationScreen(),
    ),
    GetPage(
      name: RouteConstants.routeSections,
      page: () => SectionsScreen(),
    ),
    // GetPage(
    //   name: RouteConstants.routeQuestions,
    //   page: () => QuestionScreen(
    //     sectionModelList: [],
    //   ),
    // ),
    GetPage(
      name: RouteConstants.routeQuestions,
      page: () => QuestionScreen(),
    ),
  ];
}

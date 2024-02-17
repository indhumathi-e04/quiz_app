import 'package:get/get.dart';

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
    GetPage(
      name: RouteConstants.routeQuestions,
      page: () => QuestionScreen(),
    ),
  ];
}

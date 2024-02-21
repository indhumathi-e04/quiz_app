import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_route_constants.dart';
import '../../../downloads/view/screens/downloads_screen.dart';
import '../../../home/view/screens/home_screen.dart';
import '../../../practice/view/screens/practice_screen.dart';
import '../../../profile/view/screens/profile_screen.dart';

class DashboardController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var currentIndex = 0.obs;

  final List<String> pages = [
    AppRouteConstants.routeHome,
    AppRouteConstants.routePractice,
    AppRouteConstants.routeDownloads,
    AppRouteConstants.routeProfile,
  ];

  void changePage(int index) {
    if (currentIndex.value != index) {
      currentIndex.value = index;
      Get.toNamed(
        pages[index],
        id: 1,
      );
    }
  }

  Route? onGenerateRoute(RouteSettings settings) {
    Get.routing.args = settings.arguments;
    if (settings.name == AppRouteConstants.routeHome) {
      return GetPageRoute(
        settings: settings,
        page: () => HomeScreen(),
        bindings: [],
      );
    } else if (settings.name == AppRouteConstants.routePractice) {
      return GetPageRoute(
        settings: settings,
        page: () => PracticeScreen(),
        bindings: [],
      );
    } else if (settings.name == AppRouteConstants.routeDownloads) {
      return GetPageRoute(
        settings: settings,
        page: () => DownloadsScreen(),
        bindings: [],
      );
    } else if (settings.name == AppRouteConstants.routeProfile) {
      return GetPageRoute(
        settings: settings,
        page: () => ProfileScreen(),
        bindings: [],
      );
    }
    return null;
  }
}

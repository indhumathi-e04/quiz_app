import 'package:get/get.dart';

import '../view_model/dashboard_controller.dart';

class DashboardViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}

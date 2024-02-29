import 'package:get/get.dart';

import '../../domain/usecase/dashboard_usecase.dart';
import '../view_model/dashboard_controller.dart';

class DashboardViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(useCase: Get.find<DashboardUseCase>()),
    );
  }
}

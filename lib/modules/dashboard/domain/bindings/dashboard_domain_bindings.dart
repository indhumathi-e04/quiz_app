import 'package:get/get.dart';

import '../repository/dashboard_repository.dart';
import '../usecase/dashboard_usecase.dart';

class DashboardDomainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardUseCase>(
      () => DashboardUseCaseImplementation(
        dashboardRepository: Get.find<DashboardRepository>(),
      ),
    );
  }
}

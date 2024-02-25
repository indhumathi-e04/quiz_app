import 'package:get/get.dart';

class DashboardViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardViewBindings>(
      () => DashboardViewBindings(),
    );
  }
}

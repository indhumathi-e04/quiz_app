import 'package:get/get.dart';

import '../view_model/test_result_controller.dart';

class TestResultViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestResultController>(
      () => TestResultController(),
    );
  }
}

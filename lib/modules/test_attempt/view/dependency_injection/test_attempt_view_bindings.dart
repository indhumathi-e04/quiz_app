import 'package:get/get.dart';

import '../view_model/test_attempt_controller.dart';

class TestAttemptViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestAttemptController>(
      () => TestAttemptController(),
    );
  }
}

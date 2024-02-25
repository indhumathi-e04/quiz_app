import 'package:get/get.dart';

import '../view_model/test_instructions_controller.dart';

class TestInstructionsViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestInstructionsController>(
      () => TestInstructionsController(),
    );
  }
}

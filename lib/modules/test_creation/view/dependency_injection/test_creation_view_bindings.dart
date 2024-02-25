import 'package:get/get.dart';

import '../view_model/test_creation_controller.dart';

class TestCreationViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestCreationController>(
      () => TestCreationController(),
    );
  }
}

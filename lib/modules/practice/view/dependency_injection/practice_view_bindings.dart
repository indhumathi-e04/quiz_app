import 'package:get/get.dart';

import '../view_model/practice_controller.dart';

class PracticeViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PracticeController>(
      () => PracticeController(),
    );
  }
}

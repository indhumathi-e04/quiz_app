import 'package:get/get.dart';

import '../view_model/examinations_controller.dart';

class ExamCreationViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExamCreationController>(
      () => ExamCreationController(),
    );
  }
}

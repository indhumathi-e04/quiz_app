import 'package:get/get.dart';

import '../view_model/subjects_controller.dart';

class SubjectViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubjectsController>(
      () => SubjectsController(),
    );
  }
}

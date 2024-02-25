import 'package:get/get.dart';

import '../view_model/syllabus_controller.dart';

class SyllabusViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SyllabusController>(
      () => SyllabusController(),
    );
  }
}

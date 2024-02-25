import 'package:get/get.dart';

import '../view_model/sections_controller.dart';

class SectionsViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SectionsController>(
      () => SectionsController(),
    );
  }
}

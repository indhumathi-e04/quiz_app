import 'package:get/get.dart';

import '../view_model/chapters_controller.dart';

class ChaptersViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChaptersController>(
      () => ChaptersController(),
    );
  }
}

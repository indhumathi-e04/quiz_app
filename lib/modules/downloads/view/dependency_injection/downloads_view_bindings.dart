import 'package:get/get.dart';

import '../view_model/downloads_controller.dart';

class DownloadsViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DownloadsController>(
      () => DownloadsController(),
    );
  }
}

import 'package:get/get.dart';

import '../../domain/usecase/downloads_usecase.dart';
import '../view_model/downloads_controller.dart';

class DownloadsViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DownloadsController>(
      () => DownloadsController(useCase: Get.find<DownloadsUseCase>()),
    );
  }
}

import 'package:get/get.dart';

import '../../domain/usecase/test_creation_usecase.dart';
import '../view_model/test_creation_controller.dart';

class TestCreationViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestCreationController>(
      () => TestCreationController(useCase: Get.find<TestCreationUseCase>()),
    );
  }
}

import 'package:get/get.dart';

import '../../domain/usecase/test_attempt_usecase.dart';
import '../view_model/test_instructions_controller.dart';

class TestInstructionsViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestInstructionsController>(
      () => TestInstructionsController(useCase: Get.find<TestAttemptUseCase>()),
    );
  }
}

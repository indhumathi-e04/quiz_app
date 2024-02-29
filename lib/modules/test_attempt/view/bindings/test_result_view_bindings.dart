import 'package:get/get.dart';

import '../../domain/usecase/test_attempt_usecase.dart';
import '../view_model/test_result_controller.dart';

class TestResultViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestResultController>(
      () => TestResultController(useCase: Get.find<TestAttemptUseCase>()),
    );
  }
}

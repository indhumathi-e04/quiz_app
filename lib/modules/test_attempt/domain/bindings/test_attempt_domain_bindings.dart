import 'package:get/get.dart';

import '../usecase/test_attempt_usecase.dart';

class TestAttemptDomainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestAttemptUseCase>(
      () => TestAttemptUseCaseImplementation(
        testAttemptUseCase: Get.find<TestAttemptUseCase>(),
      ),
    );
  }
}

import 'package:get/get.dart';

import '../../../../communication/communication_manager.dart';
import '../../data/local/datasource/test_attempt_local_datasource.dart';
import '../../data/remote/datasource/test_attempt_remote_datasource.dart';
import '../../data/repository/test_attempt_repository.dart';
import '../repository/test_attempt_repository.dart';
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

import 'package:get/get.dart';

import '../../../test_attempt/domain/repository/test_attempt_repository.dart';
import '../repository/test_creation_repository.dart';
import '../usecase/test_creation_usecase.dart';

class TestCreationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestCreationUseCase>(
      () => TestCreationUseCaseImplementation(
        testCreationRepository: Get.find<TestCreationRepository>(),
      ),
    );
  }
}

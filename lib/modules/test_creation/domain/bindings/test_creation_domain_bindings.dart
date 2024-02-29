import 'package:get/get.dart';

import '../repository/test_creation_repository.dart';
import '../usecase/test_creation_usecase.dart';

class TestCreationDomainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestCreationUseCase>(
      () => TestCreationUseCaseImplementation(
        testCreationRepository: Get.find<TestCreationRepository>(),
      ),
    );
  }
}

import 'package:get/get.dart';

import '../repository/practice_repository.dart';
import '../usecase/practice_usecase.dart';

class PracticeDomainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PracticeUseCase>(
      () => PracticeUseCaseImplementation(
        repository: Get.find<PracticeRepository>(),
      ),
    );
  }
}

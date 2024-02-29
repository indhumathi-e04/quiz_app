import 'package:get/get.dart';

import '../../../practice/domain/repository/practice_repository.dart';
import '../../../practice/domain/usecase/practice_usecase.dart';

class ProfileDomainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PracticeUseCase>(
      () => PracticeUseCaseImplementation(
        practiceRepository: Get.find<PracticeRepository>(),
      ),
    );
  }
}

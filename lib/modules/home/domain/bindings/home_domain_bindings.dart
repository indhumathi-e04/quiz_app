import 'package:get/get.dart';

import '../repository/home_repository.dart';
import '../usecase/home_usecase.dart';

class HomeDomainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeUseCase>(
      () => HomeUseCaseImplementation(
        homeRepository: Get.find<HomeRepository>(),
      ),
    );
  }
}

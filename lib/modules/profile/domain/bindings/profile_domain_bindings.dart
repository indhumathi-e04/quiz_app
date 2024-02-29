import 'package:get/get.dart';

import '../repository/profile_repository.dart';
import '../usecase/profile_usecase.dart';

class ProfileDomainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileUseCase>(
      () => ProfileUseCaseImplementation(
        profileRepository: Get.find<ProfileRepository>(),
      ),
    );
  }
}

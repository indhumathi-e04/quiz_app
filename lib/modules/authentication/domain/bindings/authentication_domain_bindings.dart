import 'package:get/get.dart';

import '../repository/authentication_repository.dart';
import '../usecase/authentication_usecase.dart';

class AuthenticationDomianBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationUseCase>(
      () => AuthenticationUseCaseImplementation(
        repository: Get.find<AuthenticationRepository>(),
      ),
    );
  }
}

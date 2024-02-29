import 'package:get/get.dart';

import '../../domain/usecase/authentication_usecase.dart';
import '../view_model/authentication_controller.dart';

class AuthenticationViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationController>(
      () => AuthenticationController(
        useCase: Get.find<AuthenticationUseCase>(),
      ),
    );
  }
}

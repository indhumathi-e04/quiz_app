import 'package:get/get.dart';

import '../view_model/authentication_controller.dart';

class AuthenticationViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationController>(
      () => AuthenticationController(),
    );
  }
}

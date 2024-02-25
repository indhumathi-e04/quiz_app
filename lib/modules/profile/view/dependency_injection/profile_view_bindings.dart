import 'package:get/get.dart';

import '../view_model/profile_controller.dart';

class ProfileViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}

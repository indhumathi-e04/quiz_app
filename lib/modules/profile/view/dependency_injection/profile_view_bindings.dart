import 'package:get/get.dart';

import '../../domain/usecase/profile_usecase.dart';
import '../view_model/profile_controller.dart';

class ProfileViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(useCase: Get.find<ProfileUseCase>()),
    );
  }
}

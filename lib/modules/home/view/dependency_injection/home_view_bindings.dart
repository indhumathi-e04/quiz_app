import 'package:get/get.dart';

import '../../domain/usecase/home_usecase.dart';
import '../view_model/home_controller.dart';

class HomeViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(useCase: Get.find<HomeUseCase>()),
    );
  }
}

import 'package:get/get.dart';

import '../../domain/usecase/practice_usecase.dart';
import '../view_model/practice_controller.dart';

class PracticeViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PracticeController>(
      () => PracticeController(useCase: Get.find<PracticeUseCase>()),
    );
  }
}

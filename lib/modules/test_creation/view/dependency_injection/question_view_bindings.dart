import 'package:get/get.dart';

import '../../domain/usecase/test_creation_usecase.dart';
import '../view_model/questions_controller.dart';

class QuestionsViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionsController>(
      () => QuestionsController(useCase: Get.find<TestCreationUseCase>()),
    );
  }
}

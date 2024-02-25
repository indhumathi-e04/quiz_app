import 'package:get/get.dart';

import '../view_model/questions_controller.dart';

class QuestionsViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionsController>(
      () => QuestionsController(),
    );
  }
}

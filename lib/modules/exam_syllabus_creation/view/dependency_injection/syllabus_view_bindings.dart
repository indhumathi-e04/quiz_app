import 'package:get/get.dart';

import '../../domain/usecase/exam_syllabus_creation_usecase.dart';
import '../view_model/syllabus_controller.dart';

class SyllabusViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SyllabusController>(
      () =>
          SyllabusController(useCase: Get.find<ExamSyllabusCreationUseCase>()),
    );
  }
}

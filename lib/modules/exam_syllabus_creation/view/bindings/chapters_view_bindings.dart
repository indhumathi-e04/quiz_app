import 'package:get/get.dart';

import '../../domain/usecase/exam_syllabus_creation_usecase.dart';
import '../view_model/chapters_controller.dart';

class ChaptersViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChaptersController>(
      () =>
          ChaptersController(useCase: Get.find<ExamSyllabusCreationUseCase>()),
    );
  }
}

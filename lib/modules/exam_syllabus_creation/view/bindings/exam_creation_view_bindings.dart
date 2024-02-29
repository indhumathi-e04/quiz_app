import 'package:get/get.dart';

import '../../domain/usecase/exam_syllabus_creation_usecase.dart';
import '../view_model/examinations_controller.dart';

class ExamCreationViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExamCreationController>(
      () => ExamCreationController(
        useCase: Get.find<ExamSyllabusCreationUseCase>(),
      ),
    );
  }
}

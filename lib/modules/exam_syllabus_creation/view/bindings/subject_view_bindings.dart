import 'package:get/get.dart';

import '../../domain/usecase/exam_syllabus_creation_usecase.dart';
import '../view_model/subjects_controller.dart';

class SubjectViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubjectsController>(
      () =>
          SubjectsController(useCase: Get.find<ExamSyllabusCreationUseCase>()),
    );
  }
}

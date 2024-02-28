import 'package:get/get.dart';

import '../repository/exam_syllabus_creation_repository.dart';
import '../usecase/exam_syllabus_creation_usecase.dart';

class ExamSyllabusCreationDomainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExamSyllabusCreationUseCase>(
      () => ExamSyllabusCreationUseCaseImplementation(
        examSyllabusCreationRepository:
            Get.find<ExamSyllabusCreationRepository>(),
      ),
    );
  }
}

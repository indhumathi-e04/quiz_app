import 'package:get/get.dart';

import '../../../../communication/communication_manager.dart';
import '../../domain/repository/exam_syllabus_creation_repository.dart';
import '../local/datasource/exam_syllabus_creation_local_datasource.dart';
import '../remote/datasource/exam_syllabus_creation_remote_datasource.dart';
import '../repository/exam_syllabus_creation_repository.dart';

class ExamSyllabusCreationDataBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExamSyllabusCreationRemoteDataSource>(
      () => ExamSyllabusCreationRemoteDataSourceImplementation(
        communicationManager: Get.find<CommunicationManager>(),
      ),
    );
    Get.lazyPut<ExamSyllabusCreationLocalDataSource>(
      () => ExamSyllabusCreationLocalDataSourceImplementation(),
    );
    Get.lazyPut<ExamSyllabusCreationRepository>(
      () => ExamSyllabusCreationRepositoryImplementation(
        examSyllabusCreationRemoteDataSource:
            Get.find<ExamSyllabusCreationRemoteDataSource>(),
        examSyllabusCreationLocalDataSource:
            Get.find<ExamSyllabusCreationLocalDataSource>(),
      ),
    );
  }
}

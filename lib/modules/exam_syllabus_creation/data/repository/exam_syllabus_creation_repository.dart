import '../../domain/repository/exam_syllabus_creation_repository.dart';
import '../local/datasource/exam_syllabus_creation_local_datasource.dart';
import '../remote/datasource/exam_syllabus_creation_remote_datasource.dart';

class ExamSyllabusCreationRepositoryImplementation
    implements ExamSyllabusCreationRepository {
  final ExamSyllabusCreationRemoteDataSource
      _examSyllabusCreationRemoteDataSource;
  final ExamSyllabusCreationLocalDataSource
      _examSyllabusCreationLocalDataSource;
  ExamSyllabusCreationRepositoryImplementation({
    required ExamSyllabusCreationRemoteDataSource
        examSyllabusCreationRemoteDataSource,
    required ExamSyllabusCreationLocalDataSource
        examSyllabusCreationLocalDataSource,
  })  : _examSyllabusCreationLocalDataSource =
            examSyllabusCreationLocalDataSource,
        _examSyllabusCreationRemoteDataSource =
            examSyllabusCreationRemoteDataSource;
}

import '../repository/exam_syllabus_creation_repository.dart';

abstract class ExamSyllabusCreationUseCase {}

class ExamSyllabusCreationUseCaseImplementation
    implements ExamSyllabusCreationUseCase {
  final ExamSyllabusCreationRepository _examSyllabusCreationRepository;
  ExamSyllabusCreationUseCaseImplementation({
    required ExamSyllabusCreationRepository examSyllabusCreationRepository,
  }) : _examSyllabusCreationRepository = examSyllabusCreationRepository;
}

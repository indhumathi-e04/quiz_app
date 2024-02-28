import '../repository/practice_repository.dart';

abstract class PracticeUseCase {}

class PracticeUseCaseImplementation implements PracticeUseCase {
  final PracticeRepository _practiceRepository;
  PracticeUseCaseImplementation({
    required PracticeRepository practiceRepository,
  }) : _practiceRepository = practiceRepository;
}

import '../repository/test_creation_repository.dart';

abstract class TestCreationUseCase {}

class TestCreationUseCaseImplementation implements TestCreationUseCase {
  final TestCreationRepository _testCreationRepository;
  TestCreationUseCaseImplementation({
    required TestCreationRepository testCreationRepository,
  }) : _testCreationRepository = testCreationRepository;
}

abstract class TestAttemptUseCase {}

class TestAttemptUseCaseImplementation implements TestAttemptUseCase {
  final TestAttemptUseCase _testAttemptUseCase;
  TestAttemptUseCaseImplementation({
    required TestAttemptUseCase testAttemptUseCase,
  }) : _testAttemptUseCase = testAttemptUseCase;
}

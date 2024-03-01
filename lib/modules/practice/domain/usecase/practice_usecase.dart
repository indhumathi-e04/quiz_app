import '../../../common/data/remote/models/result_state.dart';
import '../../../common/domain/models/use_case_result.dart';
import '../../view/screens/practice_screen.dart';
import '../repository/practice_repository.dart';

abstract class PracticeUseCase {
  Future<PracticeUseCaseResult> getLatestQuizzes();
}

class PracticeUseCaseImplementation implements PracticeUseCase {
  final PracticeRepository _repository;
  PracticeUseCaseImplementation({
    required PracticeRepository repository,
  }) : _repository = repository;

  @override
  Future<PracticeUseCaseResult> getLatestQuizzes() async {
    final result = await _repository.getLatestQuizzes();
    if (result is Success) {
      return PracticeUseCaseResult(
        latestQuizzes: result.data,
      );
    } else {
      result as Error;
      return PracticeUseCaseResult(
        errorCode: result.errorCode,
        errorMessage: result.errorMessage,
      );
    }
  }
}

class PracticeUseCaseResult extends UseCaseResult {
  final List<TestDetailsModel>? latestQuizzes;

  PracticeUseCaseResult({
    this.latestQuizzes,
    super.errorCode,
    super.errorMessage,
  });
}

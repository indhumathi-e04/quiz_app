import '../../../common/data/remote/models/result_state.dart';
import '../../../common/domain/models/use_case_result.dart';
import '../models/test_details_entity.dart';
import '../repository/practice_repository.dart';

abstract class PracticeUseCase {
  Future<PracticeUseCaseResult> getLatestQuizzes();
  Future<PracticeUseCaseResult> getContinueYourProgressData();
  Future<PracticeUseCaseResult> getTrendingMockTests();
  Future<PracticeUseCaseResult> getAttemptPreviousYearQuestions();
  Future<PracticeUseCaseResult> getSubjectWiseTests();
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

  @override
  Future<PracticeUseCaseResult> getContinueYourProgressData() async {
    final result = await _repository.getContinueYourProgressData();
    if (result is Success) {
      return PracticeUseCaseResult(
        continueYourProgressData: result.data,
      );
    } else {
      result as Error;
      return PracticeUseCaseResult(
        errorCode: result.errorCode,
        errorMessage: result.errorMessage,
      );
    }
  }

  @override
  Future<PracticeUseCaseResult> getTrendingMockTests() async {
    final result = await _repository.getTrendingMockTests();
    if (result is Success) {
      return PracticeUseCaseResult(
        trendingMockTests: result.data,
      );
    } else {
      result as Error;
      return PracticeUseCaseResult(
        errorCode: result.errorCode,
        errorMessage: result.errorMessage,
      );
    }
  }

  @override
  Future<PracticeUseCaseResult> getAttemptPreviousYearQuestions() async {
    final result = await _repository.getAttemptPreviousYearQuestions();
    if (result is Success) {
      return PracticeUseCaseResult(
        attemptPreviousYearQuestions: result.data,
      );
    } else {
      result as Error;
      return PracticeUseCaseResult(
        errorCode: result.errorCode,
        errorMessage: result.errorMessage,
      );
    }
  }

  @override
  Future<PracticeUseCaseResult> getSubjectWiseTests() async {
    final result = await _repository.getSubjectWiseTests();
    if (result is Success) {
      return PracticeUseCaseResult(
        subjects: result.data,
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
  final List<TestDetailsEntity>? latestQuizzes;
  final List<TestDetailsEntity>? continueYourProgressData;
  final List<TestDetailsEntity>? trendingMockTests;
  final List<TestDetailsEntity>? attemptPreviousYearQuestions;
  final List<SubjectEntityModel>? subjects;

  PracticeUseCaseResult({
    this.subjects,
    this.attemptPreviousYearQuestions,
    this.trendingMockTests,
    this.continueYourProgressData,
    this.latestQuizzes,
    super.errorCode,
    super.errorMessage,
  });
}

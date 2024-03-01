import 'package:dio/dio.dart';

import '../../../common/data/remote/models/result_state.dart';
import '../../domain/models/test_details_entity.dart';
import '../../domain/repository/practice_repository.dart';
import '../local/datasource/practice_local_datasource.dart';
import '../remote/datasource/practice_remote_datasource.dart';
import '../remote/models/attempt_previous_year_questions.dart';
import '../remote/models/continue_your_progress.dart';
import '../remote/models/latest_quiz_response.dart';
import '../remote/models/subject_wise_tests.dart';
import '../remote/models/trending_mock_tests.dart';

class PracticeRepositoryImplementation implements PracticeRepository {
  final PracticeRemoteDataSource _remoteDataSource;
  final PracticeLocalDataSource _localDataSource;

  PracticeRepositoryImplementation({
    required PracticeRemoteDataSource remoteDataSource,
    required PracticeLocalDataSource localDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  @override
  Future<ResultState> getLatestQuizzes() async {
    final result = await _remoteDataSource.getLatestQuizzes();
    if (result is Success) {
      LatestQuizResponse latestQuizResponse =
          LatestQuizResponse.fromJson(result.data);
      List<TestDetailsEntity> testDetailsEntityList =
          latestQuizResponse.latestQuizzes
                  ?.map(
                    (e) => e.toEntity(),
                  )
                  .toList() ??
              [];
      return Success(
        data: testDetailsEntityList,
      );
    } else {
      result as Error;
      return Error(
        errorCode: result.errorCode,
        errorMessage: result.errorMessage,
      );
    }
  }

  @override
  Future<ResultState> getContinueYourProgressData() async {
    final result = await _remoteDataSource.getContinueYourProgressData();
    if (result is Success) {
      ContinueYourProgress continueYourProgress =
          ContinueYourProgress.fromJson(result.data);
      List<TestDetailsEntity> testDetailsEntityList =
          continueYourProgress.continueYourProgress
                  ?.map(
                    (e) => e.toEntity(),
                  )
                  .toList() ??
              [];
      return Success(
        data: testDetailsEntityList,
      );
    } else {
      result as Error;
      return Error(
        errorCode: result.errorCode,
        errorMessage: result.errorMessage,
      );
    }
  }

  @override
  Future<ResultState> getTrendingMockTests() async {
    final result = await _remoteDataSource.getTrendingMockTests();
    if (result is Success) {
      TrendingMockTests trendingMockTests =
          TrendingMockTests.fromJson(result.data);

      List<TestDetailsEntity> testDetailsEntityList =
          trendingMockTests.trendingMockTests
                  ?.map(
                    (e) => e.toEntity(),
                  )
                  .toList() ??
              [];
      return Success(data: testDetailsEntityList);
    } else {
      result as Error;
      return Error(
        errorCode: result.errorCode,
        errorMessage: result.errorMessage,
      );
    }
  }

  @override
  Future<ResultState> getAttemptPreviousYearQuestions() async {
    final result = await _remoteDataSource.getAttemptPreviousYearQuestions();
    if (result is Success) {
      AttemptPreviousYearQuestions attemptPreviousYearQuestions =
          AttemptPreviousYearQuestions.fromJson(result.data);
      List<TestDetailsEntity> testDetailsEntityList =
          attemptPreviousYearQuestions.attemptPreviousYearQuestions
                  ?.map((e) => e.toEntity())
                  .toList() ??
              [];
      return Success(
        data: testDetailsEntityList,
      );
    } else {
      result as Error;
      return Error(
        errorCode: result.errorCode,
        errorMessage: result.errorMessage,
      );
    }
  }

  @override
  Future<ResultState> getSubjectWiseTests() async {
    final result = await _remoteDataSource.getSubjectWiseTests();
    if (result is Success) {
      SubjectWiseTests subjectWiseTests =
          SubjectWiseTests.fromJson(result.data);
      List<SubjectEntityModel> subjectEntityList = subjectWiseTests
              .subjectWiseTests
              ?.map((e) => e.toEntity())
              .toList() ??
          [];
      return Success(data: subjectEntityList);
    } else {
      result as Error;
      return Error(
        errorCode: result.errorCode,
        errorMessage: result.errorMessage,
      );
    }
  }
}

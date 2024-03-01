import 'package:dio/dio.dart';

import '../../../common/data/remote/models/result_state.dart';
import '../../domain/models/test_details_entity.dart';
import '../../domain/repository/practice_repository.dart';
import '../local/datasource/practice_local_datasource.dart';
import '../remote/datasource/practice_remote_datasource.dart';
import '../remote/models/latest_quiz_response.dart';

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
    final response = await _remoteDataSource.getContinueYourProgressData();
    if (response is Success) {
      return Success();
    } else {
      response as Error;
      return Error(
        errorCode: response.errorCode,
        errorMessage: response.errorMessage,
      );
    }
  }

  @override
  Future<ResultState> getTrendingMockTests() async {
    final response = await _remoteDataSource.getTrendingMockTests();
    if (response is Success) {
      return Success();
    } else {
      response as Error;
      return Error(
        errorCode: response.errorCode,
        errorMessage: response.errorMessage,
      );
    }
  }

  @override
  Future<ResultState> getAttemptPreviousYearQuestions() async {
    final response = await _remoteDataSource.getAttemptPreviousYearQuestions();
    if (response is Success) {
      return Success();
    } else {
      response as Error;
      return Error(
        errorCode: response.errorCode,
        errorMessage: response.errorMessage,
      );
    }
  }

  @override
  Future<ResultState> getSubjectWiseTests() async {
    final response = await _remoteDataSource.getSubjectWiseTests();
    if (response is Success) {
      return Success();
    } else {
      response as Error;
      return Error(
        errorCode: response.errorCode,
        errorMessage: response.errorMessage,
      );
    }
  }
}

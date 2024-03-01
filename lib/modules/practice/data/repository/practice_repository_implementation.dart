import 'package:dio/dio.dart';

import '../../../common/data/remote/models/result_state.dart';
import '../../domain/repository/practice_repository.dart';
import '../local/datasource/practice_local_datasource.dart';
import '../remote/datasource/practice_remote_datasource.dart';

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
    // 1. Make the API call and get the data
    final response = await _remoteDataSource.getLatestQuizzes();
    // 2. Check the data whether it is a success or error
    if (response is Success) {
      // 3. if it is success, then convert the response to model
      // 3.1 convert the map to response models
      // 3.2 convert the response models to entity models
      // 3.3. return the entity models in success
      return Success();
    } else {
      // 4. if it is error, then return the error
      response as Error;
      return Error(
        errorCode: response.errorCode,
        errorMessage: response.errorMessage,
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

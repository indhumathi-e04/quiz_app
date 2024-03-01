import '../../../../../communication/communication_manager.dart';
import '../../../../common/data/remote/models/result_state.dart';

abstract class PracticeRemoteDataSource {
  Future<ResultState> getLatestQuizzes();
  Future<ResultState> getContinueYourProgressData();
  Future<ResultState> getTrendingMockTests();
  Future<ResultState> getAttemptPreviousYearQuestions();
  Future<ResultState> getSubjectWiseTests();
}

class PracticeRemoteDataSourceImplementation
    implements PracticeRemoteDataSource {
  final CommunicationManager _communicationManager;
  PracticeRemoteDataSourceImplementation({
    required CommunicationManager communicationManager,
  }) : _communicationManager = communicationManager;

  @override
  Future<ResultState> getLatestQuizzes() async {
    return _communicationManager.callApiInterface(
      endPoint: "/latest-quiz",
      requestType: RequestType.get,
    );
  }

  @override
  Future<ResultState> getContinueYourProgressData() {
    return _communicationManager.callApiInterface(
      endPoint: "/continue-your-progress",
      requestType: RequestType.get,
    );
  }

  @override
  Future<ResultState> getTrendingMockTests() {
    return _communicationManager.callApiInterface(
      endPoint: "/trending-mock-tests",
      requestType: RequestType.get,
    );
  }

  @override
  Future<ResultState> getAttemptPreviousYearQuestions() {
    return _communicationManager.callApiInterface(
      endPoint: "/attempt-previous-yeat-questions",
      requestType: RequestType.get,
    );
  }

  @override
  Future<ResultState> getSubjectWiseTests() {
    return _communicationManager.callApiInterface(
      endPoint: "/subject-wise-tests",
      requestType: RequestType.get,
    );
  }
}

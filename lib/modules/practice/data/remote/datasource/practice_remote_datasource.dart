import '../../../../../communication/communication_manager.dart';
import '../../../../common/data/remote/models/result_state.dart';

abstract class PracticeRemoteDataSource {
  Future<ResultState> getLatestQuizzes();
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
}

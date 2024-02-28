import '../../../../../communication/communication_manager.dart';

abstract class TestAttemptRemoteDataSource {}

class TestAttemptRemoteDataSourceImplementation
    implements TestAttemptRemoteDataSource {
  final CommunicationManager _communicationManager;
  TestAttemptRemoteDataSourceImplementation(
      {required CommunicationManager communicationManager})
      : _communicationManager = communicationManager;
}

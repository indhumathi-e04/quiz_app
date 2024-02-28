import '../../../../../communication/communication_manager.dart';

abstract class TestCreationRemoteDataSource {}

class TestCreationLocalDataSourceImplementation
    implements TestCreationRemoteDataSource {
  final CommunicationManager _communicationManager;
  TestCreationLocalDataSourceImplementation(
      {required CommunicationManager communicationManager})
      : _communicationManager = communicationManager;
}

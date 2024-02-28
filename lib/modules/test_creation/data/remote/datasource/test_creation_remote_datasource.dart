import '../../../../../communication/communication_manager.dart';

abstract class TestCreationRemoteDataSource {}

class TestCreationRemoteDataSourceImplementation
    implements TestCreationRemoteDataSource {
  final CommunicationManager _communicationManager;
  TestCreationRemoteDataSourceImplementation(
      {required CommunicationManager communicationManager})
      : _communicationManager = communicationManager;
}

import '../../../../../communication/communication_manager.dart';

abstract class PracticeRemoteDataSource {}

class PracticeRemoteDataSourceImplementation
    implements PracticeRemoteDataSource {
  final CommunicationManager _communicationManager;
  PracticeRemoteDataSourceImplementation({
    required CommunicationManager communicationManager,
  }) : _communicationManager = communicationManager;
}

import '../../../../../communication/communication_manager.dart';

abstract class ProfileRemoteDataSource {}

class ProfileRemoteDataSourceImplementation implements ProfileRemoteDataSource {
  final CommunicationManager _communicationManager;

  ProfileRemoteDataSourceImplementation({
    required CommunicationManager communicationManager,
  }) : _communicationManager = communicationManager;
}

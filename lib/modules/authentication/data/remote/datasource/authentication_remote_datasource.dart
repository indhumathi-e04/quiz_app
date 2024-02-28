import '../../../../../communication/communication_manager.dart';

abstract class AuthenticationRemoteDataSource {}

class AuthenticationRemoteDataSourceImplementation
    implements AuthenticationRemoteDataSource {
  final CommunicationManager _communicationManager;
  AuthenticationRemoteDataSourceImplementation({
    required CommunicationManager communicationManager,
  }) : _communicationManager = communicationManager;
}

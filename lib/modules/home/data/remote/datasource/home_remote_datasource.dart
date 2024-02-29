import '../../../../../communication/communication_manager.dart';

abstract class HomeRemoteDataSource {}

class HomeRemoteDataSourceImplementation implements HomeRemoteDataSource {
  final CommunicationManager _communicationManager;
  HomeRemoteDataSourceImplementation({
    required CommunicationManager communicationManager,
  }) : _communicationManager = communicationManager;
}

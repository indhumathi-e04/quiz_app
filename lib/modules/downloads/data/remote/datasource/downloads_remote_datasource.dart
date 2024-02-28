import '../../../../../communication/communication_manager.dart';

abstract class DownloadsRemoteDataSource {}

class DownloadsRemoteDataSourceImplementation
    implements DownloadsRemoteDataSource {
  final CommunicationManager _communicationManager;

  DownloadsRemoteDataSourceImplementation({
    required CommunicationManager communicationManager,
  }) : _communicationManager = communicationManager;
}

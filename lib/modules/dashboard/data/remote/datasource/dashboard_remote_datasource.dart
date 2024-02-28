import 'dart:html';

import '../../../../../communication/communication_manager.dart';

abstract class DashboardRemoteDataSource {}

class DashboardRemoteDataSourceImplementation
    implements DashboardRemoteDataSource {
  final CommunicationManager _communicationManager;
  DashboardRemoteDataSourceImplementation({
    required CommunicationManager communicationManager,
  }) : _communicationManager = communicationManager;
}

import '../../../../../communication/communication_manager.dart';

abstract class ExamSyllabusCreationRemoteDataSource {}

class ExamSyllabusCreationRemoteDataSourceImplementation
    implements ExamSyllabusCreationRemoteDataSource {
  final CommunicationManager _communicationManager;
  ExamSyllabusCreationRemoteDataSourceImplementation({
    required CommunicationManager communicationManager,
  }) : _communicationManager = communicationManager;
}

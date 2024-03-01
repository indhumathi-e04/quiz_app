import 'package:get/get.dart';

import '../../../../communication/communication_manager.dart';
import '../../domain/repository/practice_repository.dart';
import '../local/datasource/practice_local_datasource.dart';
import '../remote/datasource/practice_remote_datasource.dart';
import '../repository/practice_repository_implementation.dart';

class PracticeDataBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PracticeRemoteDataSource>(
      () => PracticeRemoteDataSourceImplementation(
        communicationManager: Get.find<CommunicationManager>(),
      ),
    );
    Get.lazyPut<PracticeLocalDataSource>(
      () => PracticeLocalDataSourceImplementation(),
    );
    Get.lazyPut<PracticeRepository>(
      () => PracticeRepositoryImplementation(
        remoteDataSource: Get.find<PracticeRemoteDataSource>(),
        localDataSource: Get.find<PracticeLocalDataSource>(),
      ),
    );
  }
}

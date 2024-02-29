import 'package:get/get.dart';

import '../../../../communication/communication_manager.dart';
import '../../domain/repository/downloads_repository.dart';
import '../local/datasource/downloads_local_datasource.dart';
import '../remote/datasource/downloads_remote_datasource.dart';
import '../repository/downloads_repository.dart';

class DownloadsDataBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DownloadsLocalDataSource>(
      () => DownloadsLocalDataSourceImplementation(),
    );
    Get.lazyPut<DownloadsRemoteDataSource>(
      () => DownloadsRemoteDataSourceImplementation(
        communicationManager: Get.find<CommunicationManager>(),
      ),
    );
    Get.lazyPut<DownloadsRepository>(
      () => DownloadsRepositoryImplementation(
        remoteDataSource: Get.find<DownloadsRemoteDataSource>(),
        localDataSource: Get.find<DownloadsLocalDataSource>(),
      ),
    );
  }
}

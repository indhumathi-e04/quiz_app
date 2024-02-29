import 'package:get/get.dart';

import '../../../../communication/communication_manager.dart';
import '../../domain/repository/dashboard_repository.dart';
import '../local/datasource/dashboard_local_datasource.dart';
import '../remote/datasource/dashboard_remote_datasource.dart';
import '../repository/dashboard_repository.dart';

class DashboardDataBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardLocalDataSource>(
      () => DashboardLocalDataSourceImplementation(),
    );
    Get.lazyPut<DashboardRemoteDataSource>(
      () => DashboardRemoteDataSourceImplementation(
        communicationManager: Get.find<CommunicationManager>(),
      ),
    );
    Get.lazyPut<DashboardRepository>(
      () => DashboardRepositoryImplementation(
        remoteDataSource: Get.find<DashboardRemoteDataSource>(),
        localDataSource: Get.find<DashboardLocalDataSource>(),
      ),
    );
  }
}

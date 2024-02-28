import 'package:get/get.dart';

import '../../../../communication/communication_manager.dart';
import '../../domain/repository/home_repository.dart';
import '../local/datasource/home_local_datasource.dart';
import '../remote/datasource/home_remote_datasource.dart';
import '../repository/home_repository.dart';

class HomeDataBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeLocalDataSource>(() => HomeLocalDataSourceImplementation());
    Get.lazyPut<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImplementation(
        communicationManager: Get.find<CommunicationManager>(),
      ),
    );
    Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImplementation(
        remoteDataSource: Get.find<HomeRemoteDataSource>(),
        localDataSource: Get.find<HomeLocalDataSource>(),
      ),
    );
  }
}

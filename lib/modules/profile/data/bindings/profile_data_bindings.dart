import 'package:get/get.dart';

import '../../../../communication/communication_manager.dart';
import '../../domain/repository/profile_repository.dart';
import '../local/datasource/profile_local_datasource.dart';
import '../remote/datasource/profile_remote_datasource.dart';
import '../repository/profile_repository.dart';

class ProfileDataBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileLocalDataSource>(
      () => ProfileLocalDataSourceImplementation(),
    );
    Get.lazyPut<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImplementation(
        communicationManager: Get.find<CommunicationManager>(),
      ),
    );
    Get.lazyPut<ProfileRepository>(
      () => ProfileRepositoryImplementation(
        profileRemoteDataSource: Get.find<ProfileRemoteDataSource>(),
        profileLocalDataSource: Get.find<ProfileLocalDataSource>(),
      ),
    );
  }
}

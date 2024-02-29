import 'package:get/get.dart';

import '../../../../communication/communication_manager.dart';
import '../../domain/repository/authentication_repository.dart';
import '../local/datasource/authentication_local_datasource.dart';
import '../remote/datasource/authentication_remote_datasource.dart';
import '../repository/authentication_repository.dart';

class AuthenticationDataBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImplementation(
        communicationManager: Get.find<CommunicationManager>(),
      ),
    );
    Get.lazyPut<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImplementation(),
    );
    Get.lazyPut<AuthenticationRepository>(
      () => AuthenticationRepositoryImplementation(
        localDataSource: Get.find<AuthenticationLocalDataSource>(),
        remoteDataSource: Get.find<AuthenticationRemoteDataSource>(),
      ),
    );
  }
}

import 'package:get/get.dart';

import '../../../../communication/communication_manager.dart';
import '../../domain/repository/test_creation_repository.dart';
import '../local/datasource/test_creation_local_datasource.dart';
import '../remote/datasource/test_creation_remote_datasource.dart';
import '../repository/test_creation_repository.dart';

class TestCreationDataBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestCreationLocalDataSource>(
      () => TestCreationLocalDataSourceImplementation(),
    );
    Get.lazyPut<TestCreationRemoteDataSource>(
      () => TestCreationRemoteDataSourceImplementation(
        communicationManager: Get.find<CommunicationManager>(),
      ),
    );
    Get.lazyPut<TestCreationRepository>(
      () => TestCreationRepositoryImplementation(
        testCreationLocalDataSource: Get.find<TestCreationLocalDataSource>(),
        testCreationRemoteDataSource: Get.find<TestCreationRemoteDataSource>(),
      ),
    );
  }
}

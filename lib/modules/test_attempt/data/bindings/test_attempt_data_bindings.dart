import 'package:get/get.dart';

import '../../../../communication/communication_manager.dart';
import '../../domain/repository/test_attempt_repository.dart';
import '../local/datasource/test_attempt_local_datasource.dart';
import '../remote/datasource/test_attempt_remote_datasource.dart';
import '../repository/test_attempt_repository.dart';

class TestAttemptDataBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestAttemptLocalDataSource>(
      () => TestAttemptLocalDataSourceImplementation(),
    );
    Get.lazyPut<TestAttemptRemoteDataSource>(
      () => TestAttemptRemoteDataSourceImplementation(
        communicationManager: Get.find<CommunicationManager>(),
      ),
    );
    Get.lazyPut<TestAttemptRepository>(
      () => TestAttemptRepositoryImplementation(
        testAttemptLocalDataSource: Get.find<TestAttemptLocalDataSource>(),
        testAttemptRemoteDataSource: Get.find<TestAttemptRemoteDataSource>(),
      ),
    );
  }
}

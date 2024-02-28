import 'package:get/get.dart';

import '../repository/downloads_repository.dart';
import '../usecase/downloads_usecase.dart';

class DownloadsDomainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DownloadsUseCase>(
      () => DownloadUseCaseImplementation(
        downloadsRepository: Get.find<DownloadsRepository>(),
      ),
    );
  }
}

import '../repository/downloads_repository.dart';

abstract class DownloadsUseCase {}

class DownloadUseCaseImplementation implements DownloadsUseCase {
  final DownloadsRepository _downloadsRepository;

  DownloadUseCaseImplementation(
      {required DownloadsRepository downloadsRepository})
      : _downloadsRepository = downloadsRepository;
}

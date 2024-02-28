import '../../domain/repository/downloads_repository.dart';
import '../../view/screens/downloads_screen.dart';
import '../local/datasource/downloads_local_datasource.dart';
import '../remote/datasource/downloads_remote_datasource.dart';

class DownloadsRepositoryImplementation implements DownloadsRepository {
  final DownloadsRemoteDataSource _remoteDataSource;
  final DownloadsLocalDataSource _localDataSource;

  DownloadsRepositoryImplementation({
    required DownloadsRemoteDataSource remoteDataSource,
    required DownloadsLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;
}

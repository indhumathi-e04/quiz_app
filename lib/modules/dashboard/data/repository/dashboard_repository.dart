import '../../domain/repository/dashboard_repository.dart';
import '../local/datasource/dashboard_local_datasource.dart';
import '../remote/datasource/dashboard_remote_datasource.dart';

class DashboardRepositoryImplementation implements DashboardRepository {
  final DashboardRemoteDataSource _remoteDataSource;
  final DashboardLocalDataSource _localDataSource;

  DashboardRepositoryImplementation({
    required DashboardRemoteDataSource remoteDataSource,
    required DashboardLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;
}

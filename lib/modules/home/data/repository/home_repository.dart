import '../../domain/repository/home_repository.dart';
import '../local/datasource/home_local_datasource.dart';
import '../remote/datasource/home_remote_datasource.dart';

class HomeRepositoryImplementation implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;
  final HomeLocalDataSource _localDataSource;
  HomeRepositoryImplementation({
    required HomeRemoteDataSource remoteDataSource,
    required HomeLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;
}

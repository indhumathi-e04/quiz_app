import '../../domain/repository/authentication_repository.dart';
import '../local/datasource/authentication_local_datasource.dart';
import '../remote/datasource/authentication_remote_datasource.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  final AuthenticationLocalDataSource _localDataSource;
  final AuthenticationRemoteDataSource _remoteDataSource;

  AuthenticationRepositoryImplementation(
      {required AuthenticationLocalDataSource localDataSource,
      required AuthenticationRemoteDataSource remoteDataSource})
      : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;
}

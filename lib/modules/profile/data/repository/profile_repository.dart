import '../../domain/repository/profile_repository.dart';
import '../local/datasource/profile_local_datasource.dart';
import '../remote/datasource/profile_remote_datasource.dart';

class ProfileRepositoryImplementation implements ProfileRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;
  final ProfileLocalDataSource _profileLocalDataSource;

  ProfileRepositoryImplementation({
    required ProfileRemoteDataSource profileRemoteDataSource,
    required ProfileLocalDataSource profileLocalDataSource,
  })  : _profileLocalDataSource = profileLocalDataSource,
        _profileRemoteDataSource = profileRemoteDataSource;
}

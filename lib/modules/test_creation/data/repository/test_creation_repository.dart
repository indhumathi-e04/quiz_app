import '../../domain/repository/test_creation_repository.dart';
import '../local/datasource/test_creation_local_datasource.dart';
import '../remote/datasource/test_creation_remote_datasource.dart';

class TestCreationRepositoryImplementation implements TestCreationRepository {
  final TestCreationLocalDataSource _testCreationLocalDataSource;
  final TestCreationRemoteDataSource _testCreationRemoteDataSource;

  TestCreationRepositoryImplementation({
    required TestCreationLocalDataSource testCreationLocalDataSource,
    required TestCreationRemoteDataSource testCreationRemoteDataSource,
  })  : _testCreationLocalDataSource = testCreationLocalDataSource,
        _testCreationRemoteDataSource = testCreationRemoteDataSource;
}

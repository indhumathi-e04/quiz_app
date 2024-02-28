import '../../domain/repository/test_attempt_repository.dart';
import '../local/datasource/test_attempt_local_datasource.dart';
import '../remote/datasource/test_attempt_remote_datasource.dart';

class TestAttemptRepositoryImplementation implements TestAttemptRepository {
  final TestAttemptLocalDataSource _testAttemptLocalDataSource;
  final TestAttemptRemoteDataSource _testAttemptRemoteDataSource;

  TestAttemptRepositoryImplementation({
    required TestAttemptLocalDataSource testAttemptLocalDataSource,
    required TestAttemptRemoteDataSource testAttemptRemoteDataSource,
  })  : _testAttemptLocalDataSource = testAttemptLocalDataSource,
        _testAttemptRemoteDataSource = testAttemptRemoteDataSource;
}

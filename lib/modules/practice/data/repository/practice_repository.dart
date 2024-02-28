import '../../domain/repository/practice_repository.dart';
import '../local/datasource/practice_local_datasource.dart';
import '../remote/datasource/practice_romote_datasource.dart';

class PracticeRepositoryImplementation implements PracticeRepository {
  final PracticeRemoteDataSource _practiceRemoteDataSource;
  final PracticeLocalDataSource _practiceLocalDataSource;

  PracticeRepositoryImplementation({
    required PracticeRemoteDataSource practiceRemoteDataSource,
    required PracticeLocalDataSource practiceLocalDataSource,
  })  : _practiceLocalDataSource = practiceLocalDataSource,
        _practiceRemoteDataSource = practiceRemoteDataSource;
}

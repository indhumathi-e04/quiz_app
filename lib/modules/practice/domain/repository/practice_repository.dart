import '../../../common/data/remote/models/result_state.dart';

abstract class PracticeRepository {
  Future<ResultState> getLatestQuizzes();
}

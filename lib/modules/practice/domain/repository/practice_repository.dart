import '../../../common/data/remote/models/result_state.dart';

abstract class PracticeRepository {
  Future<ResultState> getLatestQuizzes();
  Future<ResultState> getContinueYourProgressData();
  Future<ResultState> getTrendingMockTests();
  Future<ResultState> getAttemptPreviousYearQuestions();
  Future<ResultState> getSubjectWiseTests();
}

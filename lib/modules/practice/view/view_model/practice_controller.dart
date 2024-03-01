import 'package:get/get.dart';

import '../../../common/data/remote/models/result_state.dart';
import '../../domain/usecase/practice_usecase.dart';
import '../screens/practice_screen.dart';

class PracticeController extends GetxController {
  final PracticeUseCase _useCase;
  PracticeController({
    required PracticeUseCase useCase,
  }) : _useCase = useCase;

  List<TestDetailsModel> latestQuizzes = [];
  List<TestDetailsModel> continueYourProgressData = [];
  List<TestDetailsModel> trendingMockTests = [];
  List<TestDetailsModel> attemptPreviousYearQuestions = [];
  List<SubjectModel> subjectWiseTests = [];

  @override
  void onInit() {
    super.onInit();
    getPracticeData();
  }

  void getPracticeData() {
    getContinueYourProgressData();
    getLatestQuizzes();
    getTrendingMockTests();
    getAttemptPreviousYearQuestions();
    getSubjectWiseTests();
  }

  void getContinueYourProgressData() async {
    final result = await _useCase.getContinueYourProgressData();
    if (result.isSuccess) {
      if (result.continueYourProgressData != null &&
          result.continueYourProgressData!.isNotEmpty) {
        continueYourProgressData = result.continueYourProgressData ?? [];
      } else {
        // Empty
      }
    } else {
      // Result failure
    }
  }

  void getLatestQuizzes() async {
    final result = await _useCase.getLatestQuizzes();
    if (result.isSuccess) {
      if (result.latestQuizzes != null && result.latestQuizzes!.isNotEmpty) {
        latestQuizzes = result.latestQuizzes ?? [];
      } else {
        // Empty
      }
    } else {
      // Result failure
    }
  }

  void getTrendingMockTests() async {
    final result = await _useCase.getTrendingMockTests();
    if (result is Success) {
      if (result.trendingMockTests != null &&
          result.trendingMockTests!.isNotEmpty) {
        trendingMockTests = result.trendingMockTests ?? [];
      }
    } else {}
  }

  void getAttemptPreviousYearQuestions() async {
    final result = await _useCase.getAttemptPreviousYearQuestions();
    if (result.isSuccess) {
      if (result.attemptPreviousYearQuestions != null &&
          result.attemptPreviousYearQuestions!.isNotEmpty) {
        attemptPreviousYearQuestions =
            result.attemptPreviousYearQuestions ?? [];
      }
    } else {}
  }

  void getSubjectWiseTests() async {
    final result = await _useCase.getSubjectWiseTests();
    if (result.isSuccess) {
      if (result.subjects != null && result.subjects!.isNotEmpty) {
        subjectWiseTests = result.subjects ?? [];
      }
    } else {}
  }
}

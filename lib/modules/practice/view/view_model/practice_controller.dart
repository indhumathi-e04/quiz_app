import 'package:get/get.dart';

import '../../domain/usecase/practice_usecase.dart';
import '../screens/practice_screen.dart';

class PracticeController extends GetxController {
  final PracticeUseCase _useCase;
  PracticeController({
    required PracticeUseCase useCase,
  }) : _useCase = useCase;

  List<TestDetailsModel> latestQuizzes = [];

  @override
  void onInit() {
    super.onInit();
    getPracticeData();
  }

  void getPracticeData() {
    getContinueYourProgressData();
    getLatestQuizzes();
  }

  void getContinueYourProgressData() {}

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
}

import 'package:get/get.dart';

import '../../domain/usecase/practice_usecase.dart';

class PracticeController extends GetxController {
  final PracticeUseCase _useCase;
  PracticeController({required PracticeUseCase useCase}) : _useCase = useCase;
}

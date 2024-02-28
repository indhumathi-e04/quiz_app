import 'package:get/get.dart';

import '../../domain/usecase/home_usecase.dart';

class HomeController extends GetxController {
  final HomeUseCase _useCase;
  HomeController({required HomeUseCase useCase}) : _useCase = useCase;
}

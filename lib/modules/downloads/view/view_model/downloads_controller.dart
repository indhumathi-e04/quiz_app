import 'package:get/get.dart';

import '../../domain/usecase/downloads_usecase.dart';

class DownloadsController extends GetxController {
  final DownloadsUseCase _useCase;
  DownloadsController({required DownloadsUseCase useCase}) : _useCase = useCase;
  final value = Rxn<int>();
  List choicechipsLabelText = [
    "ALL",
    "ATTEMPTED",
    "NOT ATTEMPTED",
  ];
}

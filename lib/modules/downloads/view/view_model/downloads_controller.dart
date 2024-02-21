import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class DownloadsController extends GetxController {
  final value = Rxn<int>();
  List choicechipsLabelText = [
    "ALL",
    "ATTEMPTED",
    "NOT ATTEMPTED",
  ];
}

import 'package:get/get.dart';

import '../../../../models/home_screen.dart';
import '../../../common/view/widgets/custom_widgets/custom_dropdownfield.dart';

class HomeController extends GetxController {
  final List<DropDownFieldChoices> examName = [
    DropDownFieldChoices(id: 1, value: "NEET"),
    DropDownFieldChoices(id: 2, value: "JEE"),
    DropDownFieldChoices(id: 3, value: "TNPSC"),
  ];
  HomeModel homeModel = HomeModel();
}

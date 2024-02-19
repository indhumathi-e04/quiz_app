import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/section_model.dart';
import '../../../../models/test_model.dart';
import '../../../../routes/app_route_constants.dart';
import '../../../common/view/widgets/custom_widgets/custom_dropdownfield.dart';

class TestCreationController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  RxnInt selectedTestType = RxnInt();

  List<DropDownFieldChoices> examCategories = [
    DropDownFieldChoices(id: 1, value: "School"),
    DropDownFieldChoices(id: 2, value: "Engineering"),
    DropDownFieldChoices(id: 3, value: "Medicine"),
  ];

  List<DropDownFieldChoices> examNames = [
    DropDownFieldChoices(id: 1, value: "School"),
    DropDownFieldChoices(id: 2, value: "Engineering"),
  ];

  List<DropDownFieldChoices> contentTypes = [
    DropDownFieldChoices(id: 1, value: "School"),
    DropDownFieldChoices(id: 2, value: "Engineering"),
  ];
  List<DropDownFieldChoices> languages = [
    DropDownFieldChoices(id: 1, value: "School"),
    DropDownFieldChoices(id: 2, value: "Engineering"),
  ];
  List<DropDownFieldChoices> subjects = [
    DropDownFieldChoices(id: 1, value: "School"),
    DropDownFieldChoices(id: 2, value: "Engineering"),
  ];
  List<DropDownFieldChoices> chapters = [
    DropDownFieldChoices(id: 1, value: "School"),
    DropDownFieldChoices(id: 2, value: "Engineering"),
  ];

  TestModel testModel = TestModel();

  void onFormSubmitted() {
    FocusManager.instance.primaryFocus?.unfocus();
    bool isFormValid = _formKey.currentState?.validate() ?? false;
    if (isFormValid) {
      _formKey.currentState?.save();
      List<SectionModel> sections = List.generate(
        testModel.sectionsCount ?? 0,
        (index) => SectionModel(),
      );
      testModel.sections = sections;
      Get.toNamed(
        AppRouteConstants.routeSections,
        arguments: testModel,
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../../models/test_data_model.dart';
import '../../../../view/widgets/custom_widgets/custom_dropdownfield.dart';

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
  List<DropDownFieldChoices> testTypes = [
    DropDownFieldChoices(
      id: UIConstants.examLevelTestId,
      value: "Exam Level Test",
    ),
    DropDownFieldChoices(
      id: UIConstants.subjectLevelTestId,
      value: "Subject Level Test",
    ),
    DropDownFieldChoices(
      id: UIConstants.chapterLevelTestId,
      value: "Chapter Level Test",
    ),
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

  TestDataModel testDataModel = TestDataModel();
}

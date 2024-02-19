import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/examination_model.dart';
import '../../../common/view/widgets/custom_widgets/custom_dropdownfield.dart';

class ExamCreationController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  List<DropDownFieldChoices> examCategoryList = [
    DropDownFieldChoices(id: 1, value: "school"),
    DropDownFieldChoices(id: 2, value: "College"),
    DropDownFieldChoices(id: 1, value: "primary"),
  ];
  ExaminationModel examination = ExaminationModel();
  void onFormSubmitted() {
    FocusManager.instance.primaryFocus?.unfocus();
    bool isFormValid = formKey.currentState?.validate() ?? false;
    if (isFormValid) {
      formKey.currentState?.save();
    }
  }
}

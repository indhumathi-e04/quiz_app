import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/subject_model.dart';
import '../../../../models/syllabus_model.dart';
import '../../../../routes/route_constants.dart';
import '../../../../view/widgets/custom_widgets/custom_dropdownfield.dart';

class SyllabusController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  final List<DropDownFieldChoices> examCategoryList = [
    DropDownFieldChoices(id: 1, value: "school"),
    DropDownFieldChoices(id: 2, value: "College"),
    DropDownFieldChoices(id: 3, value: "primary")
  ];
  final List<DropDownFieldChoices> examName = [
    DropDownFieldChoices(id: 1, value: "NEET"),
    DropDownFieldChoices(id: 2, value: "JEE"),
    DropDownFieldChoices(id: 3, value: "TNPSC")
  ];
  SyllabusModel syllabusModel = SyllabusModel();
  void onFormSubmitted() {
    FocusManager.instance.primaryFocus?.unfocus();
    bool isFormValid = _formKey.currentState?.validate() ?? false;
    if (isFormValid) {
      _formKey.currentState?.save();
      List<SubjectModel> subject = List.generate(
        syllabusModel.subjectsCount ?? 0,
        (index) => SubjectModel(),
      );
      syllabusModel.subjects = subject;
      Get.toNamed(
        RouteConstants.routeSubjects,
        arguments: syllabusModel,
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/models/syllabus_model.dart';

import '../../../../view/widgets/custom_widgets/custom_dropdownfield.dart';

class SyllabusController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  List<SyllabusModel> syllabusModelList = [];

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
  SyllabusModel syllabus = SyllabusModel();
  int subjectCount = 0;
}

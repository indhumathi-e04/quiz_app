import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/models/examination_model.dart';
import 'package:quiz/view/widgets/custom_widgets/custom_dropdownfield.dart';

class ExamCreationController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  List<DropDownFieldChoices> examCategoryList = [
    DropDownFieldChoices(id: 1, value: "school"),
    DropDownFieldChoices(id: 2, value: "College"),
    DropDownFieldChoices(id: 1, value: "primary")
  ];
  ExaminationModel examination = ExaminationModel();
}

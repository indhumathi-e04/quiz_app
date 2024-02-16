import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/models/sections_model.dart';
import 'package:quiz/models/test_data_model.dart';
import 'package:quiz/view/widgets/custom_widgets/custom_dropdownfield.dart';

class SectionsController extends GetxController {
  late final int sectionCount;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  final List<SectionsModel> sectionsModelList = [];
  List<DropDownFieldChoices> isTimeSpecific = [
    DropDownFieldChoices(id: 0, value: "False"),
    DropDownFieldChoices(id: 1, value: "True"),
  ];
  bool isExpanded = false;
  @override
  void onInit() {
    super.onInit();
    TestDataModel testModel = Get.arguments;
    sectionCount = testModel.sectionsCount ?? 0;
    sectionsModelList.addAll(
      List.generate(
        sectionCount,
        (index) => SectionsModel(),
      ),
    );
  }
}

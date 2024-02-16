import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/sections_model.dart';
import '../../../../models/test_data_model.dart';

class SectionsController extends GetxController {
  late final int sectionCount;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  final List<SectionsModel> sectionsModelList = [];

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

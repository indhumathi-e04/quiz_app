import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/test_model.dart';

class QuestionsController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  late final TestModel testModel;

  @override
  void onInit() {
    super.onInit();
    testModel = Get.arguments;
  }
}

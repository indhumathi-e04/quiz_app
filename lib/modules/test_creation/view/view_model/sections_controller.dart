import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/question_model.dart';
import '../../../../models/section_model.dart';
import '../../../../models/test_model.dart';
import '../../../../routes/route_constants.dart';

class SectionsController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  late final int testId;
  late final TestModel testModel;

  @override
  void onInit() {
    super.onInit();
    testModel = Get.arguments;
  }

  void onFormSubmitted() {
    bool isFormValid = _formKey.currentState?.validate() ?? false;
    if (isFormValid) {
      _formKey.currentState?.save();
      for (SectionModel section in testModel.sections ?? []) {
        List<QuestionModel> questions = List.generate(
          section.questionCount ?? 0,
          (index) => QuestionModel(),
        );
        section.questions = questions;
        section.isExpanded.value = false;
      }
      Get.toNamed(
        RouteConstants.routeQuestions,
        arguments: testModel,
      );
    }
  }
}

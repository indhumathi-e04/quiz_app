import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/question_model.dart';
import '../../../../models/section_model.dart';
import '../../../../models/test_model.dart';
import '../../../../routes/app_route_constants.dart';
import '../../domain/usecase/test_creation_usecase.dart';

class SectionsController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  final TestCreationUseCase _useCase;
  SectionsController({required TestCreationUseCase useCase})
      : _useCase = useCase;

  late final int testId;
  late final TestModel testModel;

  @override
  void onInit() {
    super.onInit();
    testModel = Get.arguments;
  }

  void onFormSubmitted() {
    FocusManager.instance.primaryFocus?.unfocus();
    bool isFormValid = _formKey.currentState?.validate() ?? false;
    if (isFormValid) {
      _formKey.currentState?.save();
      int totalQuestions = 0;
      int lastSectionlastQuestion = 0;
      for (int i = 0; i < (testModel.sections?.length ?? 0); i++) {
        SectionModel section = testModel.sections?[i] ?? SectionModel();
        totalQuestions += section.questionCount ?? 0;
        if (i == 0) {
          section.firstQuestionIndex = 0;
        } else {
          section.firstQuestionIndex = lastSectionlastQuestion + 1;
        }
        section.lastQuestionIndex = totalQuestions - 1;
        lastSectionlastQuestion = section.lastQuestionIndex ?? 0;
      }
      testModel.questionsCount = totalQuestions;
      testModel.questions = List.generate(
        totalQuestions,
        (index) => QuestionModel(),
      );
      Get.toNamed(
        AppRouteConstants.routeQuestions,
        arguments: testModel,
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/test_model.dart';
import '../../../../routes/app_route_constants.dart';
import '../../domain/usecase/test_creation_usecase.dart';

class QuestionsController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  final TestCreationUseCase _useCase;
  QuestionsController({required TestCreationUseCase useCase})
      : _useCase = useCase;

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
      Get.toNamed(
        AppRouteConstants.routeTestInstructions,
        arguments: testModel,
      );
    }
  }
}

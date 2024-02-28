import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/usecase/authentication_usecase.dart';

class AuthenticationController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  final AuthenticationUseCase _useCase;

  AuthenticationController({required AuthenticationUseCase useCase})
      : _useCase = useCase;

  void onFormSubmitted() {
    bool isFormValid = _formKey.currentState?.validate() ?? false;
    if (isFormValid) {}
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  void onFormSubmitted() {
    bool isFormValid = _formKey.currentState?.validate() ?? false;
    if (isFormValid) {}
  }
}

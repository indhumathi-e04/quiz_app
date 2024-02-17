import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/syllabus_model.dart';

class ChaptersController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;
  late final SyllabusModel syllabusModel;

  @override
  void onInit() {
    super.onInit();
    syllabusModel = Get.arguments;
  }

  void onFormSubmitted() {}
}

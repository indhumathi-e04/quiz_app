import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/models/sections_model.dart';

class QuestionsController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  late final List<SectionsModel> sectionsModelList;
  @override
  void onInit() {
    super.onInit();
    sectionsModelList = Get.arguments;
  }
}

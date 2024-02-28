import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/syllabus_model.dart';
import '../../domain/usecase/exam_syllabus_creation_usecase.dart';

class ChaptersController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ExamSyllabusCreationUseCase _useCase;
  ChaptersController({required ExamSyllabusCreationUseCase useCase})
      : _useCase = useCase;

  GlobalKey<FormState> get formKey => _formKey;
  late final SyllabusModel syllabusModel;

  @override
  void onInit() {
    super.onInit();
    syllabusModel = Get.arguments;
  }

  void onFormSubmitted() {}
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/chapter_model.dart';
import '../../../../models/subject_model.dart';
import '../../../../models/syllabus_model.dart';
import '../../../../routes/route_constants.dart';

class SubjectsController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  late final SyllabusModel syllabusModel;
  @override
  void onInit() {
    super.onInit();
    syllabusModel = Get.arguments;
  }

  void onFormSubmitted() {
    FocusManager.instance.primaryFocus?.unfocus();
    bool isFormValid = _formKey.currentState?.validate() ?? false;
    if (isFormValid) {
      _formKey.currentState?.save();

      for (SubjectModel subjectModel in syllabusModel.subjects ?? []) {
        subjectModel.chapters = List.generate(
          subjectModel.chaptersCount ?? 0,
          (index) => ChapterModel(),
        );
      }

      Get.toNamed(
        RouteConstants.routeChapters,
        arguments: syllabusModel,
      );
    }
  }
}

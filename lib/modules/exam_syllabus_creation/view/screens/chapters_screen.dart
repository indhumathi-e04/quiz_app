import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../models/chapter_model.dart';
import '../../../../view/widgets/custom_widgets/custom_textformfield.dart';

import '../../../../constants/ui_constants.dart';
import '../../../../models/subject_model.dart';
import '../view_model/chapters_controller.dart';
import '../view_model/subjects_controller.dart';

class ChapterScreen extends StatelessWidget {
  ChapterScreen({
    super.key,
  });

  final ChaptersController controller =
      Get.put<ChaptersController>(ChaptersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chapters",
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: Column(
          children: List.generate(
            controller.syllabusModel.subjects?.length ?? 0,
            (index) => SubjectChapterPanel(
              subjectChapterIndex: index,
            ),
          ),
        ),
      ),
    );
  }
}

class SubjectChapterPanel extends StatelessWidget {
  SubjectChapterPanel({required this.subjectChapterIndex, super.key});
  final int subjectChapterIndex;
  final SubjectsController controller = Get.find<SubjectsController>();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        controller.syllabusModel.subjects?[subjectChapterIndex].subjectTitle ??
            "",
      ),
      children: List.generate(
          controller.syllabusModel.subjects?[subjectChapterIndex].chapters?.length ?? 0, (index)=> Chapter(),),
    );
  }
}

class Chapter extends StatelessWidget {
  Chapter({super.key});
  final ChaptersController controller = Get.find<ChaptersController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          labelText: "Chapter Title",
          onSaved: (value) {
            if (value != null) {
              controller.syllabusModel.subjects = value;
            }
          },
          validator: (value) {
            if (value == null) {
              return "Field is required. Please enter chapter title";
            } else {
              if (value.trim().isEmpty) {
                return "Field is required. Please enter chapter title";
              } else {
                return null;
              }
            }
          },
        ),
        CustomTextFormField(
          labelText: "Weightage",
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
          onSaved: (value) {
            if (value != null) {
              controller.chapterModel.weightage = int.parse(value);
            }
          },
          validator: (value) {
            if (value == null) {
              return "Field is required. Please enter weightage";
            } else {
              if (value.trim().isEmpty) {
                return "Field is required. Please enter weightage";
              } else {
                return null;
              }
            }
          },
        ),
        CustomTextFormField(
          labelText: "Major Topics",
          onSaved: (value) {
            if (value != null) {
              controller.chapterModel.majorTopics = value;
            }
          },
          validator: (value) {
            if (value == null) {
              return "Field is required. Please enter major topics";
            } else {
              if (value.trim().isEmpty) {
                return "Field is required. Please enter major topics";
              } else {
                return null;
              }
            }
          },
        ),
      ],
    );
  }

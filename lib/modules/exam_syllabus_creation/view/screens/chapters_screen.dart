import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../../models/chapter_model.dart';
import '../../../../models/subject_model.dart';
import '../../../common/view/widgets/custom_widgets/custom_elevated_button.dart';
import '../../../common/view/widgets/custom_widgets/custom_textformfield.dart';
import '../view_model/chapters_controller.dart';

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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(
                UIConstants.defaultPadding,
              ),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: List.generate(
                    controller.syllabusModel.subjects?.length ?? 0,
                    (index) => Container(
                      margin: const EdgeInsets.only(
                        bottom: UIConstants.defaultHeight,
                      ),
                      child: SubjectChapterPanel(
                        subjectModel:
                            controller.syllabusModel.subjects?[index] ??
                                SubjectModel(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          CustomElevatedButton(
            buttonHeight: UIConstants.defaultHeight * 5,
            isLoading: false,
            onPressed: controller.onFormSubmitted,
            buttonText: "Proceed",
          ),
        ],
      ),
    );
  }
}

class SubjectChapterPanel extends StatelessWidget {
  const SubjectChapterPanel({
    required this.subjectModel,
    super.key,
  });
  final SubjectModel subjectModel;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      maintainState: true,
      title: Text(
        subjectModel.subjectTitle ?? "",
        style: Theme.of(context).textTheme.displaySmall,
      ),
      children: List.generate(
        subjectModel.chapters?.length ?? 0,
        (index) => Container(
          margin: const EdgeInsets.only(
            bottom: UIConstants.defaultHeight,
          ),
          child: ChapterPanel(
            chapterTitle: "Chapter - ${index + 1}",
            chapterModel: subjectModel.chapters?[index] ?? ChapterModel(),
          ),
        ),
      ),
    );
  }
}

class ChapterPanel extends StatelessWidget {
  const ChapterPanel({
    required this.chapterTitle,
    required this.chapterModel,
    super.key,
  });
  final String chapterTitle;
  final ChapterModel chapterModel;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      maintainState: true,
      title: Text(
        chapterTitle,
        style: Theme.of(context).textTheme.displaySmall,
      ),
      children: [
        CustomTextFormField(
          labelText: "Chapter Title",
          onSaved: (value) {
            if (value != null) {
              chapterModel.chapterTitle = value;
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
              chapterModel.weightage = int.parse(value);
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
              chapterModel.majorTopics = value;
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
}

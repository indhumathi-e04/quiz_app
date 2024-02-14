import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';
import 'package:quiz/models/subject_model.dart';
import 'package:quiz/view/widgets/chapters.dart';
import 'package:quiz/view/widgets/custom_widgets/custom_button.dart';

class ChapterScreen extends StatelessWidget {
  ChapterScreen({
    super.key,
    required this.subjectModelList,
  });
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<SubjectModel> subjectModelList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chapters > Physics",
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView.separated(
          padding: const EdgeInsets.all(
            UIConstants.defaultHeight * 2,
          ),
          itemCount: subjectModelList.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: UIConstants.defaultHeight,
          ),
          itemBuilder: (context, index) => Chapter(
            chapterTitle: "Chapter-${index + 1}",
          ),
        ),
      ),
    );
  }
}

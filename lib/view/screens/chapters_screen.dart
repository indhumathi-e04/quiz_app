import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/custom_widgets/custom_textformfield.dart';

import '../../constants/ui_constants.dart';
import '../../models/subject_model.dart';

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
        title: const Text(
          "Chapters",
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
          itemBuilder: (context, index) =>
              Chapter(chapterTitle: "Chapter-${index + 1}"),
        ),
      ),
    );
  }
}

class ChapterPanel extends StatefulWidget {
  const ChapterPanel({
    required this.chapterTitle,
    required this.chapterCount,
    super.key,
  });
  final String chapterTitle;
  final int chapterCount;

  @override
  State<ChapterPanel> createState() => _SectionsState();
}

class _SectionsState extends State<ChapterPanel> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Chapter());
  }
}

class Chapter extends StatefulWidget {
  const Chapter({super.key});

  @override
  State<Chapter> createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          margin: const EdgeInsets.only(
            bottom: UIConstants.defaultMargin * 2,
          ),
          labelText: "Chapter Title",
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
          keyboardtype: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          margin: const EdgeInsets.only(
            bottom: UIConstants.defaultMargin * 2,
          ),
          labelText: "Weightage",
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
          margin: const EdgeInsets.only(
            bottom: UIConstants.defaultMargin * 2,
          ),
          labelText: "Major Topics",
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

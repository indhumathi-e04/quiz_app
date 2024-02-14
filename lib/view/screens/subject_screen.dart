import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';
import 'package:quiz/models/subject_model.dart';
import 'package:quiz/models/syllabus_model.dart';
import 'package:quiz/view/screens/chapters_screen.dart';

import 'package:quiz/view/widgets/custom_widgets/custom_button.dart';
import 'package:quiz/view/widgets/subjects.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({
    required this.subjectCount,
    super.key,
  });
  final int subjectCount;

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<SubjectModel> subjectModelList = [];
  @override
  void initState() {
    super.initState();
    subjectModelList.addAll(
      List.generate(
        widget.subjectCount,
        (index) => SubjectModel(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Subjects > NEET - 2024",
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomButton(
        isLoading: false,
        onPressed: () {
          bool isFormValid = _formKey.currentState!.validate();
          if (isFormValid) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChapterScreen(
                  subjectModelList: subjectModelList,
                ),
              ),
            );
          }
        },
        buttonText: "Submit",
      ),
      body: Form(
        key: _formKey,
        child: ListView.separated(
          padding: const EdgeInsets.all(UIConstants.defaultHeight * 2),
          itemCount: widget.subjectCount,
          separatorBuilder: (context, index) => const SizedBox(
            height: UIConstants.defaultHeight,
          ),
          itemBuilder: (context, index) => Subjects(
            subjectCount: "Subject-${index + 1}",
            subjectModel: subjectModelList[index],
          ),
        ),
      ),
    );
  }
}

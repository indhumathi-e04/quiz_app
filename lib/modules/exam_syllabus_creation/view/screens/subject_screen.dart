import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../models/subject_model.dart';
import '../../../common/view/widgets/custom_widgets/custom_textformfield.dart';

import '../../../../constants/ui_constants.dart';

import '../../../common/view/widgets/custom_widgets/custom_elevated_button.dart';

import '../view_model/subjects_controller.dart';

class SubjectScreen extends StatelessWidget {
  SubjectScreen({super.key});
  final SubjectsController controller =
      Get.put<SubjectsController>(SubjectsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Subjects",
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(UIConstants.defaultPadding),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: List.generate(
                    controller.syllabusModel.subjects?.length ?? 0,
                    (index) => Container(
                      margin: const EdgeInsets.only(
                        bottom: UIConstants.defaultHeight,
                      ),
                      child: SubjectPanel(
                        subjectTitle: "Subject - ${index + 1}",
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

class SubjectPanel extends StatelessWidget {
  const SubjectPanel({
    required this.subjectTitle,
    required this.subjectModel,
    super.key,
  });
  final String subjectTitle;
  final SubjectModel subjectModel;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      maintainState: true,
      title: Text(
        subjectTitle,
        style: Theme.of(context).textTheme.displaySmall,
      ),
      children: [
        CustomTextFormField(
          labelText: "Subject Title",
          onSaved: (value) {
            if (value != null) {
              subjectModel.subjectTitle = value;
            }
          },
          validator: (value) {
            if (value == null) {
              return "Field is required. Please enter subject title";
            } else {
              if (value.trim().isEmpty) {
                return "Field is required. Please enter subject title";
              } else {
                return null;
              }
            }
          },
        ),
        CustomTextFormField(
          labelText: "Subject Icon",
          onSaved: (value) {
            if (value != null) {
              subjectModel.subjectIcon = value;
            }
          },
          validator: (value) {
            if (value == null) {
              return "Field is required. Please enter subject icon";
            } else {
              if (value.trim().isEmpty) {
                return "Field is required. Please enter subject icon";
              } else {
                return null;
              }
            }
          },
        ),
        CustomTextFormField(
          labelText: "Chapters",
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
          onSaved: (value) {
            if (value != null) {
              subjectModel.chaptersCount = int.parse(value);
            }
          },
          validator: (value) {
            if (value == null) {
              return "Field is required. Please enter chapter count";
            } else {
              if (value.trim().isEmpty) {
                return "Field is required. Please enter chapter count";
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

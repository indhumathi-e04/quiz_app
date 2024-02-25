import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../common/view/widgets/custom_widgets/custom_dropdownfield.dart';
import '../../../common/view/widgets/custom_widgets/custom_elevated_button.dart';
import '../../../common/view/widgets/custom_widgets/custom_textformfield.dart';
import '../view_model/syllabus_controller.dart';

class SyllabusScreen extends StatelessWidget {
  SyllabusScreen({super.key});

  final SyllabusController controller = Get.find<SyllabusController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Syllabus",
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
                  children: [
                    CustomDropDownField(
                      labelText: "Exam Category",
                      value: controller.syllabusModel.examCategory,
                      items: controller.examCategoryList,
                      onChanged: (value) {
                        if (value != null) {
                          controller.syllabusModel.examCategory = value.id;
                        }
                      },
                      onSaved: (value) {
                        if (value != null) {
                          controller.syllabusModel.examCategory = value.id;
                        }
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Field is required. Choose exam category";
                        }
                        return null;
                      },
                    ),
                    CustomDropDownField(
                      labelText: "Exam Name",
                      value: controller.syllabusModel.examName,
                      items: controller.examName,
                      onChanged: (value) {
                        if (value != null) {
                          controller.syllabusModel.examName = value.id;
                        }
                      },
                      onSaved: (value) {
                        if (value != null) {
                          controller.syllabusModel.examName = value.id;
                        }
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Field is require.Choose exam name";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      labelText: "Exam Year",
                      onSaved: (value) {
                        if (value != null) {
                          controller.syllabusModel.examYear = int.parse(value);
                        }
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Field is required. Please enter exam year";
                        } else {
                          if (value.trim().isEmpty) {
                            return "Field is required. Please enter exam year";
                          } else {
                            try {
                              int.parse(value.trim());
                              return null;
                            } catch (_) {
                              return "Please enter valid exam year";
                            }
                          }
                        }
                      },
                    ),
                    CustomTextFormField(
                      labelText: "Official Syllabus Link",
                      onSaved: (value) {
                        if (value != null) {
                          controller.syllabusModel.syllabusLink = value;
                        }
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Field is required. Please enter syllabus link";
                        } else {
                          if (value.trim().isEmpty) {
                            return "Field is required. Please enter syllabus link";
                          } else {
                            return null;
                          }
                        }
                      },
                    ),
                    CustomTextFormField(
                      labelText: "Subjects",
                      onSaved: (value) {
                        if (value != null) {
                          controller.syllabusModel.subjectsCount =
                              int.parse(value);
                        }
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Field is required. Please enter subject count";
                        } else {
                          if (value.trim().isEmpty) {
                            return "Field is required. Please enter subject count";
                          } else {
                            return null;
                          }
                        }
                      },
                    ),
                  ],
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

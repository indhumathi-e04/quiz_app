import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../../view/widgets/custom_widgets/custom_dropdownfield.dart';
import '../../../../view/widgets/custom_widgets/custom_elevated_button.dart';
import '../../../../view/widgets/custom_widgets/custom_textformfield.dart';
import '../view_model/examinations_controller.dart';

class ExamCreationScreen extends StatelessWidget {
  ExamCreationScreen({super.key});

  final ExamCreationController controller = Get.put<ExamCreationController>(
    ExamCreationController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Examinations",
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
                  children: [
                    CustomDropDownField(
                      labelText: "Exam Category",
                      items: controller.examCategoryList,
                      value: controller.examination.examCategory,
                      onSaved: (value) {
                        if (value != null) {
                          controller.examination.examCategory = value.id;
                        }
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Field is required. Choose exam category";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      labelText: "Exam Name",
                      onSaved: (value) {
                        if (value != null) {
                          controller.examination.examName = value;
                        }
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Field is required. Please enter Exam Name";
                        } else {
                          if (value.trim().isEmpty) {
                            return "Field is required. Please enter exam name";
                          } else {
                            return null;
                          }
                        }
                      },
                    ),
                    CustomTextFormField(
                      labelText: "Exam Icon",
                      onSaved: (value) {
                        if (value != null) {
                          controller.examination.examIcon = value;
                        }
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Field is required. Please enter exam icon";
                        } else {
                          if (value.trim().isEmpty) {
                            return "Field is required. Please enter exam icon";
                          } else {
                            return null;
                          }
                        }
                      },
                    ),
                    CustomTextFormField(
                      labelText: "Official Website",
                      onSaved: (value) {
                        if (value != null) {
                          controller.examination.officialWebsite = value;
                        }
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Field is required. Please enter official website";
                        } else {
                          if (value.trim().isEmpty) {
                            return "Field is required. Please enter official website";
                          } else {
                            return null;
                          }
                        }
                      },
                    ),
                    CustomTextFormField(
                      labelText: "Organizer",
                      onSaved: (value) {
                        if (value != null) {
                          controller.examination.organizer = value;
                        }
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Field is required. Please enter organizer";
                        } else {
                          if (value.trim().isEmpty) {
                            return "Field is required. Please enter organizer";
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
            buttonHeight: 50,
            isLoading: false,
            onPressed: controller.onFormSubmitted,
            buttonText: "Submit",
          ),
        ],
      ),
    );
  }
}

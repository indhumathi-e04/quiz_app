import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../../view/widgets/custom_widgets/custom_dropdownfield.dart';
import '../../../../view/widgets/custom_widgets/custom_elevated_button.dart';
import '../../../../view/widgets/custom_widgets/custom_multiline_textformfield.dart';
import '../../../../view/widgets/custom_widgets/custom_textformfield.dart';
import '../view_model/test_creation_controller.dart';

class TestCreationScreen extends StatelessWidget {
  TestCreationScreen({super.key});

  final TestCreationController controller = Get.put<TestCreationController>(
    TestCreationController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create New Test",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(
                UIConstants.defaultPadding * 2,
              ),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    CustomDropDownField(
                      labelText: "Exam Category",
                      items: controller.examCategories,
                      value: controller.testModel.examCategory,
                      onChanged: (value) {
                        if (value != null) {
                          controller.testModel.examCategory = value.id;
                        }
                      },
                      onSaved: (value) {
                        if (value != null) {
                          controller.testModel.examCategory = value.id;
                        }
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Field is required. Choose an exam category.";
                        }
                        return null;
                      },
                    ),
                    CustomDropDownField(
                      labelText: "Exam Name",
                      items: controller.examNames,
                      value: controller.testModel.examName,
                      onChanged: (value) {
                        if (value != null) {
                          controller.testModel.examName = value.id;
                        }
                      },
                      onSaved: (value) {
                        if (value != null) {
                          controller.testModel.examName = value.id;
                        }
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Field is required. Choose the exam name.";
                        }
                        return null;
                      },
                    ),
                    CustomDropDownField(
                      labelText: "Test Type",
                      items: UIConstants.testTypes,
                      value: controller.testModel.testType,
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedTestType.value = value.id;
                        }
                      },
                      onSaved: (value) {
                        if (value != null) {
                          controller.testModel.testType = value.id;
                        }
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Field is required. Choose the test type.";
                        }
                        return null;
                      },
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.selectedTestType.value ==
                            UIConstants.examLevelTestId,
                        child: CustomDropDownField(
                          labelText: "Content Type",
                          items: controller.contentTypes,
                          value: controller.testModel.contentType,
                          onChanged: (value) {
                            if (value != null) {
                              controller.testModel.contentType = value.id;
                            }
                          },
                          onSaved: (value) {
                            if (value != null) {
                              controller.testModel.contentType = value.id;
                            }
                          },
                          validator: (value) {
                            if (value == null) {
                              return "Field is required. Choose the test content type.";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.selectedTestType.value ==
                                UIConstants.subjectLevelTestId ||
                            controller.selectedTestType.value ==
                                UIConstants.chapterLevelTestId,
                        child: CustomDropDownField(
                          labelText: "Subject",
                          items: controller.subjects,
                          value: controller.testModel.subject,
                          onChanged: (value) {
                            if (value != null) {
                              controller.testModel.subject = value.id;
                            }
                          },
                          onSaved: (value) {
                            if (value != null) {
                              controller.testModel.subject = value.id;
                            }
                          },
                          validator: (value) {
                            if (value == null) {
                              return "Field is required. Choose the subject.";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.selectedTestType.value ==
                            UIConstants.chapterLevelTestId,
                        child: CustomDropDownField(
                          labelText: "Chapter",
                          items: controller.chapters,
                          value: controller.testModel.chapter,
                          onSaved: (value) {
                            if (value != null) {
                              controller.testModel.chapter = value.id;
                            }
                          },
                          validator: (value) {
                            if (value == null) {
                              return "Field is required. Choose the chapter.";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    CustomDropDownField(
                      labelText: "Language",
                      items: controller.languages,
                      value: controller.testModel.language,
                      onChanged: (value) {
                        if (value != null) {
                          controller.testModel.language = value.id;
                        }
                      },
                      onSaved: (value) {
                        if (value != null) {
                          controller.testModel.language = value.id;
                        }
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Field is required. Choose the language.";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      labelText: "Test Title",
                      onSaved: (value) {
                        if (value != null) {
                          controller.testModel.testTitle = value;
                        }
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Field is required. Please enter the test title.";
                        } else {
                          if (value.trim().isEmpty) {
                            return "Field cannot be empty. Please enter a valid test title.";
                          } else {
                            if (value.trim().length < 5) {
                              return "Test title should be more than 5 characters. Please enter a valid test title.";
                            }
                            return null;
                          }
                        }
                      },
                    ),
                    CustomTextFormField(
                      labelText: "Time limit (In Minutes)",
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onSaved: (value) {
                        if (value != null) {
                          controller.testModel.timeLimit = int.parse(value);
                        }
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Field is required. Please enter the time limit for the test.";
                        } else {
                          if (value.trim().isEmpty) {
                            return "Field cannot be empty. Please enter a valid time limit for the test.";
                          } else {
                            try {
                              int.parse(value.trim());
                              return null;
                            } catch (_) {
                              return "Enter valid time limit in minutes.";
                            }
                          }
                        }
                      },
                    ),
                    CustomTextFormField(
                      labelText: "Sections Count",
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onSaved: (value) {
                        if (value != null) {
                          controller.testModel.sectionsCount = int.parse(value);
                        }
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Field is required. Please enter the section count of the test. Enter '1' if your test doesn't contain multiple sections.";
                        } else {
                          if (value.trim().isEmpty) {
                            return "Field cannot be empty. Please enter a valid section count for the test.";
                          } else {
                            try {
                              int.parse(value.trim());
                              return null;
                            } catch (_) {
                              return "Enter valid section count. Enter '1' if your test doesn't contain multiple sections.";
                            }
                          }
                        }
                      },
                    ),
                    CustomMultiLineTextFormField(
                      labelText: "Instructions",
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      onSaved: (value) {
                        controller.testModel.instructions = value;
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../../routes/route_constants.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomElevatedButton(
        buttonHeight: UIConstants.defaultHeight * 5,
        isLoading: false,
        onPressed: () {
          bool isFormValid =
              controller.formKey.currentState?.validate() ?? false;
          if (isFormValid) {
            controller.formKey.currentState?.save();
            Get.toNamed(
              RouteConstants.routeSections,
              arguments: controller.testDataModel,
            );
          }
        },
        buttonText: "Proceed",
      ),
      body: SingleChildScrollView(
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
                onChanged: (value) {
                  if (value != null) {
                    controller.testDataModel.examCategory = value.id;
                  }
                },
                onSaved: (value) {
                  if (value != null) {
                    controller.testDataModel.examCategory = value.id;
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
                onChanged: (value) {
                  if (value != null) {
                    controller.testDataModel.examName = value.id;
                  }
                },
                onSaved: (value) {
                  if (value != null) {
                    controller.testDataModel.examName = value.id;
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
                items: controller.testTypes,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedTestType.value = value.id;
                  }
                },
                onSaved: (value) {
                  if (value != null) {
                    controller.testDataModel.testType = value.id;
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
                    onChanged: (value) {
                      if (value != null) {
                        controller.testDataModel.contentType = value.id;
                      }
                    },
                    onSaved: (value) {
                      if (value != null) {
                        controller.testDataModel.contentType = value.id;
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
                    onChanged: (value) {
                      if (value != null) {
                        controller.testDataModel.subject = value.id;
                      }
                    },
                    onSaved: (value) {
                      if (value != null) {
                        controller.testDataModel.subject = value.id;
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
                    onSaved: (value) {
                      if (value != null) {
                        controller.testDataModel.chapter = value.id;
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
                onChanged: (value) {},
                onSaved: (value) {
                  if (value != null) {
                    controller.testDataModel.language = value.id;
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
                    controller.testDataModel.testTitle = value;
                  }
                },
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Please enter the test title.";
                  } else {
                    if (value.trim().isEmpty) {
                      return "Field cannot be empty. Please enter a valid test title.";
                    } else {
                      if (value.trim().length > 5) {
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
                    controller.testDataModel.timeLimit = int.parse(value);
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
                    controller.testDataModel.sectionsCount = int.parse(value);
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
                  controller.testDataModel.instructions = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

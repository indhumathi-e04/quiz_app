import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../../models/sections_model.dart';
import '../../../../view/widgets/custom_widgets/custom_dropdownfield.dart';
import '../../../../view/widgets/custom_widgets/custom_elevated_button.dart';
import '../../../../view/widgets/custom_widgets/custom_textformfield.dart';
import '../view_model/sections_controller.dart';
import 'questions_screen.dart';

class SectionsScreen extends StatelessWidget {
  SectionsScreen({super.key});
  final SectionsController controller = Get.put<SectionsController>(
    SectionsController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sections",
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomElevatedButton(
        buttonHeight: 50,
        isLoading: false,
        onPressed: () {
          bool isFormValid = controller.formKey.currentState!.validate();
          if (isFormValid) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => QuestionScreen(
                  sectionModelList: controller.sectionsModelList,
                ),
              ),
            );
          }
        },
        buttonText: "Proceed",
      ),
      body: Form(
        key: controller.formKey,
        child: ListView.separated(
          padding: const EdgeInsets.all(UIConstants.defaultHeight * 2),
          itemCount: controller.sectionCount,
          separatorBuilder: (context, index) => const SizedBox(
            height: UIConstants.defaultHeight,
          ),
          itemBuilder: (context, index) => SectionPanel(
            sectionTitle: "Section-${index + 1}",
            sectionModel: controller.sectionsModelList[index],
          ),
        ),
      ),
    );
  }
}

class SectionPanel extends StatelessWidget {
  SectionPanel({
    super.key,
    required this.sectionTitle,
    required this.sectionModel,
  });

  final String sectionTitle;
  final SectionsModel sectionModel;

  final List<DropDownFieldChoices> isTimeSpecific = [
    DropDownFieldChoices(id: 0, value: "False"),
    DropDownFieldChoices(id: 1, value: "True"),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ExpansionPanelList(
        expansionCallback: (int _, bool __) {
          sectionModel.isExpanded.value = !sectionModel.isExpanded.value;
        },
        elevation: 0,
        expandedHeaderPadding: EdgeInsets.zero,
        children: [
          ExpansionPanel(
            canTapOnHeader: true,
            backgroundColor:
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
            headerBuilder: (context, isExpanded) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(
                    UIConstants.defaultPadding,
                  ),
                  child: Text(
                    sectionTitle,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              );
            },
            isExpanded: sectionModel.isExpanded.value,
            body: Padding(
              padding: const EdgeInsets.all(
                UIConstants.defaultPadding,
              ),
              child: Column(
                children: [
                  CustomTextFormField(
                    labelText: "Section Title",
                    onChanged: (value) {
                      sectionModel.sectionTitle = value;
                    },
                    margin: const EdgeInsets.only(
                        bottom: UIConstants.defaultMargin * 2),
                    validator: (value) {
                      if (value == null) {
                        return "Field is required. Please enter section title";
                      } else {
                        if (value.trim().isEmpty) {
                          return "Field is required. Please enter section title";
                        } else {
                          return null;
                        }
                      }
                    },
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    labelText: "Question Count",
                    onChanged: (value) {
                      sectionModel.questionCount = int.parse(value);
                    },
                    margin: const EdgeInsets.only(
                      bottom: UIConstants.defaultMargin * 2,
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Field is required. Please enter question count";
                      } else {
                        if (value.trim().isEmpty) {
                          return "Field is required. Please enter question count";
                        } else {
                          return null;
                        }
                      }
                    },
                  ),
                  CustomTextFormField(
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'),
                      ),
                    ],
                    labelText: "Positive Marks",
                    margin: const EdgeInsets.only(
                        bottom: UIConstants.defaultMargin * 2),
                    onChanged: (value) {
                      sectionModel.positiveMarks = double.parse(value);
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Field is required. Please enter positive marks";
                      } else {
                        if (value.trim().isEmpty) {
                          return "Field is required. Please enter positive marks";
                        } else {
                          return null;
                        }
                      }
                    },
                  ),
                  CustomTextFormField(
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'),
                      )
                    ],
                    labelText: "Negative Marks",
                    margin: const EdgeInsets.only(
                        bottom: UIConstants.defaultMargin * 2),
                    onChanged: (value) {
                      sectionModel.negativeMarks = double.parse(value);
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Field is required. Please enter negative marks";
                      } else {
                        if (value.trim().isEmpty) {
                          return "Field is required. Please enter negative marks";
                        } else {
                          return null;
                        }
                      }
                    },
                  ),
                  CustomDropDownField(
                    margin: const EdgeInsets.only(
                      bottom: UIConstants.defaultMargin * 2,
                    ),
                    labelText: "Is Section Time Specific ?",
                    items: isTimeSpecific,
                    onChanged: (value) {
                      if (value != null) {
                        sectionModel.isTimeSpecific.value = value.id;
                      }
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Field is required. Is Section is time specific or not";
                      }
                      return null;
                    },
                  ),
                  Obx(
                    () => Visibility(
                      visible: sectionModel.isTimeSpecific.value == 1,
                      child: CustomTextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        margin: const EdgeInsets.only(
                          bottom: UIConstants.defaultMargin * 2,
                        ),
                        labelText: "Time Limit (In Minutes)",
                        onChanged: (value) {
                          sectionModel.sectionTimeLimit = int.parse(value);
                        },
                        validator: (value) {
                          if (value == null) {
                            return "Field is required. Please enter time limit";
                          } else {
                            if (value.trim().isEmpty) {
                              return "Field is required. Please enter time limit";
                            } else {
                              return null;
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

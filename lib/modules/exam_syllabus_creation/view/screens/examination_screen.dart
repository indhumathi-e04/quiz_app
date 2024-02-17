import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quiz/modules/exam_syllabus_creation/view/view_model/examinations_controller.dart';

import '../../../../constants/ui_constants.dart';
import '../../../../view/widgets/custom_widgets/custom_elevated_button.dart';
import '../../../../view/widgets/custom_widgets/custom_dropdownfield.dart';
import '../../../../view/widgets/custom_widgets/custom_textformfield.dart';

class ExaminationScreen extends StatelessWidget {
  ExaminationScreen({super.key});
  final ExaminationsController controller = Get.put<ExaminationsController>(
    ExaminationsController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Examinations",
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomElevatedButton(
        isLoading: false,
        onPressed: () {
          bool isFormValid =
              controller.formKey.currentState?.validate() ?? false;
          if (isFormValid) {
            controller.formKey.currentState?.save();
          }
        },
        buttonText: "Submit",
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
                items: controller.examCategoryList,
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
                      try {
                        return null;
                      } catch (_) {}
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
                      try {
                        return null;
                      } catch (_) {}
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
                      try {
                        return null;
                      } catch (_) {}
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
                      try {
                        return null;
                      } catch (_) {}
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class ExaminationScreen extends StatefulWidget {
//   const ExaminationScreen({super.key});

//   @override
//   State<ExaminationScreen> createState() => _ExaminationScreenState();
// }

// class _ExaminationScreenState extends State<ExaminationScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   List<DropDownFieldChoices> examCategoryList = [
//     DropDownFieldChoices(id: 1, value: "school"),
//     DropDownFieldChoices(id: 2, value: "College"),
//     DropDownFieldChoices(id: 1, value: "primary")
//   ];
//   ExaminationModel examination = ExaminationModel();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Examinations",
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: CustomElevatedButton(
//         isLoading: false,
//         onPressed: () {
//           bool isFormValid = _formKey.currentState!.validate();
//           if (isFormValid) {}
//         },
//         buttonText: "Submit",
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(
//           UIConstants.defaultPadding * 2,
//         ),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               CustomDropDownField(
//                 margin: const EdgeInsets.only(
//                   bottom: UIConstants.defaultHeight * 2,
//                 ),
//                 labelText: "Exam Category",
//                 items: examCategoryList,
//                 onChanged: (value) {
//                   if (value != null) {
//                     setState(() {
//                       examination.examCategory = value.id;
//                     });
//                   }
//                 },
//                 validator: (value) {
//                   if (value == null) {
//                     return "Field is required. Choose exam category";
//                   }
//                   return null;
//                 },
//               ),
//               CustomTextFormField(
//                 margin: const EdgeInsets.only(
//                   bottom: UIConstants.defaultHeight * 2,
//                 ),
//                 labelText: "Exam Name",
//                 validator: (value) {
//                   if (value == null) {
//                     return "Field is required. Please enter Exam Name";
//                   } else {
//                     if (value.trim().isEmpty) {
//                       return "Field is required. Please enter exam name";
//                     } else {
//                       return null;
//                     }
//                   }
//                 },
//               ),
//               CustomTextFormField(
//                 margin: const EdgeInsets.only(
//                   bottom: UIConstants.defaultHeight * 2,
//                 ),
//                 labelText: "Exam Icon",
//                 validator: (value) {
//                   if (value == null) {
//                     return "Field is required. Please enter exam icon";
//                   } else {
//                     if (value.trim().isEmpty) {
//                       return "Field is required. Please enter exam icon";
//                     } else {
//                       return null;
//                     }
//                   }
//                 },
//               ),
//               CustomTextFormField(
//                 margin: const EdgeInsets.only(
//                   bottom: UIConstants.defaultHeight * 2,
//                 ),
//                 labelText: "Official Website",
//                 validator: (value) {
//                   if (value == null) {
//                     return "Field is required. Please enter official website";
//                   } else {
//                     if (value.trim().isEmpty) {
//                       return "Field is required. Please enter official website";
//                     } else {
//                       return null;
//                     }
//                   }
//                 },
//               ),
//               CustomTextFormField(
//                 labelText: "Organizer",
//                 validator: (value) {
//                   if (value == null) {
//                     return "Field is required. Please enter organizer";
//                   } else {
//                     if (value.trim().isEmpty) {
//                       return "Field is required. Please enter organizer";
//                     } else {
//                       return null;
//                     }
//                   }
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

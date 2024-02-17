import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../constants/ui_constants.dart';
import '../../../../models/syllabus_model.dart';
import '../view_model/syllabus_controller.dart';
import 'subject_screen.dart';

import '../../../../view/widgets/custom_widgets/custom_elevated_button.dart';
import '../../../../view/widgets/custom_widgets/custom_dropdownfield.dart';
import '../../../../view/widgets/custom_widgets/custom_textformfield.dart';

class SyllabusScreen extends StatelessWidget {
  SyllabusScreen({super.key});

  final SyllabusController controller = Get.put<SyllabusController>(
    SyllabusController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Syllabus",
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomElevatedButton(
        isLoading: false,
        onPressed: () {
          bool isFormValid = controller.formKey.currentState!.validate();
          if (isFormValid) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SubjectScreen(
                  subjectCount: controller.subjectCount,
                ),
              ),
            );
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
                onChanged: (value) {
                  if (value != null) {
                    controller.syllabus.examCategory = value.id;
                  }
                },
                onSaved: (value) {
                  if (value != null) {}
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
                items: controller.examName,
                validator: (value) {
                  if (value == null) {
                    return "Field is require.Choose exam name";
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                onChanged: (value) {
                  controller.syllabus.examYear = int.parse(value);
                },
                labelText: "Exam Year",
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Please enter exam year";
                  } else {
                    if (value.trim().isEmpty) {
                      return "Field is required. Please enter exam year";
                    } else {
                      return null;
                    }
                  }
                },
              ),
              CustomTextFormField(
                onChanged: (value) {
                  controller.syllabus.syllabusLink = value;
                },
                labelText: "Official Syllabus Link",
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
                onChanged: (value) {
                  controller.subjectCount = int.parse(value);
                },
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultHeight * 2,
                ),
                labelText: "Subjects",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
// class SyllabusScreen extends StatefulWidget {
//   const SyllabusScreen({super.key});

//   @override
//   State<SyllabusScreen> createState() => _SyllabusScreenState();
// }

// class _SyllabusScreenState extends State<SyllabusScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   List<SyllabusModel> syllabusModelList = [];

//   final List<DropDownFieldChoices> examCategoryList = [
//     DropDownFieldChoices(id: 1, value: "school"),
//     DropDownFieldChoices(id: 2, value: "College"),
//     DropDownFieldChoices(id: 3, value: "primary")
//   ];
//   final List<DropDownFieldChoices> examName = [
//     DropDownFieldChoices(id: 1, value: "NEET"),
//     DropDownFieldChoices(id: 2, value: "JEE"),
//     DropDownFieldChoices(id: 3, value: "TNPSC")
//   ];
//   SyllabusModel syllabus = SyllabusModel();
//   int subjectCount = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Syllabus",
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: CustomElevatedButton(
//         isLoading: false,
//         onPressed: () {
//           bool isFormValid = _formKey.currentState!.validate();
//           if (isFormValid) {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => SubjectScreen(
//                   subjectCount: subjectCount,
//                 ),
//               ),
//             );
//           }
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
//                 labelText: "Exam Category",
//                 items: examCategoryList,
//                 onChanged: (value) {
//                   if (value != null) {
//                     setState(() {
//                       syllabus.examCategory = value.id;
//                     });
//                   }
//                 },
//                 onSaved: (value){
//                   if(value != null){

//                   }
//                 },
//                 validator: (value) {
//                   if (value == null) {
//                     return "Field is required. Choose exam category";
//                   }
//                   return null;
//                 },
//               ),
//               CustomDropDownField(
//                 labelText: "Exam Name",
//                 items: examName,
//                 validator: (value) {
//                   if (value == null) {
//                     return "Field is require.Choose exam name";
//                   }
//                   return null;
//                 },
//               ),
//               CustomTextFormField(
//                 onChanged: (value) {
//                   setState(() {
//                     syllabus.examYear = int.parse(value);
//                   });
//                 },
//                 margin: const EdgeInsets.only(
//                   bottom: UIConstants.defaultHeight * 2,
//                 ),
//                 labelText: "Exam Year",
//                 validator: (value) {
//                   if (value == null) {
//                     return "Field is required. Please enter exam year";
//                   } else {
//                     if (value.trim().isEmpty) {
//                       return "Field is required. Please enter exam year";
//                     } else {
//                       return null;
//                     }
//                   }
//                 },
//               ),
//               CustomTextFormField(
//                 onChanged: (value) {
//                   setState(() {
//                     syllabus.syllabusLink = value;
//                   });
//                 },
//                 margin: const EdgeInsets.only(
//                   bottom: UIConstants.defaultHeight * 2,
//                 ),
//                 labelText: "Official Syllabus Link",
//                 validator: (value) {
//                   if (value == null) {
//                     return "Field is required. Please enter syllabus link";
//                   } else {
//                     if (value.trim().isEmpty) {
//                       return "Field is required. Please enter syllabus link";
//                     } else {
//                       return null;
//                     }
//                   }
//                 },
//               ),
//               CustomTextFormField(
//                 onChanged: (value) {
//                   subjectCount = int.parse(value);
//                 },
//                 margin: const EdgeInsets.only(
//                   bottom: UIConstants.defaultHeight * 2,
//                 ),
//                 labelText: "Subjects",
//                 validator: (value) {
//                   if (value == null) {
//                     return "Field is required. Please enter subject count";
//                   } else {
//                     if (value.trim().isEmpty) {
//                       return "Field is required. Please enter subject count";
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

class Syllabus extends StatefulWidget {
  const Syllabus({super.key});

  @override
  State<Syllabus> createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  SyllabusModel syllabus = SyllabusModel();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          labelText: "Exam Category",
          validator: (value) {
            if (value == null) {
              return "Field is required. Please enter exam category";
            } else {
              if (value.trim().isEmpty) {
                return "Field is required. Please enter exam category";
              } else {
                return null;
              }
            }
          },
        ),
        const SizedBox(
          height: UIConstants.defaultHeight * 2,
        ),
        CustomDropDownField(
          labelText: "Exam Name",
          items: [DropDownFieldChoices(id: 1, value: "NEET")],
          onChanged: (value) {
            if (value != null) {
              setState(() {
                syllabus.examName = value.id;
              });
            }
          },
          validator: (value) {
            if (value == null) {
              return "Field is required.Choose exam name";
            }
            return null;
          },
        ),
        const SizedBox(
          height: UIConstants.defaultHeight * 2,
        ),
        CustomTextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          labelText: "Exam Year",
          validator: (value) {
            if (value == null) {
              return "Field is required. Please enter exam year";
            } else {
              if (value.trim().isEmpty) {
                return "Field is required. Please enter exam year";
              } else {
                return null;
              }
            }
          },
        ),
        const SizedBox(
          height: UIConstants.defaultHeight * 2,
        ),
        CustomTextFormField(
          labelText: "Official Syllabus Link",
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
        const SizedBox(
          height: UIConstants.defaultHeight * 2,
        ),
        CustomTextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          labelText: "Subjects",
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
        )
      ],
    );
  }
}

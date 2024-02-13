import 'package:flutter/material.dart';

import '../../constants/ui_constants.dart';
import '../../models/test.dart';
import '../widgets/custom_widgets/custom_button.dart';
import '../widgets/custom_widgets/custom_dropdownfield.dart';
import '../widgets/custom_widgets/custom_multiline_textformfield.dart';
import '../widgets/custom_widgets/custom_textformfield.dart';
import 'sections_screen.dart';

class NewTestScreen extends StatefulWidget {
  const NewTestScreen({super.key});

  @override
  State<NewTestScreen> createState() => _NewTestScreenState();
}

class _NewTestScreenState extends State<NewTestScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Test test = Test();
  List<DropDownFieldChoices> examCategories = [
    DropDownFieldChoices(id: 1, value: "School"),
    DropDownFieldChoices(id: 2, value: "Engineering"),
    DropDownFieldChoices(id: 3, value: "Medicine"),
  ];
  List<DropDownFieldChoices> examNames = [
    DropDownFieldChoices(id: 1, value: "School"),
    DropDownFieldChoices(id: 2, value: "Engineering"),
  ];
  List<DropDownFieldChoices> testTypes = [
    DropDownFieldChoices(id: 1, value: "School"),
    DropDownFieldChoices(id: 2, value: "Engineering"),
  ];
  List<DropDownFieldChoices> contentTypes = [
    DropDownFieldChoices(id: 1, value: "School"),
    DropDownFieldChoices(id: 2, value: "Engineering"),
  ];
  List<DropDownFieldChoices> languages = [
    DropDownFieldChoices(id: 1, value: "School"),
    DropDownFieldChoices(id: 2, value: "Engineering"),
  ];
  List<DropDownFieldChoices> subjects = [
    DropDownFieldChoices(id: 1, value: "School"),
    DropDownFieldChoices(id: 2, value: "Engineering"),
  ];
  List<DropDownFieldChoices> chapters = [
    DropDownFieldChoices(id: 1, value: "School"),
    DropDownFieldChoices(id: 2, value: "Engineering"),
  ];

  int sectionCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Test",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(
          UIConstants.defaultPadding * 2,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomDropDownField(
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultMargin * 2,
                ),
                dropdownLabelText: "Exam Category",
                items: examCategories,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      test.examCategory = value.value;
                    });
                  }
                },
                validator: (value) {
                  if (value == null) {
                    return "Field is required";
                  }
                  return null;
                },
              ),
              CustomDropDownField(
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultMargin * 2,
                ),
                dropdownLabelText: "Exam Name",
                items: examNames,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      test.examName = value.value;
                    });
                  }
                },
                validator: (value) {
                  if (value == null) {
                    return "Field is required";
                  }
                  return null;
                },
              ),
              CustomDropDownField(
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultMargin * 2,
                ),
                dropdownLabelText: "Test Type",
                items: testTypes,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      test.testType = value.value;
                    });
                  }
                },
                validator: (value) {
                  if (value == null) {
                    return "Field is required";
                  }
                  return null;
                },
              ),
              CustomDropDownField(
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultMargin * 2,
                ),
                dropdownLabelText: "Content Type",
                items: contentTypes,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      test.contentType = value.value;
                    });
                  }
                },
                validator: (value) {
                  if (value == null) {
                    return "Field is required";
                  }
                  return null;
                },
              ),

              // CustomDropDownField(
              //   value: test.testType,
              //   onChanged: (value) {
              //     setState(() {
              //       test.testType = value as String?;
              //     });
              //   },
              //   dropdownLabelText: "Test Type",
              //   items: const [
              //     "Exam Level Test",
              //     "Subject Level Test",
              //     "Chapter Level Test"
              //   ],
              //   validator: (value) {
              //     if (value == null) {
              //       return "Field is required";
              //     }
              //     return null;
              //   },
              // ),
              // // const SizedBox(
              // //   height: UIConstants.defaultHeight * 2,
              // // ),
              // Visibility(
              //   visible: test.testType == "Exam Level Test",
              //   child: Container(
              //     margin: const EdgeInsets.symmetric(
              //         vertical: UIConstants.defaultHeight * 2),
              //     child: CustomDropDownField(
              //       value: test.contentType,
              //       onChanged: (value) {
              //         setState(() {
              //           test.contentType = value as String?;
              //         });
              //       },
              //       items: const [
              //         "Full length mock test",
              //         "previous year questions",
              //       ],
              //       dropdownLabelText: "Content Type",
              //       validator: (value) {
              //         if (value == null) {
              //           return "Field is required";
              //         }
              //         return null;
              //       },
              //     ),
              //   ),
              // ),

              // Visibility(
              //   visible: test.testType == "Subject Level Test" ||
              //       test.testType == "Chapter Level Test",
              //   child: Container(
              //     margin: const EdgeInsets.symmetric(
              //         vertical: UIConstants.defaultHeight * 2),
              //     child: CustomDropDownField(
              //       value: test.subjectType,
              //       onChanged: (value) {
              //         setState(() {
              //           test.subjectType = value as String?;
              //         });
              //       },
              //       dropdownLabelText: "Subject Test",
              //       items: const [
              //         "Chemistry",
              //         "English",
              //         "Tamil",
              //       ],
              //       validator: (value) {
              //         if (value == null) {
              //           return "Field is required";
              //         }
              //         return null;
              //       },
              //     ),
              //   ),
              // ),

              // Visibility(
              //   visible: test.testType == "Chapter Level Test",
              //   child: Container(
              //     margin: const EdgeInsets.only(
              //         bottom: UIConstants.defaultHeight * 2),
              //     child: CustomDropDownField(
              //       value: test.chapterType,
              //       onChanged: (value) {
              //         setState(() {
              //           test.chapterType = value as String?;
              //         });
              //       },
              //       dropdownLabelText: "Chapter Type",
              //       items: const [
              //         "Chapter1",
              //         "Chapter2",
              //         "Chapter3",
              //       ],
              //       validator: (value) {
              //         if (value == null) {
              //           return "Field is required";
              //         }
              //         return null;
              //       },
              //     ),
              //   ),
              // ),

              // CustomDropDownField(
              //   value: test.language,
              //   onChanged: (value) {
              //     setState(() {
              //       test.language = value as String?;
              //     });
              //   },
              //   dropdownLabelText: "Language",
              //   items: const ["test", "test1", "test2", "test3"],
              //   validator: (value) {
              //     if (value == null) {
              //       return "Field is required";
              //     }
              //     return null;
              //   },
              // ),
              // const SizedBox(
              //   height: UIConstants.defaultHeight * 2,
              // ),
              // CustomTextFormField(
              //   labelText: "Test Title",
              //   validator: (value) {
              //     if (value == null) {
              //       return "Field is required. Please enter password";
              //     } else {
              //       if (value.trim().isEmpty) {
              //         return "Field is required. Please enter password";
              //       } else {
              //         return null;
              //       }
              //     }
              //   },
              // ),
              // const SizedBox(
              //   height: UIConstants.defaultHeight * 2,
              // ),
              CustomTextFormField(
                labelText: "Time limit (In Minutes)",
                validator: (value) {
                  if (value == null) {
                    return "Field is required.";
                  } else {
                    if (value.trim().isEmpty) {
                      return "Field is required.";
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
                labelText: "Sections",
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Please enter password";
                  } else {
                    if (value.trim().isEmpty) {
                      return "Field is required. Please enter password";
                    } else {
                      return null;
                    }
                  }
                },
                onChanged: (value) {
                  sectionCount = int.tryParse(value) ?? 0;
                },
              ),
              const SizedBox(
                height: UIConstants.defaultHeight * 2,
              ),
              const CustomMultiLineTextFormField(
                labelText: "Instructions",
                maxLines: 5,
                keyboardtype: TextInputType.multiline,
              ),
              const SizedBox(
                height: UIConstants.defaultHeight * 2,
              ),
              CustomButton(
                buttonWidth: 90,
                buttonHeight: 32,
                isLoading: false,
                onPressed: () {
                  bool isFormValid = _formKey.currentState!.validate();
                  if (isFormValid) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SectionsScreen(
                          sectionCount: sectionCount,
                        ),
                      ),
                    );
                  }
                },
                buttonText: "Proceed",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

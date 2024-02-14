import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    DropDownFieldChoices(id: 1, value: "Exam Level Test"),
    DropDownFieldChoices(id: 2, value: "Subject Level Test"),
    DropDownFieldChoices(id: 3, value: "Chapter Level Test"),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomButton(
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
                      test.examCategory = value.id;
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
                      test.examName = value.id;
                    });
                  }
                },
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Choose Exam Name";
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
                      test.testType = value.id;
                    });
                  }
                },
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Choose Test Type";
                  }
                  return null;
                },
              ),
              Visibility(
                visible: test.testType == 1,
                child: CustomDropDownField(
                  margin: const EdgeInsets.only(
                    bottom: UIConstants.defaultMargin * 2,
                  ),
                  dropdownLabelText: "Content Type",
                  items: contentTypes,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        test.contentType = value.id;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Field is required. Choose Content Type";
                    }
                    return null;
                  },
                ),
              ),
              Visibility(
                visible: test.testType == 2 || test.testType == 3,
                child: CustomDropDownField(
                  margin: const EdgeInsets.only(
                    bottom: UIConstants.defaultMargin * 2,
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        test.subjectType = value.id;
                      });
                    }
                  },
                  dropdownLabelText: "Subject",
                  items: subjects,
                  validator: (value) {
                    if (value == null) {
                      return "Field is required. Choose Subject";
                    }
                    return null;
                  },
                ),
              ),
              Visibility(
                visible: test.testType == 3,
                child: CustomDropDownField(
                  margin: const EdgeInsets.only(
                    bottom: UIConstants.defaultMargin * 2,
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        test.chapterType = value.id;
                      });
                    }
                  },
                  dropdownLabelText: "Chapter",
                  items: chapters,
                  validator: (value) {
                    if (value == null) {
                      return "Field is required. Choose Chapter";
                    }
                    return null;
                  },
                ),
              ),
              CustomDropDownField(
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultMargin * 2,
                ),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      test.language = value.id;
                    });
                  }
                },
                dropdownLabelText: "Language",
                items: languages,
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Choose language";
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultMargin * 2,
                ),
                labelText: "Test Title",
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Please enter Test Title";
                  } else {
                    if (value.trim().isEmpty) {
                      return "Field is required. Please enter Test Title";
                    } else {
                      return null;
                    }
                  }
                },
              ),
              CustomTextFormField(
                keyboardtype: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultMargin * 2,
                ),
                labelText: "Time limit (In Minutes)",
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Enter Time Limit";
                  } else {
                    if (value.trim().isEmpty) {
                      return "Field is required. Enter Time Limit";
                    } else {
                      return null;
                    }
                  }
                },
              ),
              CustomTextFormField(
                keyboardtype: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultMargin * 2,
                ),
                labelText: "Section Count",
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Please enter Section Count";
                  } else {
                    if (value.trim().isEmpty) {
                      return "Field is required. Please enter Section Count";
                    } else {
                      return null;
                    }
                  }
                },
                onChanged: (value) {
                  sectionCount = int.tryParse(value) ?? 0;
                },
              ),
              const CustomMultiLineTextFormField(
                labelText: "Instructions",
                maxLines: 5,
                keyboardtype: TextInputType.multiline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

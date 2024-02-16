import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/ui_constants.dart';
import '../../models/new_test_model.dart';
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
  Test test = Test();

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
                  sectionCount: test.sectionCount ?? 0,
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
                    return "Field is required. Choose exam category";
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
                    return "Field is required. Choose exam name";
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
                    return "Field is required. Choose test type";
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
                      return "Field is required. Choose content type";
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
                        test.subject = value.id;
                      });
                    }
                  },
                  dropdownLabelText: "Subject",
                  items: subjects,
                  validator: (value) {
                    if (value == null) {
                      return "Field is required. Choose subject";
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
                        test.chapter = value.id;
                      });
                    }
                  },
                  dropdownLabelText: "Chapter",
                  items: chapters,
                  validator: (value) {
                    if (value == null) {
                      return "Field is required. Choose chapter";
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
                onChanged: (value) {
                  test.testTitle = value;
                },
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Please enter test title";
                  } else {
                    if (value.trim().isEmpty) {
                      return "Field is required. Please enter test title";
                    } else {
                      return null;
                    }
                  }
                },
              ),
              CustomTextFormField(
                keyboardtype: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultMargin * 2,
                ),
                labelText: "Time limit (In Minutes)",
                onChanged: (value) {
                  test.timeLimit = int.parse(value);
                },
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Enter time limit";
                  } else {
                    if (value.trim().isEmpty) {
                      return "Field is required. Enter time limit";
                    } else {
                      return null;
                    }
                  }
                },
              ),
              CustomTextFormField(
                keyboardtype: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                margin: const EdgeInsets.only(
                  bottom: UIConstants.defaultMargin * 2,
                ),
                labelText: "Sections Count",
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Please enter section count";
                  } else {
                    if (value.trim().isEmpty) {
                      return "Field is required. Please enter section count";
                    } else {
                      return null;
                    }
                  }
                },
              ),
              CustomMultiLineTextFormField(
                labelText: "Instructions",
                maxLines: 5,
                keyboardtype: TextInputType.multiline,
                onChanged: (value) {
                  test.instructions = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

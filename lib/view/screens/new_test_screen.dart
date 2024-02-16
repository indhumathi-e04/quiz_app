import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/ui_constants.dart';
import '../../models/new_test_model.dart';
import '../widgets/custom_widgets/custom_elevated_button.dart';
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
    DropDownFieldChoices(
      id: UIConstants.examLevelTestId,
      value: "Exam Level Test",
    ),
    DropDownFieldChoices(
      id: UIConstants.subjectLevelTestId,
      value: "Subject Level Test",
    ),
    DropDownFieldChoices(
      id: UIConstants.chapterLevelTestId,
      value: "Chapter Level Test",
    ),
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

  TestDataModel test = TestDataModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Test",
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomElevatedButton(
        buttonHeight: UIConstants.defaultHeight * 5,
        isLoading: false,
        onPressed: () {
          bool isFormValid = _formKey.currentState?.validate() ?? false;
          if (isFormValid) {
            _formKey.currentState?.save();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SectionsScreen(
                  sectionCount: test.sectionsCount ?? 0,
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
                labelText: "Exam Category",
                items: examCategories,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      test.examCategory = value.id;
                    });
                  }
                },
                onSaved: (value) {
                  if (value != null) {
                    test.examCategory = value.id;
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
                items: examNames,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      test.examName = value.id;
                    });
                  }
                },
                onSaved: (value) {
                  if (value != null) {
                    test.examName = value.id;
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
                items: testTypes,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      test.testType = value.id;
                    });
                  }
                },
                onSaved: (value) {
                  if (value != null) {
                    test.testType = value.id;
                  }
                },
                validator: (value) {
                  if (value == null) {
                    return "Field is required. Choose the test type.";
                  }
                  return null;
                },
              ),
              Visibility(
                visible: test.testType == UIConstants.examLevelTestId,
                child: CustomDropDownField(
                  labelText: "Content Type",
                  items: contentTypes,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        test.contentType = value.id;
                      });
                    }
                  },
                  onSaved: (value) {
                    if (value != null) {
                      test.contentType = value.id;
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
              Visibility(
                visible: test.testType == UIConstants.subjectLevelTestId ||
                    test.testType == UIConstants.chapterLevelTestId,
                child: CustomDropDownField(
                  labelText: "Subject",
                  items: subjects,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        test.subject = value.id;
                      });
                    }
                  },
                  onSaved: (value) {
                    if (value != null) {
                      test.subject = value.id;
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
              Visibility(
                visible: test.testType == UIConstants.chapterLevelTestId,
                child: CustomDropDownField(
                  labelText: "Chapter",
                  items: chapters,
                  onSaved: (value) {
                    if (value != null) {
                      test.chapter = value.id;
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
              CustomDropDownField(
                labelText: "Language",
                items: languages,
                onSaved: (value) {
                  if (value != null) {
                    test.language = value.id;
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
                    test.testTitle = value;
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
                    test.timeLimit = int.parse(value);
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
                        int.tryParse(value.trim());
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
                    test.sectionsCount = int.parse(value);
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
                        int.tryParse(value.trim());
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

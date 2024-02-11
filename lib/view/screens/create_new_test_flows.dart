import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';
import 'package:quiz/models/test.dart';
import 'package:quiz/view/widgets/custom_button.dart';
import 'package:quiz/view/widgets/custom_dropdownfield.dart';
import 'package:quiz/view/widgets/custom_textformfield.dart';

class CreateNewTestFlows extends StatefulWidget {
  const CreateNewTestFlows({super.key});

  @override
  State<CreateNewTestFlows> createState() => _CreateNewTestFlowsState();
}

class _CreateNewTestFlowsState extends State<CreateNewTestFlows> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Test test = Test();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, size: UIConstants.defaultHeight),
        title: Text(
          "New Test",
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomDropDownField(
                value: test.examType,
                onChanged: (value) {
                  setState(() {
                    test.examType = value as String?;
                  });
                },
                dropdownLabelText: "Exam Category",
                items: const [
                  "EC1",
                  "EC2",
                ],
                validator: (value) {
                  if (value == null) {
                    return "Field is required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: UIConstants.defaultHeight * 2,
              ),
              CustomDropDownField(
                value: test.examCategory,
                onChanged: (value) {
                  setState(() {
                    test.examCategory = value as String?;
                  });
                },
                dropdownLabelText: "Exam Name",
                items: const ["test", "test1", "test2", "test3"],
                validator: (value) {
                  if (value == null) {
                    return "Field is required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: UIConstants.defaultHeight * 2,
              ),
              CustomDropDownField(
                value: test.testType,
                onChanged: (value) {
                  setState(() {
                    test.testType = value as String?;
                  });
                },
                dropdownLabelText: "Test Type",
                items: const [
                  "Exam Level Test",
                  "Subject Level Test",
                  "Chapter Level Test"
                ],
                validator: (value) {
                  if (value == null) {
                    return "Field is required";
                  }
                  return null;
                },
              ),
              // const SizedBox(
              //   height: UIConstants.defaultHeight * 2,
              // ),
              Visibility(
                visible: test.testType == "Exam Level Test",
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: UIConstants.defaultHeight * 2),
                  child: CustomDropDownField(
                    value: test.contentType,
                    onChanged: (value) {
                      setState(() {
                        test.contentType = value as String?;
                      });
                    },
                    items: const [
                      "Full length mock test",
                      "previous year questions",
                    ],
                    dropdownLabelText: "Content Type",
                    validator: (value) {
                      if (value == null) {
                        return "Field is required";
                      }
                      return null;
                    },
                  ),
                ),
              ),

              Visibility(
                visible: test.testType == "Subject Level Test" ||
                    test.testType == "Chapter Level Test",
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: UIConstants.defaultHeight * 2),
                  child: CustomDropDownField(
                    value: test.subjectType,
                    onChanged: (value) {
                      setState(() {
                        test.subjectType = value as String?;
                      });
                    },
                    dropdownLabelText: "Subject Test",
                    items: const [
                      "Chemistry",
                      "English",
                      "Tamil",
                    ],
                    validator: (value) {
                      if (value == null) {
                        return "Field is required";
                      }
                      return null;
                    },
                  ),
                ),
              ),

              Visibility(
                visible: test.testType == "Chapter Level Test",
                child: Container(
                  margin: const EdgeInsets.only(
                      bottom: UIConstants.defaultHeight * 2),
                  child: CustomDropDownField(
                    value: test.chapterType,
                    onChanged: (value) {
                      setState(() {
                        test.chapterType = value as String?;
                      });
                    },
                    dropdownLabelText: "Chapter Type",
                    items: const [
                      "Chapter1",
                      "Chapter2",
                      "Chapter3",
                    ],
                    validator: (value) {
                      if (value == null) {
                        return "Field is required";
                      }
                      return null;
                    },
                  ),
                ),
              ),

              CustomDropDownField(
                value: test.language,
                onChanged: (value) {
                  setState(() {
                    test.language = value as String?;
                  });
                },
                dropdownLabelText: "Language",
                items: const ["test", "test1", "test2", "test3"],
                validator: (value) {
                  if (value == null) {
                    return "Field is required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: UIConstants.defaultHeight * 2,
              ),
              CustomTextFormField(
                labelText: "Test Title",
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
              ),
              const SizedBox(
                height: UIConstants.defaultHeight * 2,
              ),
              CustomTextFormField(
                labelText: "Time limit(In minutes)",
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
                labelText: "Sections Count",
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
              ),
              const SizedBox(
                height: UIConstants.defaultHeight * 2,
              ),
              CustomTextFormField(
                labelText: "Instructions",
                maxlines: 10,
                keyboardtype: TextInputType.multiline,
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
              ),
              const SizedBox(
                height: UIConstants.defaultHeight * 2,
              ),
              CustomButton(
                  buttonWidth: 90,
                  buttonHeight: 32,
                  isLoading: false,
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {}
                  },
                  buttonText: "Proceed")
            ],
          ),
        ),
      ),
    );
  }
}

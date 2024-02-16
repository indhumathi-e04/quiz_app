import "package:flutter/material.dart";
import 'package:flutter/services.dart';

import "../../constants/ui_constants.dart";
import "../../models/sections_model.dart";
import '../widgets/custom_widgets/custom_elevated_button.dart';
import "../widgets/custom_widgets/custom_dropdownfield.dart";
import "../widgets/custom_widgets/custom_textformfield.dart";
import "../widgets/section_panel.dart";
import "questions_screen.dart";

class SectionsScreen extends StatefulWidget {
  const SectionsScreen({
    required this.sectionCount,
    super.key,
  });
  final int sectionCount;

  @override
  State<SectionsScreen> createState() => _SectionsScreenState();
}

class _SectionsScreenState extends State<SectionsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<SectionsModel> sectionsModelList = [];

  @override
  void initState() {
    super.initState();
    sectionsModelList.addAll(
      List.generate(
        widget.sectionCount,
        (index) => SectionsModel(),
      ),
    );
  }

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
        buttonWidth: 320,
        buttonHeight: 32,
        isLoading: false,
        onPressed: () {
          bool isFormValid = _formKey.currentState!.validate();
          if (isFormValid) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => QuestionScreen(
                  sectionModelList: sectionsModelList,
                ),
              ),
            );
          }
        },
        buttonText: "Proceed",
      ),
      body: Form(
        key: _formKey,
        child: ListView.separated(
          padding: const EdgeInsets.all(UIConstants.defaultHeight * 2),
          itemCount: widget.sectionCount,
          separatorBuilder: (context, index) => const SizedBox(
            height: UIConstants.defaultHeight,
          ),
          itemBuilder: (context, index) => SectionPanel(
            sectionsTitle: "Section-${index + 1}",
            sectionsModel: sectionsModelList[index],
          ),
        ),
      ),
    );
  }
}

class Sections extends StatefulWidget {
  const Sections({
    required this.sectionsTitle,
    required this.sectionsModel,
    super.key,
  });
  final String sectionsTitle;
  final SectionsModel sectionsModel;

  @override
  State<Sections> createState() => _SectionsState();
}

class _SectionsState extends State<Sections> {
  List<DropDownFieldChoices> isTimeSpecific = [
    DropDownFieldChoices(id: 0, value: "False"),
    DropDownFieldChoices(id: 1, value: "True"),
  ];
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int i, bool _) {
        setState(() {
          isExpanded = !isExpanded;
        });
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
                  widget.sectionsTitle,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            );
          },
          isExpanded: isExpanded,
          body: Padding(
            padding: const EdgeInsets.all(
              UIConstants.defaultPadding,
            ),
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: "Section Title",
                  onChanged: (value) {
                    widget.sectionsModel.sectionTitle = value;
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
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  labelText: "Question Count",
                  onChanged: (value) {
                    widget.sectionsModel.questionCount = int.parse(value);
                  },
                  margin: const EdgeInsets.only(
                      bottom: UIConstants.defaultMargin * 2),
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
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}'),
                    )
                  ],
                  labelText: "Positive Marks",
                  margin: const EdgeInsets.only(
                      bottom: UIConstants.defaultMargin * 2),
                  onChanged: (value) {
                    widget.sectionsModel.positiveMarks = double.parse(value);
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
                    widget.sectionsModel.negativeMarks = double.parse(value);
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
                      widget.sectionsModel.isSectionTimeSpecific = value.id;
                    }
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Field is required. Is Section is time specific or not";
                    }
                    return null;
                  },
                ),
                Visibility(
                  visible: widget.sectionsModel.isSectionTimeSpecific == 1,
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
                      widget.sectionsModel.sectionTimeLimit = int.parse(value);
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}

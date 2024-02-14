import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/ui_constants.dart';
import '../../models/sections_model.dart';
import 'custom_widgets/custom_dropdownfield.dart';
import 'custom_widgets/custom_textformfield.dart';

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
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: UIConstants.defaultPadding,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.sectionsTitle,
                  textAlign: TextAlign.left,
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
                CustomTextFormField(
                  keyboardtype: TextInputType.number,
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
                CustomTextFormField(
                  keyboardtype:
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
                CustomTextFormField(
                  keyboardtype:
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
                CustomDropDownField(
                  margin: const EdgeInsets.only(
                    bottom: UIConstants.defaultMargin * 2,
                  ),
                  dropdownLabelText: "Is Section Time Specific",
                  items: isTimeSpecific,
                  onChanged: (value) {
                    if (value != null) {
                      widget.sectionsModel.isSectionTimeSpecific = value.id;
                    }
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Field is required";
                    }
                    return null;
                  },
                ),
                Visibility(
                  visible: widget.sectionsModel.isSectionTimeSpecific == 1,
                  child: CustomTextFormField(
                    keyboardtype: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    margin: const EdgeInsets.only(
                      bottom: UIConstants.defaultMargin * 2,
                    ),
                    labelText: "Time Limit In Minutes",
                    onChanged: (value) {
                      widget.sectionsModel.sectionTimeLimit = int.parse(value);
                    },
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

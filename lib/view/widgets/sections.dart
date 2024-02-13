import 'package:flutter/material.dart';

import '../../constants/ui_constants.dart';
import '../../models/sectionsModel.dart';
import 'custom_widgets/custom_dropdownfield.dart';
import 'custom_widgets/custom_textformfield.dart';

class Sections extends StatefulWidget {
  const Sections({
    required this.sectionsTitle,
    super.key,
  });
  final String sectionsTitle;

  @override
  State<Sections> createState() => _SectionsState();
}

class _SectionsState extends State<Sections> {
  bool isExpanded = false;
  SectionsModel section = SectionsModel();
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
          body: Container(
            padding: const EdgeInsets.all(
              UIConstants.defaultPadding,
            ),
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: "Section Title",
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
                  labelText: "Question Count",
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
                  labelText: "Positive Marks",
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
                  labelText: "Negative Marks",
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
                CustomDropDownField(
                  dropdownLabelText: "Is Section Time Specific",
                  items: [
                    DropDownFieldChoices(id: 0, value: "False"),
                    DropDownFieldChoices(id: 1, value: "True"),
                  ],
                  onChanged: (value) {
                    setState(() {
                      section.isSectionTimeSpecific = value as String?;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Field is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: UIConstants.defaultHeight,
                ),
                Visibility(
                    visible: section.isSectionTimeSpecific == "True",
                    child: CustomTextFormField(
                      labelText: "Time Limit In Minutes",
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
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

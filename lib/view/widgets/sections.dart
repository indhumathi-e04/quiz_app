import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';
import 'package:quiz/models/sectionsModel.dart';
import 'package:quiz/view/widgets/custom_dropdownfield.dart';
import 'package:quiz/view/widgets/custom_textformfield.dart';

class Sections extends StatefulWidget {
  Sections({required this.sectionsTitle, super.key});
  String sectionsTitle;

  SectionsModel section = SectionsModel();

  @override
  State<Sections> createState() => _SectionsState();
}

class _SectionsState extends State<Sections> {
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
          headerBuilder: (context, isExpanded) {
            return Container(
              height: 56,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: UIConstants.defaultBorderRadius,
                color: Colors.blueGrey,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: UIConstants.defaultPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.sectionsTitle,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            );
          },
          isExpanded: isExpanded,
          body: Container(
            height: 500,
            width: 320,
            padding: const EdgeInsets.symmetric(
                horizontal: UIConstants.defaultHeight),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: UIConstants.defaultBorderRadius,
            ),
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: "Section Title",
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
                  height: UIConstants.defaultHeight,
                ),
                CustomTextFormField(
                  labelText: "Question Count",
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
                  height: UIConstants.defaultHeight,
                ),
                CustomTextFormField(
                  labelText: "Positive Marks",
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
                  height: UIConstants.defaultHeight,
                ),
                CustomTextFormField(
                  labelText: "Negative Marks",
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
                  height: UIConstants.defaultHeight,
                ),
                CustomDropDownField(
                  dropdownLabelText: "Is Section Time Specific",
                  items: const ["True", "False"],
                  value: widget.section.isSectionTimeSpecific,
                  onChanged: (value) {
                    setState(() {
                      widget.section.isSectionTimeSpecific = value as String?;
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
                    visible: widget.section.isSectionTimeSpecific == "True",
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

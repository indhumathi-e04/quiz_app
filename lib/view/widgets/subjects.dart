import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';

import 'package:quiz/view/widgets/custom_textformfield.dart';

class Subjects extends StatefulWidget {
  Subjects({required this.subjectTitle, super.key});
  String subjectTitle;

  @override
  State<Subjects> createState() => _SectionsState();
}

class _SectionsState extends State<Subjects> {
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
                    widget.subjectTitle,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            );
          },
          isExpanded: isExpanded,
          body: Container(
            height: 278,
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
                  labelText: "Subject Title",
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
                  labelText: "Subject Icon",
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
                  labelText: "Chapters",
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}

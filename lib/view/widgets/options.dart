import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';
import 'package:quiz/view/widgets/custom_widgets/custom_textformfield.dart';

class Options extends StatefulWidget {
  const Options({required this.optionlabel, super.key});
  final String optionlabel;

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      margin: const EdgeInsets.only(
        bottom: UIConstants.defaultMargin * 2,
      ),
      labelText: widget.optionlabel,
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
    );
  }
}

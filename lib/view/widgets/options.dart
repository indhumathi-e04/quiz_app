import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';
import 'package:quiz/view/widgets/custom_textformfield.dart';

class Options extends StatefulWidget {
  const Options({required this.optionNumber, super.key});
  final String optionNumber;

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: UIConstants.defaultHeight),
      child: CustomTextFormField(
        maxlines: 7,
        labelText: "Option - $widget.optionNumber",
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
    );
  }
}

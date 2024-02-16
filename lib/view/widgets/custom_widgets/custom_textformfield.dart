import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/ui_constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final bool isPasswordField;
  final String? Function(String? value)? validator;
  final Function(String value)? onChanged;
  final Function(String? value)? onSaved;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? margin;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.isPasswordField = false,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.margin,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ??
          const EdgeInsets.only(
            bottom: UIConstants.defaultMargin * 2,
          ),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: isPasswordField,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          labelText: labelText.toUpperCase(),
        ),
        validator: validator,
        onChanged: onChanged,
        onSaved: onSaved,
      ),
    );
  }
}

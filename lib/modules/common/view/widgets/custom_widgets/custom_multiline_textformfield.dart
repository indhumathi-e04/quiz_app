import 'package:flutter/material.dart';

import '../../../../../constants/ui_constants.dart';

class CustomMultiLineTextFormField extends StatelessWidget {
  final String labelText;
  final String? Function(String? value)? validator;
  final Function(String value)? onChanged;
  final Function(String? value)? onSaved;
  final TextInputType? keyboardType;
  final int? maxLines;
  final EdgeInsetsGeometry? margin;
  final String? initialValue;

  const CustomMultiLineTextFormField({
    super.key,
    required this.labelText,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.keyboardType,
    this.maxLines,
    this.margin,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ??
          const EdgeInsets.only(
            bottom: UIConstants.defaultMargin * 2,
          ),
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: keyboardType,
        maxLines: maxLines,
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

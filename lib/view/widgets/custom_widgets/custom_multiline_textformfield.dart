import 'package:flutter/material.dart';

class CustomMultiLineTextFormField extends StatelessWidget {
  final String labelText;
  final String? Function(String? value)? validator;
  final Function(String value)? onChanged;
  final Function(String? value)? onSaved;
  final TextInputType? keyboardType;
  final int? maxLines;
  final EdgeInsetsGeometry? margin;

  const CustomMultiLineTextFormField({
    super.key,
    required this.labelText,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.keyboardType,
    this.maxLines,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextFormField(
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

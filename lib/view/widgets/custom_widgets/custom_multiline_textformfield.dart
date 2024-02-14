import 'package:flutter/material.dart';

class CustomMultiLineTextFormField extends StatelessWidget {
  const CustomMultiLineTextFormField({
    required this.labelText,
    this.onChanged,
    this.maxLines,
    this.validator,
    this.keyboardtype = TextInputType.text,
    this.margin,
    super.key,
  });

  final String labelText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputType keyboardtype;
  final int? maxLines;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextFormField(
        keyboardType: keyboardtype,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText.toUpperCase(),
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}

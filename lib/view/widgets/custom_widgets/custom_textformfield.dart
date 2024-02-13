import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.labelText,
    this.isPasswordField = false,
    this.onChanged,
    this.validator,
    this.margin,
    this.keyboardtype = TextInputType.text,
    super.key,
  });

  final String labelText;
  final bool isPasswordField;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputType keyboardtype;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextFormField(
        keyboardType: keyboardtype,
        obscureText: isPasswordField,
        decoration: InputDecoration(
          labelText: labelText.toUpperCase(),
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}

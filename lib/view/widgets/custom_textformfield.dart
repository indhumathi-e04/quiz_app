import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {required this.labelText,
      this.isPasswordField = false,
      this.onChanged,
      this.validator,
      this.maxlines = 5,
      this.minlines = 1,
      this.keyboardtype = TextInputType.text,
      super.key});
  final String labelText;
  final bool isPasswordField;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final int maxlines;
  final int minlines;
  final TextInputType keyboardtype;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardtype,
      maxLines: maxlines,
      minLines: minlines,
      obscureText: isPasswordField,
      decoration: InputDecoration(
          labelStyle: Theme.of(context).textTheme.labelMedium,
          labelText: labelText.toUpperCase()),
      validator: validator,
      onChanged: onChanged,
    );
  }
}

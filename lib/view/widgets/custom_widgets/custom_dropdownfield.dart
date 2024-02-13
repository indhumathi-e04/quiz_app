// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomDropDownField extends StatelessWidget {
  const CustomDropDownField({
    required this.dropdownLabelText,
    this.onChanged,
    this.validator,
    required this.items,
    this.value,
    this.margin,
    super.key,
  });
  final String dropdownLabelText;
  final void Function(DropDownFieldChoices?)? onChanged;
  final String? Function(DropDownFieldChoices?)? validator;
  final List<DropDownFieldChoices> items;
  final DropDownFieldChoices? value;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: DropdownButtonFormField<DropDownFieldChoices>(
        value: value,
        decoration: InputDecoration(
          labelText: dropdownLabelText.toUpperCase(),
        ),
        isExpanded: true,
        onChanged: onChanged,
        validator: validator,
        items: items
            .map<DropdownMenuItem<DropDownFieldChoices>>(
              (e) => DropdownMenuItem<DropDownFieldChoices>(
                value: e,
                child: Text(e.value),
              ),
            )
            .toList(),
      ),
    );
  }
}

class DropDownFieldChoices {
  final int id;
  final String value;

  DropDownFieldChoices({
    required this.id,
    required this.value,
  });
}

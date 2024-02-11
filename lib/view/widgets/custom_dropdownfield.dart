import 'package:flutter/material.dart';

class CustomDropDownField extends StatelessWidget {
  const CustomDropDownField(
      {required this.dropdownLabelText,
      this.onChanged,
      this.validator,
      required this.items,
      required this.value,
      //required this.name,
      super.key});
  final String dropdownLabelText;
  final void Function(Object?)? onChanged;
  final String? Function(Object?)? validator;
  final List<String> items;
  final String? value;
  //final String name;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      //hint: Text(name),
      decoration: InputDecoration(
        labelText: dropdownLabelText.toUpperCase(),
      ),
      isExpanded: true,
      onChanged: onChanged,
      validator: validator,
      items: items
          .map<DropdownMenuItem<String>>(
            (String e) => DropdownMenuItem<String>(
              value: e,
              child: Text(e),
            ),
          )
          .toList(),
    );
  }
}

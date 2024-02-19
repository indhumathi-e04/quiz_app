import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/ui_constants.dart';

class CustomDropDownField extends StatelessWidget {
  final String labelText;
  final void Function(DropDownFieldChoices? value)? onChanged;
  final void Function(DropDownFieldChoices? value)? onSaved;
  final String? Function(DropDownFieldChoices? value)? validator;
  final List<DropDownFieldChoices> items;
  final int? value;
  final EdgeInsetsGeometry? margin;

  const CustomDropDownField({
    super.key,
    required this.labelText,
    required this.items,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.value,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ??
          const EdgeInsets.only(
            bottom: UIConstants.defaultMargin * 2,
          ),
      child: DropdownButtonFormField<DropDownFieldChoices>(
        icon: const Icon(Icons.keyboard_arrow_down_outlined),
        value: items.firstWhereOrNull(
          (element) => element.id == value,
        ),
        decoration: InputDecoration(
          labelText: labelText.toUpperCase(),
        ),
        isExpanded: true,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        items: items
            .map<DropdownMenuItem<DropDownFieldChoices>>(
              (e) => DropdownMenuItem<DropDownFieldChoices>(
                value: e,
                child: Text(
                  e.value,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
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

import 'package:flutter/material.dart';

import '../../../../utils/global/global_color.dart';

class TextFieldBasic extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Function(String) onChanged;
  final Icon? prefixIcon;
  final int? maxLines;
  final bool warning;
  final bool readOnly;

  const TextFieldBasic({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onChanged,
    this.prefixIcon,
    this.maxLines,
    this.warning = false,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: !warning ? cSecondary : cWarning,
            width: 1.5,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}

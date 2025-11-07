import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/global/global_color.dart';

class TextFieldInt extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Function(String) onChanged;
  final Icon? prefixIcon;
  final bool warning;
  final bool readOnly;

  const TextFieldInt({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onChanged,
    this.prefixIcon,
    this.warning = false,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: false),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^-?\d+'))],
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: !warning ? cSecondary : cWarning, width: 1.5),
        ),
      ),
      onChanged: onChanged,
    );
  }
}

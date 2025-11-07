import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import '../../../../utils/global/global_color.dart';


class TextFieldSearch extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Function(String) onChanged;
  final bool readOnly;
  final bool number;

  const TextFieldSearch({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onChanged,
    this.readOnly = false,
    this.number = false
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      inputFormatters: number ? [FilteringTextInputFormatter.allow(RegExp(r'^-?\d+'))]: null,
      decoration: InputDecoration(
        labelText: labelText,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
          color: cGrayDarkTransparent,
        ),
      ),
      onChanged: onChanged,
    );
  }
}

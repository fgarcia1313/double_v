import 'package:flutter/material.dart';

import '../../../../utils/global/global_color.dart';
import '../button/button_icon.dart';

class TextFieldPassword extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Function(String) onChanged;
  final Function() obscureAction;
  final Icon? prefixIcon;
  final bool warning;
  final bool readOnly;
  final bool obscureText;

  const TextFieldPassword({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onChanged,
    required this.obscureAction,
    this.prefixIcon,
    this.warning = false,
    this.readOnly = false,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: ButtonIcon(
          icon: obscureText ? Icons.visibility : Icons.visibility_off,
          onPressed: obscureAction,
          splashRadius: 25,
        ),
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

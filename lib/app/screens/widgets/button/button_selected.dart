import 'package:flutter/material.dart';

import '../../../../utils/global/global_color.dart';


class ButtonSelected extends StatelessWidget {
  final String text;
  final int index;
  final int selectedIndex;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? fontColor;
  final EdgeInsetsGeometry margin;

  const ButtonSelected({
    super.key,
    required this.text,
    required this.index,
    required this.selectedIndex,
    required this.onPressed,
    this.backgroundColor,
    this.fontColor,
    this.margin = const EdgeInsets.all(5),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: index == selectedIndex ? WidgetStateProperty.all(backgroundColor ?? cGreenObscure) : WidgetStateProperty.all(cDisabled),
        ),
        child: Text(
          text,
          style: TextStyle(color: fontColor ?? cWhite),
        ),
      ),
    );
  }
}

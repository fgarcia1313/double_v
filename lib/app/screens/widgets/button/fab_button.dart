import 'package:flutter/material.dart';

import '../../../../utils/global/global_color.dart';


class FabButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? color;
  final Icon? icon;

  const FabButton({
    super.key,
    required this.onPressed,
    this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: color,
        child: icon ?? Icon(Icons.add, color: cWhite),
      ),
    );
  }
}

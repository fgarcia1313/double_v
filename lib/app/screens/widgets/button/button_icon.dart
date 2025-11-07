import 'package:flutter/material.dart';

import '../../../../utils/global/global_color.dart';

class ButtonIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? iconColor;
  final IconData? icon;
  final String tooltip;
  final double splashRadius;

  const ButtonIcon({
    super.key,
    required this.onPressed,
    this.iconColor,
    this.icon,
    this.tooltip = '',
    this.splashRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      //splashRadius: splashRadius,
      icon: Icon(
        icon,
        size: splashRadius,
      ),
      tooltip: tooltip,
      color: iconColor ?? cPrimary,
      onPressed: onPressed,
    );
  }
}

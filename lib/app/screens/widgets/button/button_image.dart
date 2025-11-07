import 'package:flutter/material.dart';

import '../../../../utils/global/global_color.dart';

class ButtonImage extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;
  final Color? iconColor;
  final String tooltip;
  final double splashRadius;

  const ButtonImage({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconColor,
    this.tooltip = '',
    this.splashRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: splashRadius,
      icon: ImageIcon(
        AssetImage(icon),
        size: splashRadius,
      ),
      tooltip: tooltip,
      color: iconColor ?? cPrimary,
      onPressed: onPressed,
    );
  }
}

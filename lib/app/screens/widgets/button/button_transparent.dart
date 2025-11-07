import 'package:flutter/material.dart';

import '../../../../utils/global/global_color.dart';

class ButtonTransparent extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? iconColor;
  final IconData? icon;

  const ButtonTransparent({
    super.key,
    required this.text,
    required this.onPressed,
    this.iconColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Expanded(
                flex: 1,
                child: Center(
                  child: Icon(
                    icon,
                    color: iconColor ?? cPrimary,
                  ),
                ),
              ),
            ],
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

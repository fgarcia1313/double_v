import 'package:flutter/material.dart';

import '../../../../utils/global/global_color.dart';

class ButtonBasic extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final IconData? icon;

  const ButtonBasic({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(backgroundColor ?? cPrimary),
        ),
        onPressed: onPressed,
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
                      color: cWhite,
                    )),
              ),
              const Expanded(flex: 1, child: SizedBox()),
            ],
            Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: cWhite,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

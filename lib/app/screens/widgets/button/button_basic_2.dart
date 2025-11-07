import 'package:flutter/material.dart';

import '../../../../utils/global/global_color.dart';


class ButtonBasic2 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final IconData? icon;
  final Color? iconColor;

  const ButtonBasic2({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: cTransparent,
        foregroundColor: cSecondary,
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0), side: BorderSide(color: cPrimary, width: 1.5)),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            if (icon != null) ...[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                      child: Icon(
                        icon,
                        color: iconColor ?? cWhite,
                      )),
                ),
              ),
              const Expanded(flex: 1, child: SizedBox()),
            ],
            Expanded(
                flex: 3,
                child: Center(
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ))),
          ],
        ),
      ),
    );
  }
}

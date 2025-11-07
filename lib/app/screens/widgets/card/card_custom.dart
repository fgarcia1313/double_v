import 'package:flutter/material.dart';

import '../../../../utils/global/global_color.dart';

class CardCustom extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final Color? backgroundColor;

  const CardCustom({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(4),
      margin: margin ?? const EdgeInsets.all(4),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor ?? cGrayDarkTransparent,
      ),
      child: child,
    );
  }
}

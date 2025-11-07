import 'package:flutter/material.dart';
import '../../../../utils/global/global_color.dart';

class ScrollBasic extends StatelessWidget {
  final Widget child;
  final ScrollController? controller; // Agregar ScrollController opcional

  const ScrollBasic({
    super.key,
    required this.child,
    this.controller, // Agregar ScrollController opcional
  });

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: cScrollBubble,
        child: SingleChildScrollView(
          controller: controller, // Pasar el ScrollController
          child: child,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../../../utils/global/global_color.dart';

class ScrollWithoutSingle extends StatelessWidget {
  final Widget child;

  const ScrollWithoutSingle({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: cScrollBubble,
        child: child,
      ),
    );
  }
}

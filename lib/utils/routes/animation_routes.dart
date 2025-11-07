import 'package:flutter/material.dart';
import 'package:get/get.dart';

GetPageRoute<dynamic> fadeTransition({required Widget child, required String routeName}) {
  return GetPageRoute(
    settings: RouteSettings(name: routeName),
    page: () => child,
    transition: Transition.downToUp,
    transitionDuration: const Duration(milliseconds: 1200),
  );
}

class AnimationRoutes {
  static GetPageRoute animationTranslation({required RouteSettings settings, required Widget child, Transition? transition}) {
    return GetPageRoute(
      settings: settings,
      page: () => child,
      transition: transition ?? Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 1000),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/global/global_color.dart';
import '../../../utils/global/global_image.dart';
import '../../logic/screens/others/splash_logic.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashLogic());
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Center(
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(cPrimary, BlendMode.modulate),
          child: Image.asset(
            logoPrincipal,
            height: 300,
          ),
        ),
      ),
    );
  }
}

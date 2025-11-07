import 'package:get/get.dart';

import '../../../../utils/config/config_other.dart';
import '../../../../utils/global/global_routes.dart';

class SplashLogic extends GetxController {
  final ConfigOther _configOther = ConfigOther();

  @override
  void onInit() {
    super.onInit();
    onNextScreen();
  }

  void onNextScreen() {
    _configOther.delay(
      milliseconds: 2500,
      action: () => Get.offAllNamed(homeScreen),
    );
  }
}

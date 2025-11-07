import 'package:get/get.dart';

import '../../../../utils/global/global_routes.dart';

class HomeLogic extends GetxController {
  onRun() {
    Get.toNamed(myProfileScreen);
  }
}

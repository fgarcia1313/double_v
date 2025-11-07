import 'package:get/get.dart';

class ConfirmDialogLogic extends GetxController {
  var confirm = false.obs;

  onSave() {
    confirm.value = true;
    Get.back();
  }

  onCancel() {
    Get.back();
  }
}

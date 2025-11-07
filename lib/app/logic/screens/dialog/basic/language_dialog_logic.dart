import 'package:get/get.dart';

class LanguageDialogLogic extends GetxController {
  RxString languageSelected = (Get.deviceLocale?.languageCode ?? 'en').obs;
  RxList languages = ['en', 'es' , 'fr'].obs;
  RxInt indexLanguageSelect = 0.obs;
  RxBool save = false.obs;

  onSelectState(dynamic value) async {
    languageSelected.value = value ?? '';
  }

  onSave() {
    save.value = true;
    Get.back();
  }

  onCancel() {
    save.value = false;
    Get.back();
  }
}

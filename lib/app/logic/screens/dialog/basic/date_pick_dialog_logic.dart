import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickDialogLogic extends GetxController {
  Rx<DateTime> date = DateTime.now().obs;

  final RxBool dateSelected = false.obs;
  final RxBool warning = false.obs;
  final RxBool save = false.obs;

  onDatePickChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is DateTime) {
      date.value = args.value;
      dateSelected.value = true;
    }
  }

  onSave() {
    if (date.value.isAfter(DateTime.now())) {
      warning.value = true;
      return;
    }
    save.value = true;
    Get.back();
  }

  onCancel() {
    save.value = false;
    Get.back();
  }
}

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DataRangeDialogLogic extends GetxController {
  Rx<PickerDateRange> dateRange = PickerDateRange(DateTime.now(), DateTime.now()).obs;

  final RxBool warning = false.obs;
  final RxBool save = false.obs;

  onDateSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    dateRange.value = args.value!;
  }

  onSave() {
    if (dateRange.value.endDate == null || dateRange.value.startDate == dateRange.value.endDate) {
      warning.value = true;
    } else {
      save.value = true;
      Get.back();
    }
  }

  onCancel() {
    save.value = false;
    Get.back();
  }
}

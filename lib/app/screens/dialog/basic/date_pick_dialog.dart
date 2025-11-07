import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../utils/global/global_color.dart';
import '../../../logic/screens/dialog/basic/date_pick_dialog_logic.dart';
import '../../widgets/button/button_icon.dart';

class DatePickDialog {
  Future<Map> dialog() async {
    FocusManager.instance.primaryFocus?.unfocus();
    DatePickDialogLogic logic = DatePickDialogLogic();
    await Get.dialog(
      Builder(
        builder: (context) {
          return GetBuilder<DatePickDialogLogic>(
            init: logic,
            builder: (_) {
              return Scaffold(
                backgroundColor: cTransparent,
                body: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: logic.onCancel,
                    child: GestureDetector(
                      onTap: () {},
                      child: AlertDialog(
                        insetPadding: const EdgeInsets.all(20),
                        title: Text('date'.tr, style: Theme.of(context).textTheme.titleMedium),
                        content: Obx(() {
                          return Container(
                            width: 400,
                            height: 400,
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: logic.warning.value ? cWarningTransparent : cGrayDarkTransparent),
                            child: SfDateRangePicker(
                              onSelectionChanged: logic.onDatePickChanged,
                              selectionMode: DateRangePickerSelectionMode.single,
                              initialSelectedDate: logic.date.value,
                              maxDate: DateTime.now(),
                            ),
                          );
                        }),
                        actions: [
                          ButtonIcon(icon: Icons.check_circle_outline, iconColor: cGreen, onPressed: logic.onSave),
                          ButtonIcon(icon: Icons.highlight_off, iconColor: cWarning, onPressed: logic.onCancel),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      barrierDismissible: true,
    );
    return {'date': logic.date.value, 'save': logic.save.value};
  }
}
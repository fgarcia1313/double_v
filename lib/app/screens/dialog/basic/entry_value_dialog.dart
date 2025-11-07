import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/global/global_color.dart';
import '../../../logic/screens/dialog/basic/entry_value_dialog_logic.dart';
import '../../widgets/button/button_icon.dart';
import '../../widgets/scroll/scroll_basic.dart';
import '../../widgets/text_field/text_field_basic.dart';
import '../../widgets/text_field/text_field_decimal.dart';
import '../../widgets/text_field/text_field_int.dart';

class EntryValueDialog {
  Future<Map> dialog({required String title, String typeEntry = 'B'}) async {
    EntryValueDialogLogic controller = EntryValueDialogLogic();
    await Get.dialog(
      Builder(
        builder: (context) {
          return GetBuilder<EntryValueDialogLogic>(
            init: controller,
            builder: (_) {
              return Scaffold(
                backgroundColor: cTransparent,
                body: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: controller.onCancel,
                    child: GestureDetector(
                      onTap: () {},
                      child: AlertDialog(
                        insetPadding: const EdgeInsets.all(20),
                        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
                        content: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(30),
                          child: ScrollBasic(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: SizedBox(
                                    width: 450,
                                    child: Builder(
                                      builder: (context) {
                                        if (typeEntry == 'D') {
                                          return Obx(() {
                                            return TextFieldDecimal(
                                              controller: TextEditingController(),
                                              labelText: 'enter_value'.tr,
                                              onChanged: controller.onTextChanged,
                                              warning: controller.validateValue.value,
                                            );
                                          });
                                        } else if (typeEntry == 'I') {
                                          return Obx(() {
                                            return TextFieldInt(
                                              controller: TextEditingController(),
                                              labelText: 'enter_value'.tr,
                                              onChanged: controller.onTextChanged,
                                              warning: controller.validateValue.value,
                                            );
                                          });
                                        }
                                        return Obx(() {
                                          return TextFieldBasic(
                                            controller: TextEditingController(),
                                            labelText: 'enter_value'.tr,
                                            onChanged: controller.onTextChanged,
                                            warning: controller.validateValue.value,
                                          );
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          ButtonIcon(icon: Icons.check_circle_outline, onPressed: controller.onSave, iconColor: cGreen),
                          ButtonIcon(icon: Icons.highlight_off, onPressed: controller.onCancel, iconColor: cWarning),
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
    return {'save': controller.save.value, 'text': controller.text.value};
  }
}

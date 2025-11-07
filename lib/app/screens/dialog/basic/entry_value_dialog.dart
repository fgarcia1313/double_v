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
import '../../widgets/text_field/text_field_password.dart';

class EntryValueDialog {
  Future<Map> dialog({required String title, String typeEntry = 'B'}) async {
    EntryValueDialogLogic logic = EntryValueDialogLogic();
    await Get.dialog(
      Builder(
        builder: (context) {
          return GetBuilder<EntryValueDialogLogic>(
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
                                              controller: logic.textController,
                                              labelText: 'enter_value'.tr,
                                              onChanged: logic.onTextChanged,
                                              warning: logic.validateValue.value,
                                            );
                                          });
                                        } else if (typeEntry == 'I') {
                                          return Obx(() {
                                            return TextFieldInt(
                                              controller: logic.textController,
                                              labelText: 'enter_value'.tr,
                                              onChanged: logic.onTextChanged,
                                              warning: logic.validateValue.value,
                                            );
                                          });
                                        } else if (typeEntry == 'P') {
                                          return Obx(() {
                                            return TextFieldPassword(
                                              controller: logic.textController,
                                              obscureText: logic.obscureText.value,
                                              labelText: 'password'.tr,
                                              onChanged: logic.onTextChanged,
                                              warning: logic.validateValue.value,
                                              obscureAction: logic.onObscureText,
                                            );
                                          });
                                        }
                                        return Obx(() {
                                          return TextFieldBasic(
                                            controller: logic.textController,
                                            labelText: 'enter_value'.tr,
                                            onChanged: logic.onTextChanged,
                                            warning: logic.validateValue.value,
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
                          ButtonIcon(icon: Icons.check_circle_outline, onPressed: logic.onSave, iconColor: cGreen),
                          ButtonIcon(icon: Icons.highlight_off, onPressed: logic.onCancel, iconColor: cWarning),
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
    return {'save': logic.save.value, 'text': logic.text.value};
  }
}

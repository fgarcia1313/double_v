import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/global/global_color.dart';
import '../../../logic/screens/dialog/basic/confirm_dialog_logic.dart';
import '../../widgets/button/button_icon.dart';
import '../../widgets/scroll/scroll_basic.dart';

class ConfirmDialog {
  Future<bool> dialog({required String content}) async {
    ConfirmDialogLogic logic = ConfirmDialogLogic();
    await Get.dialog(
      Builder(builder: (context) {
        return GetBuilder<ConfirmDialogLogic>(
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
                        title: Text(
                          'confirm'.tr,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        content: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(30),
                          child: ScrollBasic(
                            child: Column(
                              children: [
                                Text(content),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          ButtonIcon(
                            icon: Icons.check_circle_outline,
                            onPressed: logic.onSave,
                            iconColor: cGreen,
                          ),
                          ButtonIcon(
                            icon: Icons.highlight_off,
                            onPressed: logic.onCancel,
                            iconColor: cWarning,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      }),
      barrierDismissible: true,
    );
    return logic.confirm.value;
  }
}

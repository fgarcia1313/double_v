import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/global/global_color.dart';
import '../../../logic/screens/dialog/basic/language_dialog_logic.dart';
import '../../widgets/button/button_icon.dart';
import '../../widgets/drop_down_button/drop_down_button_basic.dart';

class LanguageDialog {
  Future<Map> dialog({required Locale language}) async {
    LanguageDialogLogic logic = LanguageDialogLogic();
    logic.languageSelected.value = language.languageCode;
    await Get.dialog(
      Builder(
        builder: (context) {
          return GetBuilder<LanguageDialogLogic>(
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
                        title: Text('language'.tr, style: Theme.of(context).textTheme.titleMedium),
                        content: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(30),
                          child: Obx(() {
                            return SizedBox(width: 200, child: DropDownButtonBasic(optionSelect: logic.languageSelected.value, optionsList: logic.languages, onChanged: logic.onSelectState));
                          }),
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
    return {'save': logic.save.value, 'languageCode': logic.languageSelected.value};
  }
}

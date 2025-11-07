import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/global/global_color.dart';
import '../../../../utils/global/global_image.dart';
import '../../../logic/screens/dialog/login/create_new_account_dialog_logic.dart';
import '../../widgets/button/button_basic.dart';
import '../../widgets/button/button_icon.dart';
import '../../widgets/scroll/scroll_basic.dart';
import '../../widgets/text_field/text_field_basic.dart';
import '../../widgets/text_field/text_field_password.dart';

class CreateNewAccountDialog {
  Future dialog() async {
    CreateNewAccountDialogLogic logic = CreateNewAccountDialogLogic();

    await Get.dialog(
      Builder(
        builder: (context) {
          return GetBuilder<CreateNewAccountDialogLogic>(
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
                        title: Text('create_new_account'.tr, style: Theme.of(context).textTheme.titleMedium),
                        content: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(30),
                          child: ScrollBasic(
                            child: Obx(() {
                              if (logic.load.value) {
                                return Column(mainAxisAlignment: MainAxisAlignment.center, spacing: 20, children: [Text('loading'.tr), Image.asset(imgLoadProgress, height: 100.0, width: 100.0)]);
                              }
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 20,
                                children: [
                                  SizedBox(
                                    width: 500,
                                    child: TextFieldBasic(
                                      controller: logic.nameController,
                                      labelText: 'name'.tr,
                                      prefixIcon: Icon(Icons.person_outline, color: cPinkObscure),
                                      warning: logic.warningName.value,
                                      onChanged: logic.onNameChanged,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 500,
                                    child: TextFieldBasic(
                                      controller: logic.surNameController,
                                      labelText: 'surname'.tr,
                                      prefixIcon: Icon(Icons.person_outline, color: cPinkObscure),
                                      warning: logic.warningSurName.value,
                                      onChanged: logic.onSurNameChanged,
                                    ),
                                  ),
                                  Card(
                                    color: logic.warningDateBorn.value ? cWarningTransparent : cGrayTransparent,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        spacing: 20,
                                        children: [
                                          SizedBox(
                                            width: 250,
                                            child: ButtonBasic(text: 'born'.tr, onPressed: logic.onPickDateBorn),
                                          ),
                                          Text('birthdate'.trParams({'date': logic.dateBorn.value})),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 500,
                                    child: TextFieldBasic(
                                      controller: logic.emailController,
                                      labelText: 'email'.tr,
                                      prefixIcon: Icon(Icons.email, color: cPinkObscure),
                                      warning: logic.warningEmail.value,
                                      onChanged: logic.onEmailChanged,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 500,
                                    child: TextFieldPassword(
                                      controller: logic.passwordController,
                                      labelText: 'password'.tr,
                                      prefixIcon: Icon(Icons.password, color: cWarning),
                                      obscureText: logic.obscurePassword.value,
                                      warning: logic.warningPassword.value,
                                      onChanged: logic.onPasswordChanged,
                                      obscureAction: logic.togglePasswordVisibility,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 500,
                                    child: TextFieldPassword(
                                      controller: logic.confirmPasswordController,
                                      labelText: 'confirm_password'.tr,
                                      prefixIcon: Icon(Icons.password, color: cWarning),
                                      obscureText: logic.obscureConfirmPassword.value,
                                      warning: logic.warningConfirmPassword.value,
                                      onChanged: logic.onConfirmPasswordChanged,
                                      obscureAction: logic.toggleConfirmPasswordVisibility,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 500,
                                    child: Text('password_requirements'.tr, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
                                  ),
                                ],
                              );
                            }),
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
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/global/global_color.dart';
import '../../../utils/global/global_image.dart';
import '../../logic/screens/login/login_logic.dart';
import '../widgets/app_bar/app_bar_dynamic.dart';
import '../widgets/button/button_basic.dart';
import '../widgets/button/button_transparent.dart';
import '../widgets/drawer/drawer_dynamic.dart';
import '../widgets/scroll/scroll_basic.dart';
import '../widgets/text_field/text_field_basic.dart';
import '../widgets/text_field/text_field_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, this.from});
  final String? from;

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final LoginLogic logic = Get.put(LoginLogic());
    logic.from.value = from ?? '';
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerDynamic(scaffoldKey: scaffoldKey),
      appBar: AppBarDynamic(title: 'my_profile'.tr, onPressedDrawer: () => scaffoldKey.currentState!.openDrawer()),
      body: LayoutBuilder(
        builder: (BuildContext _, BoxConstraints constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            child: Center(
              child: ScrollBasic(
                child: Obx(() {
                  if (logic.load.value) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 15,
                        children: [
                          Text('loading'.tr),
                          Padding(padding: const EdgeInsets.all(10), child: Image.asset(imgLoadProgress, height: 100.0, width: 100.0)),
                        ],
                      ),
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      ColorFiltered(colorFilter: ColorFilter.mode(cPrimary, BlendMode.modulate), child: Image.asset(logoPrincipal, width: 300)),
                      Card(
                        margin: const EdgeInsets.all(10),
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          width: 500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 20,
                            children: [
                              Obx(() {
                                return TextFieldBasic(
                                  controller: logic.emailController,
                                  labelText: 'email'.tr,
                                  prefixIcon: Icon(Icons.person_pin, color: cGreen),
                                  warning: logic.warningEmail.value,
                                  onChanged: logic.onEmailChanged,
                                );
                              }),
                              Obx(() {
                                return TextFieldPassword(
                                  controller: logic.passwordController,
                                  labelText: 'password'.tr,
                                  prefixIcon: Icon(Icons.password, color: cMarineWater),
                                  warning: logic.warningPassword.value,
                                  obscureText: logic.obscureText.value,
                                  obscureAction: logic.togglePasswordVisibility,
                                  onChanged: logic.onPasswordChanged,
                                );
                              }),
                              SizedBox(
                                width: 200,
                                child: ButtonBasic(text: 'login'.tr, onPressed: logic.login, icon: Icons.email),
                              ),
                              SizedBox(
                                width: 400,
                                height: 40,
                                child: ButtonTransparent(text: 'ask_forgot_password'.tr, onPressed: logic.sendPasswordResetEmail, icon: Icons.password, iconColor: cWarning),
                              ),
                              SizedBox(
                                width: 300,
                                child: ButtonBasic(text: 'create_new_account'.tr, onPressed: logic.createNewAccount, backgroundColor: cGreenObscure, icon: Icons.person_add),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}

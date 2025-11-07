import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/global/global_color.dart';
import '../../../utils/global/global_image.dart';
import '../../logic/screens/login/validate_logic.dart';
import '../widgets/app_bar/app_bar_dynamic.dart';
import '../widgets/button/button_basic.dart';
import '../widgets/card/card_custom.dart';
import '../widgets/drawer/drawer_dynamic.dart';
import '../widgets/scroll/scroll_basic.dart';
import '../widgets/text_field/text_field_password.dart';


class ValidateScreen extends StatelessWidget {
  const ValidateScreen({super.key, this.oobCode, this.mode});

  final String? oobCode;
  final String? mode;

  @override
  Widget build(BuildContext context) {
    final ValidateLogic logic = Get.put(ValidateLogic());
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    logic.oobCode = oobCode ?? '';
    logic.mode = mode ?? '';

    if (mode == 'verifyEmail') {
      logic.validateEmailOobCode();
    }

    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerDynamic(scaffoldKey: scaffoldKey),
      appBar: AppBarDynamic(
        title: 'user_validations'.tr,
        onPressedDrawer: () => scaffoldKey.currentState!.openDrawer(),
      ),
      body: SizedBox(
        width: Get.width,
        child: Center(
          child: ScrollBasic(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ColorFiltered(colorFilter: ColorFilter.mode(cPrimary, BlendMode.modulate), child: Image.asset(logoPrincipal, width: 300)),
                Builder(builder: (context) {
                  if (mode == 'verifyEmail') {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            CardCustom(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              backgroundColor: cSecondaryWithTransparency,
                              child: Text(
                                'email_verification'.tr,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleLarge,
                              ),
                            ),
                            Obx(() {
                              if (logic.validateEmail.value == 'OK') {
                                return Text('your_email_verified'.tr);
                              } else {
                                return Text('an_error_occurred'.tr);
                              }
                            }),
                          ],
                        ),
                      ),
                    );
                  } else if (mode == 'resetPassword') {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            CardCustom(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              backgroundColor: cSecondaryWithTransparency,
                              child: Text(
                                'reset_password'.tr,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleLarge,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 500,
                                  padding: const EdgeInsets.all(10),
                                  child: Obx(() {
                                    return TextFieldPassword(
                                      controller: logic.passwordController,
                                      labelText: 'password'.tr,
                                      prefixIcon: Icon(Icons.password, color: cMarineWater),
                                      obscureText: logic.obscurePassword.value,
                                      warning: logic.warningPassword.value,
                                      onChanged: logic.onPasswordChanged,
                                      obscureAction: logic.togglePasswordVisibility,
                                    );
                                  }),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(20),
                                  width: 250,
                                  child: ButtonBasic(
                                    text: 'update'.tr,
                                    icon: Icons.upload,
                                    onPressed: logic.resetPassword,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          CardCustom(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            backgroundColor: cSecondaryWithTransparency,
                            child: Text(
                              'error'.tr,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleLarge,
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text(
                            'an_error_occurred'.tr,
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

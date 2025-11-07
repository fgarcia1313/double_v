import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/global/global_color.dart';
import '../../logic/screens/core/my_profile_logic.dart';
import '../widgets/app_bar/app_bar_dynamic.dart';
import '../widgets/button/button_basic.dart';
import '../widgets/button/fab_button.dart';
import '../widgets/drawer/drawer_dynamic.dart';
import '../widgets/scroll/scroll_basic.dart';
import '../widgets/text_field/text_field_basic.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final MyProfileLogic logic = Get.put(MyProfileLogic());
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FabButton(
        color: cGreen,
        icon: Icon(Icons.save, color: cWhite),
        onPressed: logic.onSave,
      ),
      drawer: DrawerDynamic(scaffoldKey: scaffoldKey),
      appBar: AppBarDynamic(title: 'my_profile'.tr, onPressedDrawer: () => scaffoldKey.currentState!.openDrawer()),
      body: LayoutBuilder(
        builder: (BuildContext _, BoxConstraints constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            child: Center(
              child: ScrollBasic(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Icon(Icons.account_circle, color: cGreenTransparent, size: 100),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Obx(() {
                          return Text('${'uid'.tr}: ${logic.userModel.value.uid}');
                        }),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Obx(() {
                          return Text('${'was_created'.tr}: ${logic.userModel.value.create}');
                        }),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Obx(() {
                          return Text('${'email'.tr}: ${logic.userModel.value.email}');
                        }),
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
                            Text('birthdate'.trParams({'date': logic.userModel.value.born})),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Obx(() {
                          return SizedBox(
                            width: 500,
                            child: TextFieldBasic(
                              controller: logic.nameController,
                              labelText: 'name'.tr,
                              prefixIcon: Icon(Icons.person_outline, color: cPinkObscure),
                              warning: logic.warningName.value,
                              onChanged: logic.onNameChanged,
                            ),
                          );
                        }),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Obx(() {
                          return SizedBox(
                            width: 500,
                            child: TextFieldBasic(
                              controller: logic.surNameController,
                              labelText: 'surName'.tr,
                              prefixIcon: Icon(Icons.person_outline, color: cPinkObscure),
                              warning: logic.warningSurName.value,
                              onChanged: logic.onSurNameChanged,
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/global/global_color.dart';
import '../../../utils/global/global_image.dart';
import '../../logic/screens/login/not_verified_logic.dart';
import '../widgets/app_bar/app_bar_dynamic.dart';
import '../widgets/button/button_basic.dart';
import '../widgets/drawer/drawer_dynamic.dart';
import '../widgets/scroll/scroll_basic.dart';

class NotVerifiedScreen extends StatelessWidget {
  const NotVerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotVerifiedLogic logic = Get.put(NotVerifiedLogic());
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerDynamic(scaffoldKey: scaffoldKey),
      appBar: AppBarDynamic(
        title: 'unverified_user'.tr,
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
                ColorFiltered(
                  colorFilter: ColorFilter.mode(cPrimary, BlendMode.modulate),
                  child: Image.asset(logoPrincipal, height: 300),
                ),
                Card(
                  margin: const EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              'email_verification_prompt'.tr,
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            )),
                        Container(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          width: 300,
                          child: ButtonBasic(
                            text: 'verify'.tr,
                            onPressed: logic.onVerifyEmail,
                            icon: Icons.send,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

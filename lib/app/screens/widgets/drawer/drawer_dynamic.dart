import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/global/global_color.dart';
import '../../../../utils/global/global_image.dart';
import '../../../logic/core_logic.dart';
import '../scroll/scroll_without_single.dart';

class DrawerDynamic extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DrawerDynamic({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoreLogic>(
      init: CoreLogic(),
      builder: (logic) {
        return Drawer(
          child: ScrollWithoutSingle(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.bottomRight, end: Alignment.topCenter, colors: [cGrayDarkTransparent, cGrayTransparent]),
                  ),
                  child: Center(
                    child: ColorFiltered(colorFilter: ColorFilter.mode(cPrimary, BlendMode.modulate), child: Image.asset(logoPrincipal, width: 200)),
                  ),
                ),
                listTile(context: context, icon: Icons.home, text: 'home'.tr, scaffoldKey: scaffoldKey, onPressed: logic.onHomeScreen),
                listTile(context: context, icon: Icons.account_circle, iconColor: cSYellow, text: 'my_profile'.tr, scaffoldKey: scaffoldKey, onPressed: logic.onMyProfileScreen),
                listTile(context: context, icon: Icons.add_location, iconColor: cSYellow, text: 'address'.tr, scaffoldKey: scaffoldKey, onPressed: logic.onAddressScreen),
                Obx(() {
                  if (logic.isLoggedIn.value) {
                    return listTile(context: context, icon: Icons.logout, iconColor: cGreen, text: 'logout'.tr, scaffoldKey: scaffoldKey, onPressed: logic.onLogout);
                  }
                  return SizedBox();
                }),
                listTile(
                  context: context,
                  icon: logic.darkLight.value ? Icons.dark_mode : Icons.light_mode,
                  text: logic.darkLight.value ? 'dark_mode'.tr : 'light_mode'.tr,
                  scaffoldKey: scaffoldKey,
                  onPressed: logic.onDarkLight,
                ),
                listTile(context: context, icon: Icons.language, text: 'language'.tr, scaffoldKey: scaffoldKey, onPressed: logic.onLanguage),
              ],
            ),
          ),
        );
      },
    );
  }

  ListTile listTile({required BuildContext context, required IconData icon, Color? iconColor, required String text, required GlobalKey<ScaffoldState> scaffoldKey, required onPressed}) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? cPrimary),
      title: Text(text),
      onTap: () async {
        onPressed();
        scaffoldKey.currentState!.openEndDrawer();
      },
    );
  }
}

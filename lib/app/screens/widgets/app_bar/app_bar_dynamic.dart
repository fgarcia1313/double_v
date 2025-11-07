import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/global/global_color.dart';
import '../../../logic/core_logic.dart';
import '../button/button_icon.dart';

class AppBarDynamic extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onPressedDrawer;

  const AppBarDynamic({super.key, required this.title, required this.onPressedDrawer});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return GetBuilder<CoreLogic>(
          init: CoreLogic(),
          builder: (logic) {
            final bool showActions = constrains.maxWidth >= 430;
            return AppBar(
              automaticallyImplyLeading: false,
              title: Text(title, style: Theme.of(context).textTheme.titleLarge),
              leadingWidth: Navigator.of(context).canPop() ? 110 : 65,
              leading: Row(
                children: [
                  if (Navigator.of(context).canPop()) ...[
                    Container(
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      child: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Get.back()),
                    ),
                  ],
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: Navigator.of(context).canPop() ? 0 : 10),
                      child: ButtonIcon(icon: Icons.menu, iconColor: cQuaternary, onPressed: onPressedDrawer),
                    ),
                  ),
                ],
              ),
              actions: showActions
                  ? [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: ButtonIcon(icon: Icons.home, iconColor: cQuaternary, onPressed: logic.onHomeScreen),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: ButtonIcon(icon: Icons.account_circle, iconColor: cGreen, onPressed: logic.onMyProfileScreen),
                      ),
                      Obx(() {
                        if (logic.isLoggedIn.value) {
                          return Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: ButtonIcon(icon: Icons.logout, iconColor: cSYellow, onPressed: logic.onLogout),
                          );
                        }
                        return SizedBox();
                      }),
                      Container(
                        margin: const EdgeInsets.only(right: 20, left: 10),
                        child: ButtonIcon(icon: logic.darkLight.value ? Icons.dark_mode : Icons.light_mode, iconColor: cQuaternary, onPressed: logic.onDarkLight),
                      ),
                    ]
                  : null,
            );
          },
        );
      },
    );
  }
}

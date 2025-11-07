import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/global/global_color.dart';
import '../../../utils/global/global_image.dart';
import '../../logic/screens/core/address_logic.dart';
import '../../logic/screens/core/my_profile_logic.dart';
import '../widgets/app_bar/app_bar_dynamic.dart';
import '../widgets/button/button_basic.dart';
import '../widgets/button/button_transparent.dart';
import '../widgets/drawer/drawer_dynamic.dart';
import '../widgets/scroll/scroll_basic.dart';
import '../widgets/text_field/text_field_basic.dart';
import '../widgets/text_field/text_field_password.dart';

class AllProfilesScreen extends StatelessWidget {
  const AllProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final AddressLogic logic = Get.put(AddressLogic());
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerDynamic(scaffoldKey: scaffoldKey),
      appBar: AppBarDynamic(title: 'address'.tr, onPressedDrawer: () => scaffoldKey.currentState!.openDrawer()),
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
                    Text('FFFFFFFFFFFFFFFFFFFFFFFFFFFF'),
                    Text('FFFFFFFFFFFFFFFFFFFFFFFFFFFF'),
                    Text('FFFFFFFFFFFFFFFFFFFFFFFFFFFF'),
                    Text('FFFFFFFFFFFFFFFFFFFFFFFFFFFF'),
                    Text('FFFFFFFFFFFFFFFFFFFFFFFFFFFF'),
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

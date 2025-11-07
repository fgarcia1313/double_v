import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/screens/core/home_logic.dart';
import '../widgets/app_bar/app_bar_dynamic.dart';
import '../widgets/drawer/drawer_dynamic.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final HomeLogic logic = Get.put(HomeLogic());
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerDynamic(scaffoldKey: scaffoldKey),
      appBar: AppBarDynamic(title: 'home'.tr, onPressedDrawer: () => scaffoldKey.currentState!.openDrawer()),
      body: Center(child: Text('Holaaa sisisisisis')),
    );
  }
}

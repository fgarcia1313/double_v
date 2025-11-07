import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/global/global_color.dart';
import '../../logic/screens/core/home_logic.dart';
import '../widgets/app_bar/app_bar_dynamic.dart';
import '../widgets/button/button_basic.dart';
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
      body: LayoutBuilder(builder: (_, BoxConstraints constraints) {
          return Center(child:
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                width: constraints.maxWidth,
                height: 1000,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Positioned(
                      right: 500,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [cTransparent, cQuaternaryWithTransparency],
                            stops: const [0.1, 5.0],
                          ),
                        ),
                        child: const SizedBox(),
                      ),
                    ),
                    Positioned(
                      left: 100,
                      child: Container(
                        width: 500,
                        height: 500,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [cQuaternaryWithTransparency, cTransparent],
                            stops: const [0.5, 1.0],
                          ),
                        ),
                        child: const SizedBox(),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      right: 400,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.topLeft,
                            colors: [cSecondaryWithTransparency, cTransparent],
                          ),
                        ),
                        child: const SizedBox(),
                      ),
                    ),
                    Positioned(
                      bottom: 100,
                      right: 400,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.bottomRight,
                            colors: [cTertiary, cTransparent],
                          ),
                        ),
                        child: const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
              /*
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [cSuperGrayTransparent, cTransparent],
                              stops: const [0.25, 1.0],
                            ),
                          ),
                          child: SizedBox(
                            width: constraints.maxWidth,
                            height: 1000,
                          ),
                        ),
                        */
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [cTransparent, cBlack2Transparent],
                    stops: const [0.25, 1.0],
                  ),
                ),
                child: SizedBox(
                  width: constraints.maxWidth,
                  height: 300,
                ),
              ),
              Positioned(
                top: 210,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [cBlack2Transparent, cTransparent],
                      stops: const [0.1, 5.0],
                    ),
                  ),
                  child: SizedBox(
                    width: constraints.maxWidth,
                    height: 170,
                  ),
                ),
              ),
              Positioned(
                top: constraints.maxWidth >= 500 ? 220 : 320,
                child: SizedBox(
                  width: constraints.maxWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Builder(builder: (context) {
                      if (constraints.maxWidth < 500) {
                        return Text(
                          'Double V',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: cWhite,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }
                      return Text(
                        'Double V',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: cWhite,
                          fontSize: 60,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Positioned(
                top: constraints.maxWidth >= 500 ? 420 : 470,
                child: SizedBox(
                  width: 250,
                  child: ButtonBasic(
                    backgroundColor: cGreenObscure,
                    icon: Icons.account_circle,
                    text: 'my_profile'.tr,
                    onPressed: logic.onRun,
                  ),
                ),
              ),
              Positioned(
                top: constraints.maxWidth >= 500 ? 520 : 550,
                child: SizedBox(
                  width: constraints.maxWidth,
                  child: Builder(builder: (context) {
                    if (constraints.maxWidth < 500) {
                      return Text(
                        'Fernando Garcia Barrera',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: cWhite,
                          fontSize: 20,
                        ),
                      );
                    }
                    return Text(
                      'Fernando Garcia Barrera',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: cWhite,
                        fontSize: 25,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),);
        }
      ),
    );
  }
}

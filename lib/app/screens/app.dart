import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/global/global_routes.dart';
import '../../../utils/global/global_theme_data.dart';
import '../../../utils/translations/translations.dart';
import '../../utils/routes/route_generator.dart';
import '../../utils/routes/route_observer.dart';
import '../logic/core_logic.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final CoreLogic logic = Get.put(CoreLogic());
    return Obx(() {
      if (!logic.initialAuthStateChecked.value) {
        return const MaterialApp(debugShowCheckedModeBanner: false, home: null);
      } else {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeDataLight,
          darkTheme: themeDataDark,
          themeMode: logic.darkLight.value ? ThemeMode.light : ThemeMode.dark,
          translations: MyTranslations(),
          locale: logic.currentLocale.value,
          fallbackLocale: const Locale('en'),
          initialRoute: splashScreen,
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorObservers: [MyRouteObserver()],
        );
      }
    });
  }
}

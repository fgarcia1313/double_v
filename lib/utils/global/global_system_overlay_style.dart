import 'package:flutter/services.dart';

import 'global_color.dart';

SystemUiOverlayStyle appBarSystemUiOverlayStyleLight = SystemUiOverlayStyle(
  systemNavigationBarColor: cBackgroundLight,
  systemNavigationBarIconBrightness: Brightness.light,
  systemNavigationBarDividerColor: cBackgroundLight,
  statusBarColor: cBackgroundLight,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
);

SystemUiOverlayStyle appBarSystemUiOverlayStyleDark = SystemUiOverlayStyle(
  systemNavigationBarColor: cBackgroundDark,
  systemNavigationBarIconBrightness: Brightness.dark,
  systemNavigationBarDividerColor: cBackgroundDark,
  statusBarColor: cBackgroundDark,
  statusBarBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.light,
);

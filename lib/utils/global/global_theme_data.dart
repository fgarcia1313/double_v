import 'package:flutter/material.dart';
import 'global_color.dart';
import 'global_system_overlay_style.dart';

ThemeData themeDataLight = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: cBackgroundLight,
  primaryColor: cPrimary,
  appBarTheme: AppBarTheme(backgroundColor: cBackgroundLight, elevation: 3, systemOverlayStyle: appBarSystemUiOverlayStyleLight),
  canvasColor: cCanvasLight,
  cardTheme: CardThemeData(
    clipBehavior: Clip.hardEdge,
    color: cCardLight,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: WidgetStateProperty.all(0),
      overlayColor: WidgetStateProperty.all(cBlackTransparent),
      shadowColor: WidgetStateProperty.all(cGrayLight),
      backgroundColor: WidgetStateProperty.all(cPrimary),
      padding: WidgetStateProperty.all(const EdgeInsets.all(20)),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      )),
    ),
  ),
  tabBarTheme: TabBarThemeData(
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: cWhite,
    unselectedLabelColor: cTertiary,
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: cQuaternary,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: WidgetStateProperty.all<Color>(cGrayTransparent),
      backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
      padding: WidgetStateProperty.all(const EdgeInsets.all(15)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: cGrayLight),
      border: const OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: cSecondary),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: cTertiary),
      ),
      hintStyle: TextStyle(color: cGrayLight)),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: cSecondary,
    selectionColor: cTertiary,
    selectionHandleColor: cQuaternary,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: cPrimary,
    foregroundColor: cBackgroundLight,
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: cBackgroundDialogLight,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    actionsPadding: const EdgeInsets.all(10),
  ),
  snackBarTheme: const SnackBarThemeData(),
);

ThemeData themeDataDark = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: cBackgroundDark,
  primaryColor: cPrimary,
  appBarTheme: AppBarTheme(backgroundColor: cBackgroundDark, elevation: 3, systemOverlayStyle: appBarSystemUiOverlayStyleDark),
  canvasColor: cCanvasDark,
  cardTheme: CardThemeData(
    clipBehavior: Clip.hardEdge,
    color: cCardDark,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: WidgetStateProperty.all(0),
      overlayColor: WidgetStateProperty.all(cBlackTransparent),
      shadowColor: WidgetStateProperty.all(cGrayDark),
      backgroundColor: WidgetStateProperty.all(cPrimary),
      padding: WidgetStateProperty.all(const EdgeInsets.all(20)),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      )),
    ),
  ),
  tabBarTheme: TabBarThemeData(
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: cWhite,
    unselectedLabelColor: cTertiary,
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: cQuaternary,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: WidgetStateProperty.all<Color>(cGrayTransparent),
      backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
      padding: WidgetStateProperty.all(const EdgeInsets.all(15)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: cGrayDark),
    border: const OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: cSecondary),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: cTertiary),
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: cSecondary,
    selectionColor: cTertiary,
    selectionHandleColor: cQuaternary,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: cPrimary,
    foregroundColor: cBackgroundDark,
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: cBackgroundDialogDark,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    actionsPadding: const EdgeInsets.all(10),
  ),
  snackBarTheme: const SnackBarThemeData(),
);

import 'package:flutter/material.dart';

import '../configs/app_config.dart' as config;
import 'colors.gen.dart';

class AppTheme {
  ThemeData light = ThemeData(
    //fontFamily: 'ProductSans',

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0,
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
    primaryColor: ColorName.primary,
    accentColor: ColorName.primary[800],
    dividerColor: ColorName.success,
    focusColor: ColorName.success,
    hintColor: ColorName.yellow,
    textTheme: TextTheme(
      headline5:
          TextStyle(fontSize: 22.0, color: ColorName.success, height: 1.3),
      headline4: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          color: config.Colors().secondColor(1),
          height: 1.3),
      headline3: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w700,
          color: config.Colors().secondColor(1),
          height: 1.3),
      headline2: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: config.Colors().mainColor(1),
          height: 1.4),
      headline1: TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.w300,
          color: config.Colors().secondColor(1),
          height: 1.4),
      subtitle1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: config.Colors().secondColor(1),
          height: 1.3),
      headline6: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w700,
          color: config.Colors().accentColor(1),
          height: 1.3),
      bodyText2: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: ColorName.grey,
          height: 1.2),
      bodyText1: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: config.Colors().secondColor(1),
          height: 1.3),
      caption: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
          color: config.Colors().accentColor(1),
          height: 1.2),
    ),
  );
  ThemeData dark = ThemeData(
    fontFamily: 'ProductSans',
    primaryColor: Color(0xFF252525),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF2C2C2C),
    accentColor: config.Colors().mainDarkColor(1),
    dividerColor: config.Colors().accentColor(0.1),
    hintColor: config.Colors().secondDarkColor(1),
    focusColor: config.Colors().accentDarkColor(1),
    textTheme: TextTheme(
      headline5: TextStyle(
          fontSize: 22.0,
          color: config.Colors().secondDarkColor(1),
          height: 1.3),
      headline4: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          color: config.Colors().secondDarkColor(1),
          height: 1.3),
      headline3: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w700,
          color: config.Colors().secondDarkColor(1),
          height: 1.3),
      headline2: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: config.Colors().mainDarkColor(1),
          height: 1.4),
      headline1: TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.w300,
          color: config.Colors().secondDarkColor(1),
          height: 1.4),
      subtitle1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: config.Colors().secondDarkColor(1),
          height: 1.3),
      headline6: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w700,
          color: config.Colors().mainDarkColor(1),
          height: 1.3),
      bodyText2: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: config.Colors().secondDarkColor(1),
          height: 1.2),
      bodyText1: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: config.Colors().secondDarkColor(1),
          height: 1.3),
      caption: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
          color: config.Colors().secondDarkColor(0.6),
          height: 1.2),
    ),
  );
}

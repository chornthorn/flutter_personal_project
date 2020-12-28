import 'package:flutter/material.dart';

const MaterialColor brandingColor = MaterialColor(
  brandingPrimaryColor,
  <int, Color>{
    50: Color.fromRGBO(7, 94, 84, 0.1),
    100: Color.fromRGBO(7, 94, 84, 0.2),
    200: Color.fromRGBO(7, 94, 84, 0.3),
    300: Color.fromRGBO(7, 94, 84, 0.4),
    400: Color.fromRGBO(7, 94, 84, 0.5),
    500: Color(brandingPrimaryColor),
    600: Color.fromRGBO(7, 94, 84, 0.7),
    700: Color.fromRGBO(7, 94, 84, 0.8),
    800: Color.fromRGBO(7, 94, 84, 0.9),
    900: Color.fromRGBO(7, 94, 84, 1),
  },
);
const int brandingPrimaryColor = 0xFF075E54;


Color themeColor = Color.fromRGBO (36, 123, 224, 1);
Color themeColorAccent = Color.fromRGBO (36, 123, 224, 0.8);
Color colorBlack = HexColor("#191919");
Color colorGrey = HexColor("#747474");
Color colorGrey1 = HexColor("#7e7e7e");
Color colorGrey2 = HexColor("#e1e1e1");
Color colorGrey3 = HexColor("#e7e7e7");
Color colorGrey4 = HexColor("#cccccc");
Color colorGrey5 = HexColor("#f9f9f9");
Color colorGrey6 = HexColor("#dddddd");
Color colorGrey7 = HexColor("#f8f8f8");
Color colorGrey8 = HexColor("#eeeeee");
Color colorGrey9 = HexColor("#dbdbdb");
Color colorGreyButton = HexColor("#666666");
Color colorBlue = HexColor("#1e62cf");


class HexColor extends Color {
  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(getColorFromHex(hexColor));
}

Color colorDarken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

class CustomMaterialColor {

  MaterialColor getColorFromHex() {
    Map<int, Color> colorMap = {
      50: HexColor("#FFFFFF"),
      100: HexColor("#FFFFFF"),
      200: HexColor("#FFFFFF"),
      300: HexColor("#FFFFFF"),
      400: HexColor("#FFFFFF"),
      500: HexColor("#FFFFFF"),
      600: HexColor("#FFFFFF"),
      700: HexColor("#FFFFFF"),
      800: HexColor("#FFFFFF"),
      900: HexColor("#FFFFFF"),
    };
    MaterialColor colorCustom = MaterialColor(0xFFFFFFFF, colorMap);
    return colorCustom;
  }
}

double fontXs = 10.0;
double fontSm = 12.0;
double fontMd = 14.0;
double fontLg = 16.0;
double fontXl = 18.0;
double fontXxl = 20.0;
double fontX3l = 22.0;
double fontX4l = 24.0;
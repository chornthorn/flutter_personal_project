import 'package:flutter/material.dart';

enum Flavor {
  DEV,
  SIT,
  UAT,
  PRO
}

class FlavorValues {
  FlavorValues({@required this.baseUrl});
  final String baseUrl;
//Add other flavor specific values, e.g database name
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final FlavorValues values;
  static FlavorConfig _instance;

  factory FlavorConfig({
    @required Flavor flavor,
    @required FlavorValues values}) {
    _instance ??= FlavorConfig._internal(
        flavor, StringUtils.enumName(flavor.toString()), values);
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.name, this.values);
  static FlavorConfig get instance { return _instance;}
  static bool isDev() => _instance.flavor == Flavor.DEV;
  static bool isSit() => _instance.flavor == Flavor.SIT;
  static bool isUat() => _instance.flavor == Flavor.UAT;
  static bool isPro() => _instance.flavor == Flavor.PRO;
}

class StringUtils {
  static String enumName(String string) {
    return string;
  }
}

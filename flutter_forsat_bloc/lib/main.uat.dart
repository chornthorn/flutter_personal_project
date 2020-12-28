import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsatbloc/config/flavor.config.dart';
import 'package:forsatbloc/index.dart';
import 'blocs/bloc_delegate_log.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.UAT,
      values: FlavorValues(baseUrl: "https://www.facebook.com"));

  print('Flavor: ${FlavorConfig.instance.name}');

  Bloc.observer = MyBlocObserver();
  runApp(AppIndex());
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsatbloc/config/flavor.config.dart';
import 'package:forsatbloc/index.dart';
import 'blocs/bloc_delegate_log.dart';

void main() {
  FlavorConfig(flavor: Flavor.DEV,
      values: FlavorValues(baseUrl: "https://production.com")
  );

  print('Flavor: ${FlavorConfig.instance.name}');

  Bloc.observer = MyBlocObserver();
  runApp(AppIndex());
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsatbloc/config/flavor.config.dart';
import 'package:forsatbloc/index.dart';
import 'blocs/bloc_delegate_log.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.DEV,
    values: FlavorValues(
        baseUrl:
            "https://raw.githubusercontent.com/JHBitencourt/ready_to_go/master/lib/json/person_qa.json"),
  );

  print('Flavor: ${FlavorConfig.instance.name}');

  Bloc.observer = MyBlocObserver();
  runApp(AppIndex());
}

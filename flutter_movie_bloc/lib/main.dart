import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/bloc/index.dart';
import 'package:my_movie/views/index.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
          fontFamily: 'Vaud',
          brightness: Brightness.dark,
          primaryColor: Color(0xff26262d),
          backgroundColor: Color(0xff26262d)),
      home: BlocProvider<BottomAppBarBloc>(
        create: (context) => BottomAppBarBloc(),
        child: MainScreen(),
      ),
    );
  }
}

/// ***************************************************************
class TabNavigatorRoutes {
  static const String root = '/';
  static const String movieCategory = 'movieCategory';
}

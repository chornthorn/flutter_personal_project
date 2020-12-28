import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/index.dart';
import 'package:news_app/utils/index.dart';
import 'package:news_app/views/main_page.dart';
import 'bloc/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: Constants.lightTheme,
      home: BlocProvider<BottomAppBarBloc>(
        create: (context) => BottomAppBarBloc(),
        child: MainScreen(),
      ),
    );
  }
}

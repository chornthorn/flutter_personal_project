import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forsatbloc/utils/themes/theme.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  static var defaultTheme = appThemeData[AppTheme.LIGHT];

  ThemeBloc() : super(ThemeState(themeData: defaultTheme));

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeLoadStarted) {
      yield* _mapThemeLoadStartedToState();
    } else if (event is ThemeChanged) {
      yield* _mapThemeChangedToState(event);
    }
  }

  Stream<ThemeState> _mapThemeLoadStartedToState() async* {
    yield ThemeState(themeData: defaultTheme);
  }

  Stream<ThemeState> _mapThemeChangedToState(ThemeChanged event) async* {
    yield ThemeState(themeData: appThemeData[event.theme]);
  }
}

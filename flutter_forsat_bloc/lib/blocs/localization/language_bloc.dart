import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:forsatbloc/utils/localizations/enums.dart';
import 'package:forsatbloc/utils/localizations/shared_pref_service.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(Locale('en', 'US')));

  @override
  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
    if (event is LanguageLoadStarted) {
      yield* _mapLanguageLoadStartedToState();
    } else if (event is LanguageSelected) {
      yield* _mapLanguageSelectedToState(event.languageCode);
    }
  }

  Stream<LanguageState> _mapLanguageLoadStartedToState() async* {
    final sharedPrefService = await SharedPreferencesService.instance;

    final defaultLanguageCode = sharedPrefService.languageCode;
    Locale locale;

    if (defaultLanguageCode == null) {
      locale = Locale('en', 'US');
      await sharedPrefService.setLanguage(locale.languageCode);
    } else {
      locale = Locale(defaultLanguageCode);
    }

    yield LanguageState(locale);
  }

  Stream<LanguageState> _mapLanguageSelectedToState(
      Language selectedLanguage) async* {
    final sharedPrefService = await SharedPreferencesService.instance;
    final defaultLanguageCode = sharedPrefService.languageCode;

    if (selectedLanguage == Language.KH &&
        // ignore: unrelated_type_equality_checks
        defaultLanguageCode != LanguageKeys.km) {
      yield* _loadLanguage(sharedPrefService, 'km', 'KH');
    } else if (selectedLanguage == Language.EN &&
        // ignore: unrelated_type_equality_checks
        defaultLanguageCode != LanguageKeys.en) {
      yield* _loadLanguage(sharedPrefService, 'en', 'US');
    }
  }

  /// This method is added to reduce code repetition.
  Stream<LanguageState> _loadLanguage(
      SharedPreferencesService sharedPreferencesService,
      String languageCode,
      String countryCode) async* {
    final locale = Locale(languageCode, countryCode);
    await sharedPreferencesService.setLanguage(locale.languageCode);
    yield LanguageState(locale);
  }
}

import 'package:data_repository/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsatbloc/blocs/authentication/authentication.dart';
import 'package:forsatbloc/blocs/bottom_app_bar/bottom_navigation_bar_bloc.dart';
import 'package:forsatbloc/blocs/opportunity/bloc.dart';
import 'package:forsatbloc/routes/router.dart';
import 'package:auth_repository/index.dart';
import 'package:forsatbloc/utils/localizations/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'blocs/localization/language_bloc.dart';
import 'blocs/theme/theme_bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(
          create: (context) {
            return LanguageBloc()
              ..add(
                LanguageLoadStarted(),
              );
          },
        ),
        BlocProvider<ThemeBloc>(
          create: (context) {
            return ThemeBloc()
              ..add(
                ThemeLoadStarted(),
              );
          },
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(
              loginUserRepository: LoginUserRepository(),
            )..add(
                AppStarted(),
              );
          },
        ),
        BlocProvider<OpportunityBloc>(
          create: (context) => OpportunityBloc(
            opportunityRepository: new OpportunityRepository(),
          )..add(
              LoadOpportunity(),
            ),
        ),
        BlocProvider<BottomNavigationBarBloc>(
          create: (context) => BottomNavigationBarBloc()..add(LoadHome()),
        ),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, languageState) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp(
                title: 'Flutter Demo',
                theme: themeState.themeData,
                locale: languageState.locale,
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  AppLocalizations.delegate,
                ],
                supportedLocales: [
                  Locale('en', 'US'),
                  Locale('km', 'KH'),
                ],
                routes: router,
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:data_repository/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsatbloc/blocs/authentication/authentication.dart';
import 'package:forsatbloc/blocs/bottom_app_bar/bottom_navigation_bar_bloc.dart';
import 'package:forsatbloc/blocs/login/login.dart';
import 'package:forsatbloc/blocs/opportunity/bloc.dart';
import 'package:forsatbloc/routes/route_constants.dart';
import 'package:forsatbloc/views/auth_screen/check.dart';
import 'package:forsatbloc/views/auth_screen/index.dart';
import 'package:forsatbloc/views/auth_screen/sign_in/sign_in.dart';
import 'package:forsatbloc/views/home_screen/index.dart';
import 'package:forsatbloc/views/opportunity_screen/index.dart';
import 'package:auth_repository/index.dart';

final router = <String, WidgetBuilder>{
  splashRoute: (context) => CheckAuth(),
  signInRoute: (context) {
    return BlocProvider<LoginBloc>(
      create: (context) {
        return LoginBloc(
          loginUserRepository: new LoginUserRepository(),
          authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
        );
      },
      child: SignInScreen(),
    );
  },
  signUpRoute: (context) => SignUpScreen(),
  homeRoute: (context) => BlocProvider<BottomNavigationBarBloc>(
        create: (context) => BottomNavigationBarBloc(),
        child: HomeScreen(),
      ),
  opportunitiesRoute: (context) => BlocProvider<OpportunityBloc>(
        create: (context) =>
            OpportunityBloc(opportunityRepository: new OpportunityRepository())
              ..add(LoadOpportunity()),
        child: OpportunitiesScreen(),
      ),
//  opportunitiesRoute: (context) => OpportunitiesScreen(),
};

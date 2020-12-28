import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsatbloc/blocs/authentication/authentication.dart';
import 'package:forsatbloc/blocs/bottom_app_bar/bottom_navigation_bar_bloc.dart';
import 'package:forsatbloc/blocs/login/login.dart';
import 'package:forsatbloc/storages/storage_keys.dart';
import 'package:forsatbloc/views/auth_screen/sign_in/sign_in.dart';
import 'package:forsatbloc/views/home_screen/index.dart';
import 'package:forsatbloc/views/splash_screen.dart';
import 'package:forsatbloc/views/splash_screen/splash_page.dart';
import 'package:auth_repository/index.dart';
import 'package:forsatbloc/widgets/loading_indicator/loading_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckAuth extends StatefulWidget {
  final LoginUserRepository loginUserRepository;

  CheckAuth({Key key, this.loginUserRepository}) : super(key: key);

  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is AuthenticationInitial) {
          return SplashScreen();
        }
        if (state is Authenticated) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<BottomNavigationBarBloc>(
                create: (context) => BottomNavigationBarBloc(),
              ),
            ],
            child: HomeScreen(),
          );
        }
        if (state is Unauthenticated) {
          return BlocProvider<LoginBloc>(
            create: (context) {
              return LoginBloc(
                loginUserRepository: new LoginUserRepository(),
                authenticationBloc:
                    BlocProvider.of<AuthenticationBloc>(context),
              );
            },
            child: SignInScreen(),
          );
        }
        if (state is AuthenticationLoading) {
          return LoadingIndicator();
        }
      },
    );
  }
}

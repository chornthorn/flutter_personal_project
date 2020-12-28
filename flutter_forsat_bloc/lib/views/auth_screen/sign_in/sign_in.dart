import 'package:flutter/material.dart';
import 'package:auth_repository/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsatbloc/blocs/authentication/authentication.dart';
import 'package:forsatbloc/blocs/login/login.dart';
import 'package:forsatbloc/views/auth_screen/sign_in/sign_in_page.dart';


class SignInScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
      ),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            loginUserRepository: LoginUserRepository(),
          );
        },
        child: SignInForm(),
      ),
    );
  }
}
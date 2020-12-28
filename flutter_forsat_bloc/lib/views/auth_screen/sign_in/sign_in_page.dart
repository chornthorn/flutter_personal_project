import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsatbloc/blocs/login/login.dart';
import 'package:forsatbloc/routes/route_constants.dart';
import 'package:forsatbloc/utils/images.dart';
import 'package:forsatbloc/widgets/dialog/loading.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginBloc _loginBloc;

  bool get isPopulated => _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  void _onLoginEmailChanged() {
    _loginBloc.add(
      LoginEmailChanged(email: _emailController.text),
    );
  }

  void _onFormSubmitted() {
    _loginBloc.add(
      LoginButtonPressed(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onLoginEmailChanged);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (prevState, currentState) {
        if (currentState.isFailure || currentState.isSuccess) {
          Navigator.pop(context);
        }
        return true;
      },
      // ignore: missing_return
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Login Failure'), Icon(Icons.error)],
                ),
                backgroundColor: Colors.red,
              ),
            );

        }
        if (state.isSubmitting) {
//          Future.microtask(() => showLoadingDialog(context));
          Future.microtask(() => showLoadingDialogCupertino(context));
        }
        if (state.isSuccess) {
          return true;
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
        return ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            Container(
              height: 250,
              child: Center(
                child: Image.asset(Images.logo),
              ),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                hintText: 'Enter your email',
              ),
              keyboardType: TextInputType.emailAddress,
              autovalidate: true,
              autocorrect: false,
              validator: (_) {
                return !state.isEmailValid ? 'Invalid Email' : null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                hintText: 'Enter password',
              ),
              obscureText: true,
              autovalidate: true,
              autocorrect: false,
            ),
            SizedBox(height: 25),
            MaterialButton(
              onPressed: _onFormSubmitted,
              child:Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
              height: 55,
              color: Theme.of(context).primaryColor,
              shape: StadiumBorder(),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?"),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, signUpRoute);
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  shape: StadiumBorder(),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}

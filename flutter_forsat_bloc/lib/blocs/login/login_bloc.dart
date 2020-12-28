import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:forsatbloc/blocs/authentication/authentication.dart';
import 'package:forsatbloc/utils/share_preference.dart';
import 'package:forsatbloc/utils/validators.dart';
import './login.dart';
import 'package:meta/meta.dart';
import 'package:auth_repository/index.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUserRepository loginUserRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.loginUserRepository,
    @required this.authenticationBloc,
  })  : assert(loginUserRepository != null),
        assert(authenticationBloc != null), super(LoginState.initial());

  //LoginState get initialState => LoginState.initial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    Stream<LoginState> _mapLoginEmailChangedToState(String email) async* {
      yield state.update(
        isEmailValid: Validators.isValidEmail(email),
      );
    }

    Stream<LoginState> _mapLoginWithCredentialsPressedToState({
      String email,
      String password,
    }) async* {
      yield LoginState.loading();
      try {
        AuthAccessToken response = await loginUserRepository.userLogin(
            email: email, password: password);
        var token = response.data.accessToken;
        // save token and login
        AppSharePreference asp = new AppSharePreference();
        await asp.setToken(token: '1');
        authenticationBloc
            .add(LoggedIn(token: token));
        yield LoginState.success();
      } catch (_) {
        yield LoginState.failure();
      }
    }

    if (event is LoginEmailChanged) {
      yield* _mapLoginEmailChangedToState(event.email);
    } else if (event is LoginButtonPressed) {
      yield* _mapLoginWithCredentialsPressedToState(email: event.email, password: event.password,
      );
    }
  }
}

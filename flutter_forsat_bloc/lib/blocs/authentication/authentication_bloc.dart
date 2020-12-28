import 'dart:async';
import 'package:forsatbloc/blocs/authentication/authentication.dart';
import 'package:forsatbloc/utils/share_preference.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:auth_repository/index.dart';



class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginUserRepository loginUserRepository;

  AuthenticationBloc({@required this.loginUserRepository}) : assert(loginUserRepository != null), super(AuthenticationInitial());

  @override
  //AuthenticationState get initialState => AuthenticationInitial();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event,) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    }
    if (event is LoggedIn) {
      yield Authenticated(token: event.token);
    }

    if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }
  Stream<AuthenticationState> _mapAppStartedToState() async* {
    yield AuthenticationLoading();
    try {

      await _checkAuthOAG();

        AppSharePreference sharePreference = new AppSharePreference();
        var token = await sharePreference.getToken();
        if (token == '1'){
          yield Authenticated(token: token);
        }else{
          yield Unauthenticated();
        }

    } catch (err) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {

    yield AuthenticationLoading();
    AppSharePreference asp = new AppSharePreference();
    await asp.clearToken();
    yield Unauthenticated();
  }

  Future _checkAuthOAG() async{
    AppSharePreference aps = new AppSharePreference();
    var token = await aps.getToken();
    if(token != '1') { // not auth
      await loginUserRepository.userLogin(email: '',password: '');
      await aps.setToken(token: token);
    }
  }
}
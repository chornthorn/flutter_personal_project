import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final String token;

  const Authenticated({this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'Authenticated { userId: $token }';
}

class Unauthenticated extends AuthenticationState {}

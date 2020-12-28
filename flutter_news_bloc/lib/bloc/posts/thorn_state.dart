part of 'thorn_bloc.dart';

abstract class ThornState extends Equatable {
  const ThornState();
}

class ThornInitial extends ThornState {
  @override
  List<Object> get props => [];
}
class ThornLoaded extends ThornState {

  final List<Post> data;

  ThornLoaded({this.data});

  @override
  List<Object> get props => [data];
}

class ThornLoading extends ThornState {
  @override
  List<Object> get props => [];
}

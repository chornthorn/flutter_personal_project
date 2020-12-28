part of 'thorn_bloc.dart';

abstract class ThornEvent extends Equatable {
  const ThornEvent();
}

class LoadThornEvent extends ThornEvent{
  @override
  List<Object> get props => [];

}
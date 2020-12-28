part of 'bottom_app_bar_bloc.dart';

abstract class BottomAppBarEvent extends Equatable {
  const BottomAppBarEvent();
}

class LoadHome extends BottomAppBarEvent{
  @override
  List<Object> get props => [];

}
class LoadForum extends BottomAppBarEvent{
  @override
  List<Object> get props => [];

}
class LoadFavorite extends BottomAppBarEvent{
  @override
  List<Object> get props => [];

}
class LoadAccount extends BottomAppBarEvent{
  @override
  List<Object> get props => [];

}
part of 'bottom_app_bar_bloc.dart';

abstract class BottomAppBarState extends Equatable {
  const BottomAppBarState();
}

class HomeState extends BottomAppBarState {
  final int index = 0;
  final String title = 'Home';

  @override
  List<Object> get props => [index, title];
}

class ForumState extends BottomAppBarState {
  final int index = 1;
  final String title = 'Forum';

  @override
  List<Object> get props => [index, title];
}

class FavoriteState extends BottomAppBarState {
  final int index = 2;
  final String title = 'Favorite';

  @override
  List<Object> get props => [index, title];
}

class AccountState extends BottomAppBarState {
  final int index = 3;
  final String title = 'Account';

  @override
  List<Object> get props => [index, title];
}

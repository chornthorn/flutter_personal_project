import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_app_bar_event.dart';
part 'bottom_app_bar_state.dart';

class BottomAppBarBloc extends Bloc<BottomAppBarEvent, BottomAppBarState> {
  BottomAppBarBloc() : super(HomeState());

  @override
  Stream<BottomAppBarState> mapEventToState(
    BottomAppBarEvent event,
  ) async* {
    if(event is LoadHome){
      yield HomeState();
    }
    if(event is LoadForum){
      yield ForumState();
    }
    if(event is LoadFavorite){
      yield FavoriteState();
    }
    if(event is LoadAccount){
      yield AccountState();
    }
  }
}

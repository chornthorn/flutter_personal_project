import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

part 'thorn_event.dart';

part 'thorn_state.dart';

class ThornBloc extends Bloc<ThornEvent, ThornState> {
  ThornBloc(ThornRepository thornRepository)
      :assert(ThornRepository != null),
        _thornRepository = thornRepository,
        super(ThornInitial());

  final ThornRepository _thornRepository;

  @override
  Stream<ThornState> mapEventToState(ThornEvent event,) async* {
    if (event is LoadThornEvent) {
      yield ThornLoading();
      var response = await _thornRepository.getPostList();
      yield ThornLoaded(data: response.posts);
    }
  }
}

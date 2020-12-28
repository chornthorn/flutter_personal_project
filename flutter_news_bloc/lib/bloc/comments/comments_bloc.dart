import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'comments_event.dart';

part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final CommentRepository _commentRepository;

  CommentsBloc({@required CommentRepository commentRepository})
      : assert(CommentRepository != null),
        _commentRepository = commentRepository,
        super(CommentsInitial());

  @override
  Stream<CommentsState> mapEventToState(
    CommentsEvent event,
  ) async* {
    if (event is LoadCommentById) {
      yield CommentsLoading();
      var response = await _commentRepository.getCommentById(event.postId);
      yield CommentsLoaded(data: response.data);
    }
  }
}

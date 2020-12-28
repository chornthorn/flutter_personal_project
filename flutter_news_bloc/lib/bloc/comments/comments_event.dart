part of 'comments_bloc.dart';

abstract class CommentsEvent extends Equatable {
  const CommentsEvent();
}

class LoadCommentById extends CommentsEvent{
  final int postId;

  LoadCommentById({this.postId});

  @override
  List<Object> get props => [postId];
}
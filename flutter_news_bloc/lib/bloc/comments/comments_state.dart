part of 'comments_bloc.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();
}

class CommentsInitial extends CommentsState {
  @override
  List<Object> get props => [];
}

class CommentsLoading extends CommentsState {
  @override
  List<Object> get props => [];
}

class CommentsLoaded extends CommentsState {

  final List<CommentByIdResData> data;

  CommentsLoaded({this.data});
  @override
  List<Object> get props => [data];

  @override
  String toString() {
    return 'CommentsLoaded{data: $data}';
  }
}
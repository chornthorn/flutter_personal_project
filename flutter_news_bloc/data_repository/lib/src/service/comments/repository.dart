import 'package:data_repository/data_repository.dart';

class CommentRepository {

  CommentApi api = new CommentApi();

  Future<CommentByIdRes> getCommentById(int postId) async {
    final resModel = await api.getCommentByPostId(postId);
    return resModel;
  }
}
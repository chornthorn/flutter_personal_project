import 'package:data_repository/data_repository.dart';
import 'package:data_repository/src/index.dart';

class PostListThorn  extends BaseRes {
  final List<Post> posts;

  PostListThorn({
    this.posts,
  });

  factory PostListThorn.fromJson(List<dynamic> json) {
    List<Post> posts = List<Post>();
    posts = json.map((post) => Post.fromJson(post)).toList();

    return PostListThorn(
      posts: posts,
    );
  }
}
import 'package:data_repository/data_repository.dart';

class ThornRepository {

  ThornAPI api = new ThornAPI();

  Future<PostListThorn> getPostList() async {
    final resModel = await api.getAll();
    return resModel;
  }
}
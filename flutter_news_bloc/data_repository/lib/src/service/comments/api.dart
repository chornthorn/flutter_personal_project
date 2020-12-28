import 'package:data_repository/data_repository.dart';
import 'dart:convert' as convert;

class CommentApi {
  CustomHttp restClient = new CustomHttp();

  Future<CommentByIdRes> getCommentByPostId(int postId) async{
    var url = '$BASE_URL$comment?postId=$postId';

    try{
      dynamic response = await restClient.get(url);
      return CommentByIdRes.fromJson(response);
    }catch(e){
      print(e);
    }

  }
}
import 'package:data_repository/data_repository.dart';

class ThornAPI {
  CustomHttp restClient = new CustomHttp();

  Future<PostListThorn> getAll() async{
    var url = '$BASE_URL$post';

    try{
      dynamic response = await restClient.get(url);
      return PostListThorn.fromJson(response);
    }catch(e){
      print(e);
    }

  }
}
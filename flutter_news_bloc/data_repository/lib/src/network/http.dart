import 'dart:async';
import 'dart:collection';
import 'dart:convert' as convert;
import 'package:data_repository/data_repository.dart';
import 'package:http/http.dart' as http;

class CustomHttp{

  Map<String,String> headers = {
    'Content-type' : 'application/json',
  };

  Future<dynamic> get(String url) async{
    Map<String, dynamic> res = HashMap();
    try{
      final response = await http.get(
          url,
          headers: headers
      ).timeout(new Duration(minutes: 3));
      final res = convert.jsonDecode(response.body);
      return res;
    } on TimeoutException catch (e) {
      res["status_code"] = RequestTimeoutCode;
      res["status_message"] = RequestTimeoutMessage;
      return res;
    } on Error catch (e) {
      res["status_code"] = RequestErrorCode;
      res["status_message"] = e.toString();
      return res;
    }
  }

  Future<dynamic> post(String url,String body) async{
    Map<String, dynamic> res = HashMap();
    try{
      final response = await http.post(
          url,
          body: body ,
          headers: headers
      ).timeout(new Duration(minutes: 3));
      final res = convert.jsonDecode(response.body);
      return res;
    } on TimeoutException catch (e) {
      res["status_code"] = RequestTimeoutCode;
      res["status_message"] = RequestTimeoutMessage;
      return res;
    } on Error catch (e) {
      res["status_code"] = RequestErrorCode;
      res["status_message"] = e.toString();
      return res;
    }
  }
}

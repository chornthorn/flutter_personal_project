import 'dart:convert';
import 'package:auth_repository/index.dart';
import 'package:auth_repository/src/utils/error_req.dart';
import 'package:dio/dio.dart';
import '../api.dart';


class LoginUserApi {

  Future<AuthAccessToken> userLogin(String email, String password) async {
    try {
      var response = await AppApi.dio.post(
        '/api/auth/login',
        data: {"email": email, "password": password},
      );

      if(response.statusCode == 200){
        final responseJson = response.data;
        AuthAccessToken tokenResponse = AuthAccessToken.fromJson(responseJson);
        return tokenResponse;
      }

    } on DioError catch (e) {
      showNetworkError(e);
    }
  }
}

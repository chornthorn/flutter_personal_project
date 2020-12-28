import 'package:dio/dio.dart';

const String BASE_URL = 'http://forsat-backend.test';
//const String BASE_URL = 'https://fe3b1e7ab7be.ngrok.io';

class AppApi {
  static BaseOptions _baseOptions = new BaseOptions(baseUrl: BASE_URL);

  // unauthenticated route
  static Dio dio = Dio(_baseOptions);

  // authentication route
  static Dio dioAuth() {
    return Dio();
  }
}
import 'package:dio/dio.dart';

class ApplicationService {
  /// client http
  static Dio get client {
    var dio = Dio();
    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) => status! <= 500;
    return dio;
  }
}

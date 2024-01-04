import 'package:dio/dio.dart';

class NetworkException {
  static errorType(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return "Connection Time out";
    } else if (e.type == DioExceptionType.badResponse && e.response != null) {
      switch (e.response!.statusCode) {
        case 400:
          return "Bad Request";
        case 401:
          return "Un Authorized request";
        case 404:
          return "Not found";
        default:
          return "unknown error";
      }
    } else {
      return "Something went wrong";
    }
  }
}

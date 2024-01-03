import 'package:dio/dio.dart';
import 'package:todolist/utils/constant.dart';

class BaseApi {
  final dio = Dio(BaseOptions(baseUrl: ipAddress));
}

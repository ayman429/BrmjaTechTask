// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import '../constant/api_string.dart';

class AuthDioFactory {
  late Dio _dio;
  AuthDioFactory() {
    BaseOptions options = BaseOptions(
        baseUrl: ApiString.baseUrl,
        followRedirects: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        });

    _dio = Dio(options);
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required Map<String, dynamic> data}) async {
    var response = await _dio.post(endPoint, data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get(endPoint);
    return response.data;
  }
}

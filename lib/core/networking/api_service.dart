import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.options = BaseOptions(
      baseUrl: 'http://54.198.235.195:8080/api/',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  Future<dynamic> get({
    required String endPoints,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await dio.get(endPoints, queryParameters: queryParams);
    return response.data;
  }

  Future<dynamic> post({
    required String endPoints,
    required dynamic data,
    Options? options,
  }) async {
    final response = await dio.post(endPoints, data: data, options: options);
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoints,
    required Map data,
  }) async {
    final response = await dio.put(endPoints, data: data);
    return response.data;
  }
}

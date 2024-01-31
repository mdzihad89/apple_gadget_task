import 'package:dio/dio.dart';
import '../app/constant.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> get({required String endPoint}) async {
    var response = await _dio.get(endPoint);
    return response;
  }

  Future<Response> post({required String endPoint, dynamic data}) async {
    var response = await _dio.post(endPoint, data: data);
    return response;
  }
}

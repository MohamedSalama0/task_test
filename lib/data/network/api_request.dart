import 'package:dio/dio.dart';
import 'package:task_test/constants/api_url.dart';
import 'package:task_test/data/network/endpoints.dart';

class ApiRequest {
  ApiRequest.init();
  ApiRequest get instance => _instance;
  static final ApiRequest _instance = ApiRequest.init();

  Dio dio = Dio();

  Future<Response?> request(String endpoint, {dynamic body}) async {
    return await dio.get(
      endpoint,
      data: body,
    );
  }
}

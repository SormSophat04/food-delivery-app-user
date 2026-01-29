import 'package:dio/dio.dart';
import 'package:food_delivery_app/core/service/api_endpoint.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApiProvider {
  Dio dio = createDio();

  static Dio createDio() {
    var timeout = const Duration(milliseconds: 30000);
    var dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoint.baseUrl,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      ),
    )..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            final token =
                Supabase.instance.client.auth.currentSession?.accessToken;

            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }

            return handler.next(options);
          },
        ),
      );
    return dio;
  }

  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(url, queryParameters: queryParameters);
  }

  Future<Response> post(String url,
      {body, Map<String, dynamic>? queryParameters}) async {
    return await dio.post(url, queryParameters: queryParameters, data: body);
  }

  Future<Response> patch(String url,
      {body, Map<String, dynamic>? queryParameters}) async {
    return await dio.patch(url, queryParameters: queryParameters, data: body);
  }

  Future<Response> put(String url,
      {body, Map<String, dynamic>? queryParameters}) async {
    return await dio.put(url, queryParameters: queryParameters, data: body);
  }

  Future<Response> delete(String url,
      {body, Map<String, dynamic>? queryParameters}) async {
    return await dio.delete(url, queryParameters: queryParameters, data: body);
  }
}

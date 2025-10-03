import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_review/core/storage/secure_storage.dart';

class ApiClient {
  final Dio dio;

  ApiClient({required String baseUrl})
      : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            'Content-Type': 'application/json',
            'apiKey': dotenv.env['API_KEY']!,
          },
        )) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorage.getToken();

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          if (e.response?.statusCode == 401) {
            // TODO: Handle unauthorized error
          }
          return handler.next(e);
        },
      ),
    );
  }
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
    return dio.get(path, queryParameters: queryParameters);
  }
  Future<Response> post(String path, {dynamic data}) {
    return dio.post(path, data: data);
  }
  Future<Response> put(String path, {dynamic data}) {
    return dio.put(path, data: data);
  }
  Future<Response> delete(String path, {dynamic data}) {
    return dio.delete(path, data: data);
  }
}
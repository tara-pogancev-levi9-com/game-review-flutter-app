import 'package:dio/dio.dart';
import 'package:game_review/common/constants.dart';
import 'package:game_review/core/storage/secure_storage.dart';

// TODO: Error handling, generic responses

class ApiImageClient {
  final Dio dio;

  ApiImageClient({required String baseUrl})
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            //'Content-Type': 'application/json',
            'apiKey': ApiConstants.apiKey,
          },
        ),
      ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorage.getToken();

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
            //options.headers['Content-Type'] = 'image/${imageExtensions}';
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

  Future<Response> post(String path, String imageExtensions, {dynamic data}) {
    Options options = Options(
      headers: {'Content-Type': 'image/${imageExtensions}'},
    );
    return dio.post(path, data: data, options: options);
  }

  Future<Response> put(String path, String imageExtensions, {dynamic data}) {
    Options options = Options(
      headers: {'Content-Type': 'image/$imageExtensions'},
    );
    return dio.put(path, data: data, options: options);
  }

  Future<Response> delete(String path, {dynamic data}) {
    return dio.delete(path, data: data);
  }
}

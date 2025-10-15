import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_review/core/storage/secure_storage.dart';

// TODO: Error handling, generic responses

class ApiClient {
  final Dio dio;

  ApiClient({required String baseUrl})
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            'Content-Type': 'application/json',
            'apiKey': dotenv.env['API_KEY']!,
          },
        ),
      ) {
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
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == HttpStatus.unauthorized) {
            String? refreshToken = SecureStorage.getRefreshToken();
            if (refreshToken != null) {
              String newAccessToken = await refreshAccessToken(refreshToken);
              SecureStorage.saveToken(newAccessToken);

              e.requestOptions.headers['Authorization'] =
                  'Bearer $newAccessToken';

              // Repeat the request with the updated header
              return handler.resolve(await dio.fetch(e.requestOptions));
            }
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<String> refreshAccessToken(String refreshToken) async {
    try {
      final response = await post(
        '/auth/v1/token?grant_type=refresh_token',
        data: {
          'refresh_token': refreshToken,
        },
      );
      return response.data['access_token'];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
    return dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.put(path, data: data, queryParameters: queryParameters);
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.delete(path, data: data, queryParameters: queryParameters);
  }

  /*Future<Response> patch(String path, String id, {dynamic data}) {
    return dio.patch(path, queryParameters: {'id': 'eq.$id'}, data: data);
  }*/

  /*Future<Response> delete(String path, {dynamic data}) {
    return dio.delete(path, data: data);
  }*/

  Future<Response> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}

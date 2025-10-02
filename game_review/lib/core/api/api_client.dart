import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_review/core/storage/secure_storage.dart';

class ApiClient {
  final Dio dio;

  ApiClient({String? baseUrl})
      : dio = Dio(BaseOptions(
          baseUrl: _getEnvOrThrow('API_URL', baseUrl),
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            'Content-Type': 'application/json',
            'apiKey': _getEnvOrThrow('API_KEY'),
          },
        )) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          print('--- Interceptor: onRequest ---');
          String? token = await SecureStorage.getToken();

          if (token != null) {
            print('Found token in SecureStorage.');
          } else {
            print('No token in SecureStorage. Checking .env file.');
            token = dotenv.env['BEARER_TOKEN'];
          }

          if (token != null && token.isNotEmpty) {
            print('Attaching token to headers: Bearer $token');
            options.headers['Authorization'] = 'Bearer $token';
          } else {
            print('No token found. Sending request without Authorization header.');
          }

          return handler.next(options); 
        },
        onResponse: (response, handler) {
          print('--- Interceptor: onResponse (${response.statusCode}) ---');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print('--- Interceptor: onError (${e.response?.statusCode}) ---');
          return handler.next(e);
        },
      ),
    );
  }
}

String _getEnvOrThrow(String key, [String? override]) {
  final value = override ?? dotenv.env[key];
  if (value == null || value.isEmpty) {
    throw Exception('$key is not set in .env file');
  }
  return value;
}
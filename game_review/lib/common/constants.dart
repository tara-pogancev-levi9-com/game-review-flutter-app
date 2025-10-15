import 'package:flutter_dotenv/flutter_dotenv.dart';

String _apiUrl = dotenv.env['API_URL']!;
String _apiKey = dotenv.env['API_KEY']!;

class ApiConstants {
  static String get apiUrl => _apiUrl;

  static String get apiKey => _apiKey;
}

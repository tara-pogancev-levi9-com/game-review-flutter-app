import 'package:flutter_dotenv/flutter_dotenv.dart';

String _apiKey = dotenv.env['API_KEY']!;

class ApiConstants {
  static String get apiKey => _apiKey;
}

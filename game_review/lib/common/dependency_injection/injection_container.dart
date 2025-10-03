import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/features/auth/auth_service.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<ApiClient>(
    () => ApiClient(
      baseUrl: dotenv.env['API_URL']!,
    ),
  );


  locator.registerLazySingleton<AuthService>(
    () => AuthService(
      locator<ApiClient>(),
    ),
  );
}
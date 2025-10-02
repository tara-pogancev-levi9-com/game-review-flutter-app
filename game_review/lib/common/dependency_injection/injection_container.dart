import 'package:get_it/get_it.dart';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/features/auth/auth_service.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerSingleton<ApiClient>(ApiClient());

  locator.registerSingleton<AuthService>(
    AuthService(locator<ApiClient>())
  );
}
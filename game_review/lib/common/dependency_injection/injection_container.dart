import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:game_review/features/registration_screen/bloc/register_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/features/auth/auth_service.dart';
import 'package:game_review/features/auth/bloc/auth_cubit.dart';
import 'package:game_review/features/library_screen/services/game_service.dart';
import 'package:game_review/features/library_screen/bloc/library_cubit.dart';

final locator = GetIt.instance;

void setupDependencies() {
  final apiUrl = dotenv.env['API_URL'];
  if (apiUrl == null || apiUrl.isEmpty) {
    throw StateError(t.missingApiUrl);
  }
  locator.registerLazySingleton<ApiClient>(() => ApiClient(baseUrl: apiUrl));

  locator.registerLazySingleton<AuthService>(
    () => AuthService(
      locator<ApiClient>(),
    ),
  );

  locator.registerLazySingleton<RegistrationCubit>(
    () => RegistrationCubit(),
  );

  locator.registerLazySingleton<AuthCubit>(
    () => AuthCubit(
      locator<AuthService>(),
    ),
  );

  locator.registerLazySingleton<GameService>(
    () => GameService(
      locator<ApiClient>(),
    ),
  );

  locator.registerLazySingleton<LibraryCubit>(
    () => LibraryCubit(
      locator<GameService>(),
    ),
  );
}
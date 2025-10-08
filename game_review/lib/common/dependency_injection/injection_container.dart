import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_review/features/registration_screen/bloc/register_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/core/services/game_service.dart';
import 'package:game_review/core/services/review_service.dart';
import 'package:game_review/features/auth/auth_service.dart';
import 'package:game_review/features/auth/bloc/auth_cubit.dart';
import 'package:game_review/features/game_details/bloc/game_details_cubit.dart';

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

  locator.registerLazySingleton<RegistrationCubit>(
    () => RegistrationCubit(),
  );

  locator.registerLazySingleton<AuthCubit>(
    () => AuthCubit(
      locator<AuthService>(),
    ),
  );

  locator.registerLazySingleton<GameService>(
    () => GameService(locator<ApiClient>(), locator<AuthService>()),
  );

  locator.registerLazySingleton<ReviewService>(
    () => ReviewService(locator<ApiClient>()),
  );

  locator.registerFactory<GameDetailsCubit>(
    () => GameDetailsCubit(gameService: locator<GameService>()),
  );
}

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_review/common/blocs/games_cubit.dart';
import 'package:game_review/common/blocs/review_cubit.dart';
import 'package:game_review/common/services/games_service.dart';
import 'package:game_review/common/services/reviews_service.dart';
import 'package:game_review/features/profile_screen/services/user_service.dart';
import 'package:game_review/features/registration_screen/bloc/register_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/features/auth/auth_service.dart';
import 'package:game_review/features/auth/bloc/auth_cubit.dart';

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

  locator.registerLazySingleton<GamesService>(
    () => GamesService(locator<ApiClient>()),
  );

  locator.registerFactory<GamesCubit>(
    () => GamesCubit(locator<GamesService>()),
  );

  locator.registerLazySingleton<RegistrationCubit>(
    () => RegistrationCubit(),
  );

  locator.registerLazySingleton<AuthCubit>(
    () => AuthCubit(
      locator<AuthService>(),
    ),
  );

  locator.registerLazySingleton<ReviewsService>(
    () => ReviewsService(locator<ApiClient>()),
  );

  locator.registerFactory<ReviewsCubit>(
    () => ReviewsCubit(locator<ReviewsService>()),
  );

  locator.registerLazySingleton<UserService>(
    () => UserService(locator<ApiClient>()),
  );
}

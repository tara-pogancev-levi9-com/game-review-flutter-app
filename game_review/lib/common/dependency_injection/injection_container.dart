import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_review/common/blocs/games_cubit.dart';
import 'package:game_review/common/blocs/review_form_cubit.dart';
import 'package:game_review/common/blocs/reviews_by_game_cubit.dart';
import 'package:game_review/common/blocs/reviews_by_user_cubit.dart';
import 'package:game_review/common/services/reviews_service.dart';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/core/services/game_service.dart';
import 'package:game_review/core/services/review_service.dart';
import 'package:game_review/features/auth/services/auth_service.dart';
import 'package:game_review/features/game_details/bloc/game_details_cubit.dart';
import 'package:game_review/features/home_screen/bloc/home_cubit.dart';
import 'package:game_review/features/home_screen/bloc/review_comments_cubit.dart';
import 'package:game_review/features/home_screen/services/review_comment_service.dart';
import 'package:game_review/features/library_screen/bloc/library_cubit.dart';
import 'package:game_review/features/profile_screen/services/user_service.dart';
import 'package:game_review/features/registration_screen/bloc/register_cubit.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:get_it/get_it.dart';

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

  locator.registerLazySingleton<GameService>(
    () => GameService(locator<ApiClient>(), locator<AuthService>()),
  );

  locator.registerFactory<GamesCubit>(
    () => GamesCubit(locator<GameService>()),
  );

  locator.registerLazySingleton<RegistrationCubit>(
    () => RegistrationCubit(),
  );

  locator.registerLazySingleton<LibraryCubit>(
    () => LibraryCubit(
      locator<GameService>(),
    ),
  );

  locator.registerLazySingleton<HomeCubit>(
    () => HomeCubit(
      locator<GameService>(),
      locator<ReviewsService>(),
    ),
  );

  locator.registerLazySingleton<ReviewCommentService>(
    () => ReviewCommentService(locator<ApiClient>()),
  );

  locator.registerLazySingleton<ReviewCommentsCubit>(
    () => ReviewCommentsCubit(locator<ReviewCommentService>()),
  );

  locator.registerLazySingleton<ReviewsService>(
    () => ReviewsService(locator<ApiClient>()),
  );

  locator.registerLazySingleton<UserService>(
    () => UserService(locator<ApiClient>()),
  );

  locator.registerFactory<ReviewFormCubit>(
    () => ReviewFormCubit(locator<ReviewsService>()),
  );

  locator.registerFactory<ReviewsByGameCubit>(
    () => ReviewsByGameCubit(locator<ReviewsService>()),
  );

  locator.registerFactory<ReviewsByUserCubit>(
    () => ReviewsByUserCubit(locator<ReviewsService>()),
  );

  locator.registerLazySingleton<ReviewService>(
    () => ReviewService(locator<ApiClient>(), locator<AuthService>()),
  );

  locator.registerFactory<GameDetailsCubit>(
    () => GameDetailsCubit(gameService: locator<GameService>()),
  );
}

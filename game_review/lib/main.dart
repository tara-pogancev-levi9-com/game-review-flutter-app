import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_review/features/auth/screens/auth_gate.dart';

import 'i18n/strings.g.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart' as di;
import 'package:game_review/common/theme/app_theme.dart';
import 'package:game_review/screens/error_screen.dart';
import 'package:game_review/common/utils/logger.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/features/auth/bloc/auth_cubit.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    await dotenv.load(fileName: ".env");

    final String? encryptionKey = dotenv.env['ENCRYPTION_KEY'];
    if (encryptionKey == null || encryptionKey.isEmpty) {
      throw Exception('ENCRYPTION_KEY not found in .env file.');
    }

    EncryptedSharedPreferences.initialize(encryptionKey);
    di.setupDependencies();

    LocaleSettings.setLocaleSync(AppLocale.en);
    await di.locator<AuthCubit>().checkAuthStatus();
    runApp(TranslationProvider(child: const MyApp()));
  } catch (e, st) {
    Logger.error('App start failed: $e\n$st');
    runApp(ErrorScreen(error: e.toString()));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.locator<AuthCubit>(),
      child: MaterialApp(
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        title: 'Game Review App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        home: const AuthGate(),
      ),
    );
  }
}

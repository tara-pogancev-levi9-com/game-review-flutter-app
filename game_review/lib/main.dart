import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'i18n/strings.g.dart';

import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/welcome_screen/welcomePage.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.setLocaleSync(AppLocale.en);
  runApp(TranslationProvider(child: MyApp()));
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark
        ),
      ),
      home: const WelcomePage(),
    );
  }
}

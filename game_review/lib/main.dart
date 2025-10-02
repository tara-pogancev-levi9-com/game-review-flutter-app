import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:encrypt_shared_preferences/provider.dart'; 
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/screens/error_screen.dart';
import 'package:game_review/screens/auth_testing_screen.dart';
import 'package:game_review/common/utils/logger.dart'; 

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    await dotenv.load(fileName: ".env");

    final String encryptionKey = dotenv.env['ENCRYPTION_KEY']!; 
    EncryptedSharedPreferences.initialize(encryptionKey);

    setup();
    
    runApp(const MyApp());

  } catch (e) {
    Logger.error(e.toString());

    runApp(ErrorScreen(error: e.toString()));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Review App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthTestingScreen(),
    );
  }
}
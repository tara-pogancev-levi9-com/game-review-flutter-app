import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:encrypt_shared_preferences/provider.dart'; 
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/features/auth/auth_service.dart';

Future<void> main() async {
  try {

    WidgetsFlutterBinding.ensureInitialized();

    await dotenv.load(fileName: ".env");
    print(".env file loaded successfully.");

    final String encryptionKey = dotenv.env['ENCRYPTION_KEY']!; 
    EncryptedSharedPreferences.initialize(encryptionKey);

    print("ApiClient initialized successfully.");
    setup();
    runApp(const MyApp());

  } catch (e) {
    print("AN ERROR OCCURRED DURING APP STARTUP");
    print(e.toString());

    runApp(ErrorScreen(error: e.toString()));
  }
}

class ErrorScreen extends StatelessWidget {
  final String error;
  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              'App failed to start:\n\n$error',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void _testApiCall() async {
    print('--- Triggering Test API Call ---');
    try {
      final apiClient = locator<ApiClient>();

      final response = await apiClient.dio.get('/');
      print('API Call Success:');
      print(response.data);
    } catch (e) {
      print('API Call Failed:');
      print(e.toString());
    }
  }

  void _testSignup() async {
    print('--- Testing Signup ---');
    try {
      final authService = locator<AuthService>();
      
      bool success = await authService.signup('newuser@example.com', 'password123');
      if (success) {
        print('Signup successful!');
      } else {
        print('Signup failed!');
      }
    } catch (e) {
      print('Signup error: $e');
    }
  }

    void _testLogin() async {
    print('--- Testing Login ---');
    try {
      final authService = locator<AuthService>();

      bool success = await authService.login('newuser@example.com', 'password123');
      if (success) {
        print('Login successful!');
      } else {
        print('Login failed!');
      }
    } catch (e) {
      print('Login error: $e');
    }
  }

  void _testLogout() async {
    print('--- Testing Logout ---');
    try {
      final authService = locator<AuthService>();
      await authService.logout();
      print('Logout successful!');
    } catch (e) {
      print('Logout error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('API Test with Dependency Injection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Test your API and Authentication:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _testApiCall,
              child: const Text('Test API Call'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _testSignup, // ADD THIS BUTTON
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green[400]),
              child: const Text('Test Signup'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _testLogin,
              child: const Text('Test Login'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _testLogout,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red[400]),
              child: const Text('Test Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
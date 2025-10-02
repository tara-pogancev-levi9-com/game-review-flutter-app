import 'package:flutter/material.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/core/storage/secure_storage.dart';
import 'package:game_review/features/auth/auth_service.dart';
import 'package:game_review/common/utils/logger.dart';

class AuthTestingScreen extends StatelessWidget {
  const AuthTestingScreen({super.key});

  void _testApiCall() async {
    try {
      final apiClient = locator<ApiClient>();
      final response = await apiClient.get('/rest/v1/');
      Logger.info('API Call Success: ${response.data}');
    } catch (e) {
      Logger.error('API call error', e);
    }
  }

  void _testSignup() async {
    Logger.info('--- Testing Signup ---');
    try {
      final authService = locator<AuthService>();
      bool success = await authService.signup('newuser@example.com', 'password123');
      if (success) {
        Logger.info('Signup successful!');
      } else {
        Logger.warning('Signup failed!');
      }
    } catch (e) {
      Logger.error('Signup error', e);
    }
  }

  void _testLogin() async {
    Logger.info('--- Testing Login ---');
    try {
      final authService = locator<AuthService>();
      bool success = await authService.login('newuser@example.com', 'password123');
      if (success) {
        Logger.info('Login successful!');
      } else {
        Logger.warning('Login failed!');
      }
    } catch (e) {
      Logger.error('Login error', e);
    }
  }

  void _testLogout() async {
    Logger.info('--- Testing Logout ---');
    try {
      final authService = locator<AuthService>();
      await authService.logout();
      Logger.info('Logout successful!');
    } catch (e) {
      Logger.error('Logout error', e);
    }
  }
  
  void _checkToken() async {
    final token = await SecureStorage.getToken();
    if (token != null) {
      Logger.info('Token found: $token');
    } else {
      Logger.warning('No token found in storage.');
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
              onPressed: _testSignup,
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkToken,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[400]),
              child: const Text('Check Token'),
            ),
          ],
        ),
      ),
    );
  }
}
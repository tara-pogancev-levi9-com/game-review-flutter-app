import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/core/storage/secure_storage.dart';
import 'package:game_review/features/auth/bloc/auth_cubit.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/utils/logger.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
    final gradients = Theme.of(context).extension<AppGradients>()!;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: DecoratedBox(
        decoration: BoxDecoration(gradient: gradients.background),
        child: Stack(
          children: [
            Positioned(
              top: -100,
              left: 0,
              right: 0,
              child: Image(
                image: AssetImage('lib/common/assets/images/Games.png'),
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 250),
                Image(image: AssetImage('lib/common/assets/images/Logo.png')),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: ElevatedButton(
                          onPressed: () {
                            //TODO: Implement on pressed navigation to login page
                            context
                                .read<AuthCubit>()
                                .login('newuser@example.com', 'password123');
                          },
                          child: Text(
                            t.login,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: OutlinedButton(
                          onPressed: () {
                            //TODO: Implement on pressed navigation to login page
                          },
                          child: Text(
                            t.register,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 45.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: OutlinedButton(
                          onPressed: () {
                            if (LocaleSettings.currentLocale == AppLocale.en) {
                              LocaleSettings.setLocale(AppLocale.sr);
                            } else {
                              LocaleSettings.setLocale(AppLocale.en);
                            }
                          },
                          child: Text(t.changeLanguage),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: ElevatedButton(
                          onPressed: _checkToken,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[400]),
                          child: const Text('Check Token'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

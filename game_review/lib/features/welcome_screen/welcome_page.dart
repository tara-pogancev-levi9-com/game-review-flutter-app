import 'package:flutter/material.dart';
import 'package:game_review/common/app_logo.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/features/auth/login_page.dart';
import 'package:game_review/features/registration_screen/registration.dart';
import 'package:game_review/i18n/strings.g.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final gradients =
        Theme.of(context).extension<AppGradients>() ?? AppGradients.dark;

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
                AppLogo(),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistrationPage(),
                              ),
                            );
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

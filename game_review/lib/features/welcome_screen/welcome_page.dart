import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
                          },
                          child: Text(
                            "Login",
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
                            "Register",
                          ),
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

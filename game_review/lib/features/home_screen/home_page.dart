import 'package:flutter/material.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/auth/bloc/auth_cubit.dart';
import 'package:game_review/features/profile_screen/profile_page.dart';
import 'package:game_review/i18n/strings.g.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home_rounded,
            size: 80,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            context.t.home,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          IconButton(
            onPressed: () {
              locator<AuthCubit>().logout();
            },
            icon: Icon(
              Icons.logout,
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Column(
              children: [
                Text("Username"),
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          currentUserId: '08b35fd2-3576-4ec9-9638-2c493573f8ea',
                          isStandalone: true,
                        ),
                      ),
                    );
                  },
                  child: Text("Go to profile"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

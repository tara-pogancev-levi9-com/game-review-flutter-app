import 'package:flutter/material.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/auth/bloc/auth_cubit.dart';
import 'package:game_review/features/auth/login_page.dart';
import 'package:game_review/i18n/strings.g.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_rounded,
            size: 80,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            context.t.navigation.search,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          IconButton(
            onPressed: () async {
              await locator<AuthCubit>().logout();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
                (Route<dynamic> route) => false,
              );
            },
            icon: Icon(
              Icons.logout,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

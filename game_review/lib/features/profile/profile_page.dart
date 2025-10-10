import 'package:flutter/material.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/auth/bloc/auth_cubit.dart';
import 'package:game_review/i18n/strings.g.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_rounded,
            size: 80,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            context.t.navigation.profile,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              locator<AuthCubit>().logout();
            },
            icon: const Icon(Icons.logout),
            label: Text(context.t.logout),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
          ),
        ],
      ),
    );
  }
}

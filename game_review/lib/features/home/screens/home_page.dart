import 'package:flutter/material.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/auth/bloc/auth_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              locator<AuthCubit>().logout();
            }
          )
        ]
      ),
      body: const Center(
        child: Text("Welcome to the Home Page!"),
      ),
    );
  }
}
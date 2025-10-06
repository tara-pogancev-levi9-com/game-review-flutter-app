import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/auth/bloc/auth_cubit.dart';
import 'package:game_review/features/auth/bloc/auth_state.dart';
import 'package:game_review/features/welcome_screen/welcome_page.dart';
import 'package:game_review/features/main_screen/main_screen.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      bloc: locator<AuthCubit>(),
      builder: (context, state) {
        return switch (state) {
          Authenticated() => const MainScreen(),
          Unauthenticated() => const WelcomePage(),
          AuthInitial() => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        };
      },
    );
  }
}
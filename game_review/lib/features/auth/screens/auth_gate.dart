import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/features/auth/bloc/auth_cubit.dart';
import 'package:game_review/features/auth/bloc/auth_state.dart';
import 'package:game_review/features/home/screens/home_page.dart';
import 'package:game_review/features/welcome_screen/welcome_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return const HomePage();
        } else if (state is Unauthenticated) {
          return const WelcomePage();
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
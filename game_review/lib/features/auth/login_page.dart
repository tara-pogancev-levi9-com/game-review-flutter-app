import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/app_logo.dart';
import 'package:game_review/common/theme/app_fonts.dart';
import 'package:game_review/features/main_screen/main_screen.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:game_review/common/theme/app_colors.dart';

import 'auth_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() != true) return;
    context.read<AuthCubit>().login(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = t;

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: Theme.of(context).extension<AppGradients>()?.background,
        ),
        child: SafeArea(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
              if (state is AuthSuccess) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const MainScreen()),
                  (route) => false,
                );
              }
            },
            builder: (context, state) {
              final bool isLoading = state is AuthLoading;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: AutofillGroup(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextButton.icon(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 6,
                                ),
                                minimumSize: const Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () => Navigator.of(context).maybePop(),
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                size: 22,
                              ),
                              label: const Text(
                                'Back',
                                style: TextStyle(
                                  fontFamily: AppFonts.josefinSans,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 60),
                          AppLogo(),
                          const SizedBox(height: 70),
                          TextFormField(
                            controller: _emailController,
                            autofillHints: const [
                              AutofillHints.username,
                              AutofillHints.email,
                            ],
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: l.email,
                              prefixIcon: const Icon(
                                Icons.alternate_email,
                                color: AppColors.lilacSelected,
                              ),
                            ),
                            validator: (value) {
                              final text = value?.trim() ?? '';
                              if (text.isEmpty) return '${l.email} required';
                              final emailRegex = RegExp(
                                r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                              );
                              if (!emailRegex.hasMatch(text)) {
                                return 'Invalid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _passwordController,
                            autofillHints: const [AutofillHints.password],
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              hintText: l.password,
                              prefixIcon: const Icon(
                                Icons.password,
                                color: AppColors.lilacSelected,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColors.lilacSelected,
                                ),
                                onPressed: () => setState(
                                  () => _obscurePassword = !_obscurePassword,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if ((value ?? '').isEmpty) {
                                return '${l.password} required';
                              }
                              if ((value ?? '').length < 6) {
                                return 'Min 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 180),
                          ElevatedButton(
                            onPressed: isLoading ? null : _onSubmit,
                            child: isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(l.login),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

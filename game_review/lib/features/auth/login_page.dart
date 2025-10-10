import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/app_logo.dart';
import 'package:game_review/common/theme/app_fonts.dart';
import 'package:game_review/common/validation/validators.dart';
import 'package:game_review/common/widgets/loading_button.dart';
import 'package:game_review/features/main_screen/main_screen.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';

import 'bloc/auth_cubit.dart';
import 'bloc/auth_state.dart';

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
    locator<AuthCubit>().login(
      _emailController.text.trim(),
      _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        leading: const BackButton(color: Colors.white),
        title: Text(
          t.back,
          style: const TextStyle(
            fontFamily: AppFonts.josefinSans,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: Theme.of(context).extension<AppGradients>()?.background,
        ),
        child: BlocConsumer<AuthCubit, AuthState>(
          bloc: locator<AuthCubit>(),
          listener: (context, state) {
            if (state is Unauthenticated && state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage!)),
              );
            }
            if (state is Authenticated) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const MainScreen()),
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            final bool isLoading = state is AuthLoading;
            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                16,
                topInset + kToolbarHeight + 16,
                16,
                16,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AutofillGroup(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 60),
                        const AppLogo(),
                        const SizedBox(height: 70),
                        TextFormField(
                          controller: _emailController,
                          autofillHints: const [
                            AutofillHints.username,
                            AutofillHints.email,
                          ],
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: t.email,
                            prefixIcon: const Icon(
                              Icons.alternate_email,
                              color: AppColors.lilacSelected,
                            ),
                          ),
                          validator: Validators.email(context),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          autofillHints: const [AutofillHints.password],
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: t.password,
                            prefixIcon: const Icon(
                              Icons.password,
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
                          validator: Validators.password(context, minLength: 6),
                        ),
                        const SizedBox(height: 180),
                        LoadingButton(
                          isLoading: isLoading,
                          onPressed: _onSubmit,
                          text: t.login,
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
    );
  }
}

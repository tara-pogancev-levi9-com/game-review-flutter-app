import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/app_logo.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/validation/validators.dart';
import 'package:game_review/features/auth/login_page.dart';
import 'package:game_review/features/main_screen/main_screen.dart';
import 'package:game_review/features/registration_screen/bloc/register_cubit.dart';
import 'package:game_review/features/registration_screen/models/login_model.dart';
import 'package:game_review/features/registration_screen/models/registration_model.dart';

import '../../common/theme/app_fonts.dart';
import '../../i18n/strings.g.dart';
import 'bloc/registration_state.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool showPassword = false;
  bool showConfirmPassword = false;
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _confirmPasswordKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();
  final _emailKey = GlobalKey<FormFieldState>();
  final _usernameKey = GlobalKey<FormFieldState>();

  bool hasBeenSubmitted = false;

  void _onSubmit() {
    setState(() {
      hasBeenSubmitted = true;
    });

    if (_formKey.currentState!.validate()) {
      final registrationData = RegistrationModel(
        email: _emailController.text,
        username: _usernameController.text,
        password: _passwordController.text,
      );

      locator<RegistrationCubit>().signup(registrationData);
    }
  }

  @override
  Widget build(BuildContext context) {
    final gradients = Theme.of(context).extension<AppGradients>()!;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 100,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Text(
              t.back,
              style: const TextStyle(
                fontFamily: AppFonts.josefinSans,
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: BlocConsumer<RegistrationCubit, RegistrationState>(
        bloc: locator<RegistrationCubit>(),
        listener: (context, state) {
          if (state is RegistrationSuccess) {
            locator<RegistrationCubit>().login(
              LoginModel(
                email: _emailController.text,
                password: _passwordController.text,
              ),
            );
          } else if (state is RegistrationInitial) {
          } else if (state is RegistrationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          } else if (state is LoginAfterRegistrationSuccess) {
            final navigator = Navigator.of(context);
            Future.delayed(const Duration(seconds: 1), () {
              navigator.pushReplacement(
                MaterialPageRoute(builder: (_) => const MainScreen()),
              );
            });
          } else if (state is LoginAfterRegistrationFailure) {
            final navigator = Navigator.of(context);
            Future.delayed(const Duration(seconds: 1), () {
              navigator.pushReplacement(
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            });
          }
        },
        builder: (context, state) {
          final isLoading = state is RegistrationLoading;

          return Stack(
            children: [
              AbsorbPointer(
                absorbing: isLoading,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(gradient: gradients.background),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsetsGeometry.fromLTRB(0, 150, 0, 0),
                          child: AppLogo(),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Form(
                          key: _formKey,
                          autovalidateMode: hasBeenSubmitted
                              ? AutovalidateMode.onUserInteraction
                              : AutovalidateMode.disabled,

                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Column(
                              children: [
                                TextFormField(
                                  key: _emailKey,
                                  autocorrect: false,
                                  autofillHints: null,
                                  enableSuggestions: false,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  controller: _emailController,
                                  onChanged: (value) {
                                    if (hasBeenSubmitted) {
                                      _emailKey.currentState?.validate();
                                    }
                                  },
                                  validator: Validators.email(context),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.email_outlined,
                                    ),
                                    labelText: t.email,
                                    labelStyle: const TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  key: _usernameKey,
                                  controller: _usernameController,
                                  autocorrect: false,
                                  autofillHints: null,
                                  enableSuggestions: false,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    if (hasBeenSubmitted) {
                                      _usernameKey.currentState?.validate();
                                    }
                                  },
                                  validator: Validators.required(
                                    context,
                                    fieldLabel: t.username,
                                  ),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.person_2_outlined,
                                    ),
                                    labelText: t.username,
                                    labelStyle: const TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  key: _passwordKey,
                                  controller: _passwordController,
                                  autocorrect: false,
                                  autofillHints: null,
                                  enableSuggestions: false,
                                  obscureText: !showPassword,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    if (hasBeenSubmitted) {
                                      _passwordKey.currentState?.validate();
                                      _confirmPasswordKey.currentState
                                          ?.validate();
                                    }
                                  },
                                  validator: Validators.password(
                                    context,
                                    minLength: 8,
                                  ),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.password),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showPassword = !showPassword;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.remove_red_eye_outlined,
                                      ),
                                    ),
                                    errorStyle: null,
                                    labelText: t.password,
                                    labelStyle: const TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  key: _confirmPasswordKey,
                                  autocorrect: false,
                                  autofillHints: null,
                                  enableSuggestions: false,
                                  controller: _confirmPasswordController,
                                  keyboardType: TextInputType.text,
                                  obscureText: !showConfirmPassword,
                                  textInputAction: TextInputAction.done,
                                  onFieldSubmitted: (_) => _onSubmit(),
                                  onChanged: (value) {
                                    if (hasBeenSubmitted) {
                                      _confirmPasswordKey.currentState
                                          ?.validate();
                                    }
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return t.confirmPassword;
                                    }
                                    if (value != _passwordController.text) {
                                      return t.errors.passwordMismatch;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.password),

                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showConfirmPassword =
                                              !showConfirmPassword;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.remove_red_eye_outlined,
                                      ),
                                    ),
                                    labelText: t.confirmPassword,
                                    labelStyle: const TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 40,
                                        ),

                                        child: ElevatedButton(
                                          onPressed: _onSubmit,
                                          child: Text(
                                            t.register,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (isLoading)
                const Opacity(
                  opacity: 0.3,
                  child: ModalBarrier(
                    dismissible: false,
                    color: Colors.black38,
                  ),
                ),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }
}
